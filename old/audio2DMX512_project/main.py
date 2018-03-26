#!/usr/bin/env python3

#!/usr/bin/env python3
#1347/1594
#https://github.com/tyiannak/pyAudioAnalysis
#https://github.com/tyiannak/paura
#https://github.com/tlecomte/friture
#https://github.com/danilobellini/audiolazy
#https://github.com/belangeo/pyo
#https://github.com/spatialaudio/python-sounddevice/

import numpy
import jack
import time
import threading

import numpy as np
from matplotlib import pyplot as plt
CHUNKSIZE = 128 # number of data points to read at a time
RATE = 44100 # time resolution of the recording device (Hz)

event = threading.Event()

client = jack.Client("audio2DMX512")
client.blocksize = 128  # устанавливает буффер сервера
in_port = client.inports.register("input", is_terminal=True)
# client.get_ports()


@client.set_shutdown_callback
def shutdown(status, reason):
    print('JACK shutdown!')
    print('status:', status)
    print('reason:', reason)
    event.set()

ring_buffer = jack.RingBuffer(2048)


@client.set_process_callback
def process(frames):
    # assert frames == client.blocksize
    try:
        # ring_buffer.write_buffers[0][0:128] = in_port.get_array()  # отдаёт 128 - то что настроено в сервере
        ring_buffer.write_buffers[0][0:512] = in_port.get_buffer()[0:512]  # работает!!!
    except (IndexError, ValueError):
        pass
    finally:
        ring_buffer.write_advance(512)

def ring_processing():
    try:
        # data = ring_buffer.read_buffers[0][:]
        data = np.fromstring(ring_buffer.read_buffers[0][0:512], dtype=np.float32)  # 16 bit per sample
        # data = ring_buffer.read_buffers[0][0:ring_buffer.read_space] # get->512
        peak = np.average(np.abs(data))*1000
        if peak != peak:
            peak = 0
        print(int(peak) * '#')
        # return bars
    except IndexError:
        pass
        # print('pass')
    finally:
        ring_buffer.read_advance(ring_buffer.read_space)

with client:
    client.connect('Bitwig Studio:Stereo Output-R', in_port)

    while time.time() + 0.001 > time.time():
        time.sleep(.01)
        ring_processing()

    ring_buffer.mlock()




    print('Press Ctrl+C to stop')

    try:
        event.wait()
    except KeyboardInterrupt:
        print('\nInterrupted by user')

#!/usr/bin/env python3.6

import os
import errno
import subprocess
import threading
import time


DMX_PIPE = 'fifo_dmx512.pipe'
STATUS_PIPE = 'fifo_status.pipe'


class DmxWriter(threading.Thread):
    """
    """
    def __init__(self, ftdi_dmx_queue=None):
        self._ftdi_dmx_queue = ftdi_dmx_queue
        self._create_fifo_file(DMX_PIPE)
        self._create_fifo_file(STATUS_PIPE)
        self._init_ftdi_dmx512_pipe()
        threading.Thread.__init__(self, name='Dmx Writer')

    def run(self):
        while True:
            self._send_frame(self._ftdi_dmx_queue.get(block=True))
            self._ftdi_dmx_queue.task_done()

    def _send_frame(self, frame: str):
        assert type(frame) == str, 'frame must be string'  # какая никакая проверка
        with open(DMX_PIPE, mode='wb', buffering=0) as fifo:
            fifo.write(frame.encode())
        # print('waiting for status')
        with open(STATUS_PIPE, mode='r') as fifo_status:
            fifo_status.readline()
            # print('status received: ', fifo_status.readline())

    def _create_fifo_file(self, fifo):
        try:
            if os.path.exists(fifo):
                os.unlink(fifo)
            os.mkfifo(fifo, mode=0o666)
        except OSError as error:
            if error.errno != errno.EEXIST:
                raise error

    def _init_ftdi_dmx512_pipe(self):
        self._ftdi_dmx512_pipe = subprocess.Popen(
            ['./a.out', DMX_PIPE, STATUS_PIPE],
            stdin=subprocess.DEVNULL,
            stdout=subprocess.DEVNULL)

    def _deinit_ftdi_dmx512_pipe(self):
        self._ftdi_dmx512_pipe.terminate()  # terminate subprocess
        self._ftdi_dmx512_pipe.wait()  # wait for termination complete












#

#!/usr/bin/env python3

#  различие fifo и сокетов: https://toster.ru/q/2995
"""Once you have created a FIFO special file,
any process can open it for reading or writing,
in the same way as an ordinary file. However,
it has to be open at both ends simultaneously before
you can proceed to do any input or output operations on it.
Opening a FIFO for reading normally blocks until
some other process opens the same FIFO for writing, and vice versa."""

import os
import errno
import time
import subprocess

FIFO_DMX = 'fifo_dmx512.pipe'
FIFO_STATUS = 'fifo_status.pipe'


def make_fifo(fifo):
    try:
        if os.path.exists(fifo):
            os.unlink(fifo)
        os.mkfifo(fifo, mode=0o666)
    except OSError as error:
        if error.errno != errno.EEXIST:
            raise error


make_fifo(FIFO_DMX)
make_fifo(FIFO_STATUS)

driver_process = subprocess.Popen(
    ['./a.out', FIFO_DMX, FIFO_STATUS],
    stdin=subprocess.DEVNULL,
    stdout=subprocess.DEVNULL)
print('fifos created and driver spawned with pid: ', driver_process.pid)

while True:
    print('opening fifo')
    with open(FIFO_DMX, mode='wb', buffering=0) as fifo:
        data = input('input data: ')
        if data == 'q':
            break
        fifo.write(data.encode())
    # fifo.close()

    print('waiting for status')
    with open(FIFO_STATUS, mode='r') as fifo_status:
        print('status received: ', fifo_status.readline())

driver_process.terminate()
driver_process.wait()
print('exited')





#

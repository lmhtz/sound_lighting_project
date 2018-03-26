#!/usr/bin/env python3
"""Once you have created a FIFO special file,
any process can open it for reading or writing,
in the same way as an ordinary file. However,
it has to be open at both ends simultaneously before
you can proceed to do any input or output operations on it.
Opening a FIFO for reading normally blocks until
some other process opens the same FIFO for writing, and vice versa."""

import os, errno, time

FIFO = 'test.pipe'

try:
    os.mkfifo(FIFO, mode=0o666)
except OSError as error:
    if error.errno != errno.EEXIST:
        raise


print('opening fifo')
with open(FIFO, mode='wb', buffering=0) as fifo:
    print('writing to fifo')
    while True:
        data = input('input: ')
        data +='\n'
        fifo.write(data.encode())

#!/usr/bin/env python3
'''
sudo pip3 install pyserial
'''


import serial
import threading
from color_spaces import RGB


class UartWriter(threading.Thread):
    def __init__(self):
        threading.Thread.__init__(self)
        self.data = RGB()
        self.pre = RGB()
        self.process = threading.Event()
        self.connection = serial.Serial(
            port='/dev/ttyUSB0',
            baudrate=38400,
            parity=serial.PARITY_NONE,
            stopbits=serial.STOPBITS_ONE,
            bytesize=serial.EIGHTBITS
        )

    def _prepere_frame(self):  # попробовать реализовать _prepere_frame лучше
        self.frame = (str(self.data.R)
                      + ',' + str(self.data.G)
                      + ',' + str(self.data.B)
                      + ',1,1,1\n')
        self.frame = '+IPD,0,' + str(len(self.frame) - 1) + ':' + self.frame
        # print(self.frame)
        # print(self.rgb.R)

    def _send_frame(self):
        self._prepere_frame()
        self.connection.write(self.frame.encode())
        self.connection.flush()

    def __del__(self):
        self.connection.close()

    def run(self):
        try:
            while True:
                self._send_frame()
        except KeyboardInterrupt:
            print('\nInterrupted by user')
        finally:
            self.connection.close()

#!/usr/bin/env python3

import serial, time


ser = serial.Serial(
    port='/dev/ttyUSB0',
    baudrate=38400,
    parity=serial.PARITY_NONE,
    stopbits=serial.STOPBITS_TWO,
    bytesize=serial.EIGHTBITS,
)

DMXINTENSITY = chr(6)+chr(1)+chr(2)

def senddmx(data, channel, intensity):
        # because the spacer bit is [0], the channel number is the array item number
        # set the channel number to the proper value
        data[channel]=chr(intensity)
        # join turns the array data into a string we can send down the DMX
        sdata = ''.join(data)
        # write the data to the serial port, this sends the data to your fixture
        ser.write(START_VAL + DMXINTENSITY + sdata + END_VAL)
        ser.flush()
        # return the data with the new value in place
        return(data)


START_VAL = chr(126)
END_VAL = chr(231)
DMXINTENSITY = chr(6) + chr(1) + chr(2)
DMX_SIZE = 513


dmx_frame = bytearray(DMX_SIZE)

# Break condition
# Mark-After-Break
# Slot 0, containing the one-byte Start Code
# Up to 512 slots channel data, each containing one byte

pre = bytearray(4)
pre[0] = 0 # 126 ~
pre[1] = 255  # a
pre[2] = 255
pre[3] = 0

dmx_frame = bytearray(513)
dmx_frame[0] = 0
dmx_frame[1] = 255
dmx_frame[2] = 0
dmx_frame[3] = 0

post = bytearray(1)
post[0] = 231

print(pre + dmx_frame + post)
ser.write(pre + dmx_frame + post)
ser.flush()



#

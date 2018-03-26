#!/usr/bin/env python3.6
'''
pacman -S libftdi libftdi-compact
'''

import buffer
import dmx_writer
import threading
import queue
import time
# import randomcolor
import random
import colorsys
from cie1931 import cie_1931_256

# buf_cond_new_frame = threading.Condition()
ftdi_dmx_queue = queue.Queue()
buf_chains_queue = queue.Queue()

buffer = buffer.DmxBuffer(ftdi_dmx_queue=ftdi_dmx_queue, buf_chains_queue=buf_chains_queue)
writer = dmx_writer.DmxWriter(ftdi_dmx_queue=ftdi_dmx_queue)

buffer.start()
writer.start()


# random_color = randomcolor.RandomColor()
while True:
    # ch = int(input('channel: '))
    # val = int(input('value: '))
    # buf_chains_queue.put((ch, val)) # SEND TUPLE!

    # new_random_hsv_color = random_color.generate(luminosity='bright', format_='hsv')

    hsv_Hue = round(random.random(), 3)
    hsv_Saturation = 1.0
    hsv_Value = 0.0

    # print('HSV: ', round(hsv_Hue, 1), round(hsv_Saturation, 1), round(hsv_Value, 1))

    while(True):
        R, G, B = (colorsys.hsv_to_rgb(hsv_Hue, hsv_Saturation, hsv_Value))
        # print('aaa', R, G, B)
        if (R or G or B) > 0.3: break
        R = cie_1931_256[round(R * 255)]
        G = cie_1931_256[round(G * 255)]
        B = cie_1931_256[round(B * 255)]
        # print('RGB: ', R, G, B)
        RGB = (0, R, 1, G, 2, B)
        # print(round(hsv_Value*100))
        buf_chains_queue.put(RGB)
        hsv_Value += .001
        time.sleep(.1)

    # hsv_Value = 1.0

    while(True):
        R, G, B = (colorsys.hsv_to_rgb(hsv_Hue, hsv_Saturation, hsv_Value))
        if (R < 0 or G < 0 or B < 0): break
        # print('RGB: ', round(R*255), round(G*255), round(B*255))
        R = cie_1931_256[round(R * 255)]
        G = cie_1931_256[round(G * 255)]
        B = cie_1931_256[round(B * 255)]
        RGB = (0, R, 1, G, 2, B)
        # print(RGB)
        # print(round(hsv_Value*100))
        buf_chains_queue.put(RGB)
        hsv_Value -= .001
        time.sleep(.1)









#

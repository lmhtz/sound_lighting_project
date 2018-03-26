#!/usr/bin/env python3

import colorsys
from cie1931 import cie1931_512


class RGB:
    def __init__(self):
        self.R = 0
        self.G = 0
        self.B = 0

    def __setattr__(self, name, value):
        object.__setattr__(self, name, cie1931_512[value])

    def copy(self, source):
        self.R = source.R
        self.G = source.G
        self.B = source.B


class HSV:
    def __init__(self, hue=0, saturation=1.0, value=1.0):
        self.Hue = hue
        self.Saturation = saturation
        self.Value = value

    def toRGB(self):
        rgb = RGB()
        # print(self.Hue, self.Saturation, self.Value)
        R, G, B = (colorsys.hsv_to_rgb(
            self.Hue, self.Saturation, self.Value))
        rgb.R = (round(R * 511))
        rgb.G = (round(G * 511))
        rgb.B = (round(B * 511))
        return rgb

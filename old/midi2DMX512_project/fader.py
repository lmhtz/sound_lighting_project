#!/usr/bin/env python3

import time
import _thread
import random

import color_spaces
import limiter
import uart_writer

MUTEX = _thread.allocate_lock()


class Fader:
    def __init__(self):
        self.attacking = False
        self.releasing = False
        self.rgb = color_spaces.RGB()
        self.hsv = color_spaces.HSV()
        self.writer = uart_writer.UartWriter()
        self.writer.start()
        self.attack_length = .007874015748031496

    attack_length = limiter.Limiter(min=0.007874015748031496, max=1.0)
    release_length = limiter.Limiter(min=0.007874015748031496, max=1.0)

    def _radnomize_color(self):
        randomHue = round(random.random(), 3)
        self.hsv.Hue = randomHue

    def attack(self):
        # print('attack')
        with MUTEX:
            self.releasing = False
            self.attacking = True
        self._radnomize_color()
        V = 1.0 / self.attack_length  # V=S/t
        remain_S = 1.0 - self.hsv.Value
        remain_t = remain_S / V
        end_time = time.time() + remain_t
        while time.time() < end_time:
            if self.releasing:
                _thread.exit()
            t_remained = end_time - time.time()  # осталось
            self.hsv.Value = 1.0 - t_remained * V
            self._switch_color()
            print('attacking:', self.hsv.Value)
        self.hsv.Value = 1.0
        self._switch_color()
        _thread.exit()

    def release(self):
        # print('release')
        with MUTEX:
            self.attacking = False
            self.releasing = True
        V = 1.0 / self.release_length
        remain_S = self.hsv.Value
        remain_t = remain_S / V
        end_time = time.time() + remain_t
        # print(self.attack_length)
        while time.time() < end_time:
            if self.attacking:
                _thread.exit()
            t_remained = end_time - time.time()  # осталось
            self.hsv.Value = t_remained * V
            self._switch_color()
            # print('releasing:', self.hsv.Value)
        self.hsv.Value = 0  # нужно для больших скоростей
        self._switch_color()
        _thread.exit()

    def set_attack_length(self, cc_value):
        self.attack_length = cc_value / 127

    def set_release_length(self, cc_value):
        self.release_length = cc_value / 127

    def _switch_color(self):
        with MUTEX:  # попробовать реализовать только забор для перевода
                    # с мьютексом и конкретно запись - разбить
                    # возможно на два мьютекса
            self.writer.data = self.hsv.toRGB()

#

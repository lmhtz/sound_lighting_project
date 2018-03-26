#!/usr/bin/env python3.6

"""
"""

import threading
import time
from functools import reduce

class DmxBuffer(threading.Thread):
    """
    """
    def __init__(self, ftdi_dmx_queue=None, buf_chains_queue=None):
        self._ftdi_dmx_queue = ftdi_dmx_queue
        self._buf_chains_queue = buf_chains_queue
        self._dmx_buf = {}
        self._frame_string = None
        threading.Thread.__init__(self, name='DMX_Buffer')

    def run(self):
        while True:
            self._pick_channels(self._buf_chains_queue.get())

    def _pick_channels(self, data):
        """ну это пиздец конечно - нужно будет причесать"""
        assert len(data) % 2 == 0, 'channels num must be same as values'
        for i in range(len(data) - 1):
            self._dmx_buf[data[i]] = data[i + 1]
        self._prepare_frame()
        self._ftdi_dmx_queue.put(self._get_frame_string())
        self._remove_empty_channels()
        self._buf_chains_queue.task_done()


    def _remove_empty_channels(self):  # реализовать красиво!
        for ch, val in list(self._dmx_buf.items()):  # because dict.keys() return iterator
            if val == 0:
                del self._dmx_buf[ch]
                # print('zero value channel removed: ', ch)

    def _prepare_frame(self):  # реализовать красиво!
        self._frame_string = str(
            reduce((lambda ch, val: ch + val), self._dmx_buf.items())).strip('()').replace(' ', '')
            #!!!!! ''.join('{},{},'.format(key, val) for key, val in d.items())!!!!!!!!! фишка в .format
            #поэкспириментировать с ним
        # self._frame_string = ','.join(map(str, reduce((lambda ch, val: ch + val),self._dmx_buf.items())))
        # print('_frame_string: ', self._frame_string)

    def _get_frame_string(self) -> str:
        return self._frame_string




#




















#

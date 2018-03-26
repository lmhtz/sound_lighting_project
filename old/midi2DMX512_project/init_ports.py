#!/usr/bin/env python3

import mido
import _thread
mutex = _thread.allocate_lock()
BACKEND = 'mido.backends.rtmidi/UNIX_JACK'
DMX_MIDI_IN = 'input_DMX512'


class Startup:
    def __init__(self, handler):
        self.setMidoBackend()
        self.registerInputPort(handler)

    def test(message):
        print(message)

    def setMidoBackend(self):
        if BACKEND not in str(mido.backend):
            mido.set_backend(BACKEND, load=True)
            print('mido backend set to: ', mido.backend)

    def registerInputPort(self, message_handler):
        for port in mido.get_output_names():
            if DMX_MIDI_IN in port:
                return
        mido.open_input(DMX_MIDI_IN,
                        virtual=True,
                        client_name='Python.mido',
                        callback=message_handler)
        print('midi input port set to: ', DMX_MIDI_IN)

#!/usr/bin/env python3

import _thread
import fader

MUTEX = _thread.allocate_lock()


# комментарий
class Handler:
    def __init__(self, verbose=False):
        self.fader = fader.Fader()
        self.message = None
        # self.fader.release_length = 1.0
        self.verbose = verbose

    def __call__(self, message):
        with MUTEX:
            self.message = message
        self.process_message()

    def process_message(self):
        if self.message.type == 'note_on':
            _thread.start_new_thread(self.fader.attack, ())
            print(self.message)

        elif self.message.type == 'note_off':
            _thread.start_new_thread(self.fader.release, ())

        elif self.message.type == 'control_change':
            print(self.message)
            if self.message.control == 13:
                self.fader.set_attack_length(self.message.value)
            elif self.message.control == 14:
                self.fader.set_release_length(self.message.value)














        # elif self.verbose:
        #     print(self.message)

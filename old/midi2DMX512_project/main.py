#!/usr/bin/env python3

'''
https://answers.bitwig.com/questions/1218/how-do-i-get-midi-inout-of-bws-on-linux
///
cat /proc/asound/cards
sudo modprobe snd_virmidi midi_devs=1
'''

import init_ports
import parser


message_handler = parser.Handler(verbose=False)
init_ports.Startup(handler=message_handler)


# while True:
#     char = input('Enter command: ')
#     if char == 'p':
#         print('paused...')
#         message_handler.paused = True
#     elif char == 'r':
#         print('resumed')
#         message_handler = parser.Handler()
#     elif char == 'v':
#         print('verbose mode')
#         message_handler.verbose = True
#     elif char == 'q':
#         # self.connection.close()
#         print('bye...')
#         import os
#         os._exit(0)
#         # raise SystemExit()  # another way?

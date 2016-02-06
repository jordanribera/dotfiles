#!/usr/bin/env python3
import sys


class Legion():
    default_mode = 'help'
    real_modes = ('help', 'capture', 'invade')

    def help(self):
        print('Please specify a mode.')
        print('Valid modes include:')
        for mode in self.real_modes:
            print('    {}'.format(mode))

    def capture(self):
        print('Capturing...')
        # do stuff
        print('...done.')

    def invade(self):
        print('Invading...')
        # do stuff
        print('...done.')

if __name__ == "__main__":
    legion = Legion()
    mode = legion.default_mode
    if len(sys.argv) > 1:
        if sys.argv[1] in legion.real_modes:
            mode = str(sys.argv[1])

    if mode == 'help':
        legion.help()

    if mode == 'capture':
        legion.capture()

    if mode == 'invade':
        legion.invade()

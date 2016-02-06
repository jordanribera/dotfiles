#!/usr/bin/env python3
import sys
import json
import shutil
from pprint import pprint

class Legion():
    default_mode = 'help'
    real_modes = ('help', 'capture', 'invade')

    def __init__(self, targets):
        self.targets = targets

    def help(self):
        print('Please specify a mode.')
        print('Valid modes include:')
        for mode in self.real_modes:
            print('    {}'.format(mode))

    def capture(self):
        print('Capturing...')
        # do stuff
        for this_target in self.targets.keys():
            print('    capturing {}'.format(this_target))
            home = self.targets[this_target]['home']
            cell = self.targets[this_target]['cell']
            print('{} >> {}'.format(home, cell))
        print('...done.')

    def invade(self):
        print('Invading...')
        # do stuff
        print('...done.')

if __name__ == "__main__":
    with open('targets.json') as targets_file:
        targets = json.load(targets_file)

    legion = Legion(targets)
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

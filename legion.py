#!/usr/bin/env python3

import sys
import json
from os import makedirs
from os import path
import shutil
# from pprint import pprint


class Legion():
    default_mode = 'help'
    real_modes = ('help', 'add', 'capture', 'invade')

    def __init__(self, target_source, cell_location):
        self.target_source = target_source
        self.cell_location = cell_location
        self.load()
        self.home_path = path.expanduser('~')
        self.repo_path = path.dirname(path.realpath(__file__)) + '/'

    @property
    def cell_path(self):
        return self.repo_path + self.cell_location

    def help(self):
        print('Please specify a mode.')
        print('Valid modes include:')
        for mode in self.real_modes:
            print('    {}'.format(mode))

    def add(self, new_item):
        new_target_name = new_item.split('/')[-1]
        new_target_relative_home = new_item.replace(path.expanduser('~'), '~')

        print('added {} to {}'.format(new_target_name, self.target_source))

        new_target = {
            'home': new_target_relative_home,
            'cell': new_target_name
        }
        self.targets[new_target_name] = new_target
        self.save()

    def load(self):
        try:
            with open(self.target_source) as targets_file:
                self.targets = json.load(targets_file)
        except FileNotFoundError:
            print('{} not found, making it.'.format(self.target_source))
            self.targets = {}
            self.save()

    def save(self):
        with open(self.target_source, mode='w') as targets_file:
            json.dump(self.targets, targets_file, indent=True)

    def capture(self):
        print('Capturing...')

        if not path.exists(self.cell_path):
            print('    storage directory missing, creating it.')
            makedirs(self.cell_path)

        for this_target in self.targets.keys():
            print('    capturing {}'.format(this_target))
            home = self.targets[this_target]['home'].replace('~',
                                                             self.home_path)
            cell = self.cell_path + self.targets[this_target]['cell']

            try:
                shutil.copy(home, cell)
            except IsADirectoryError:
                try:
                    shutil.copytree(home, cell)
                except FileExistsError:
                    shutil.rmtree(cell)
                    shutil.copytree(home, cell)

        print('...done.')

    def invade(self):
        print('Invading...')

        for this_target in self.targets.keys():
            print('    invading {}'.format(this_target))
            home = self.targets[this_target]['home'].replace('~',
                                                             self.home_path)
            cell = self.cell_path + self.targets[this_target]['cell']

            try:
                shutil.copy(cell, home)
            except IsADirectoryError:
                try:
                    shutil.copytree(cell, home)
                except FileExistsError:
                    shutil.rmtree(home)
                    shutil.copytree(cell, home)

        print('...done.')

if __name__ == "__main__":
    legion = Legion('targets.json', 'files/')

    mode = legion.default_mode
    if len(sys.argv) > 1:
        if sys.argv[1] in legion.real_modes:
            mode = str(sys.argv[1])

    if mode == 'help':
        legion.help()

    if mode == 'add':
        new_item = sys.argv[2]
        legion.add(new_item)
        legion.save()

    if mode == 'capture':
        legion.capture()

    if mode == 'invade':
        legion.invade()

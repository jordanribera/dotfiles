# dotfiles
This is a collection of my dotfiles. Also included is a python script for
fetching them and deploying them.

## Using legion.py
`legion.py` is a simple python script that can collect dotfiles for storage in
a git repository such as this one, as well as deploy those dotfiles.

The script has 3 commands: `add`, `capture`, and `invade`.

The `add` command expects the shortened path of a dotfile in your home
directory (example `~/.vimrc`). This file is then added to `targets.json`,
which keeps a record of the file's original home path as well as where it is
stored within the repo.

The `capture` command will fetch each dotfile in `targets.json` into the
`files/` directory of this repository.

The `invade` command will deploy each dotfile in `targets.json` to the original
original path that the file was fetched from.

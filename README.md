# dotfiles
This is a collection of my dotfiles. Also included is a script for fetching
them and deploying them.

## Using operator.sh
`operator.sh` is a simple bash script that can collect dotfiles for storage in
a git repository such as this one, as well as deploy those dotfiles.

Usage:
```
./operator.sh backup  # backup current dotfiles
./operator.sh deploy  # install dotfiles from repo
./operator.sh diff    # obvious
```

For each of these commands, the script consults the `targets` file. This
contains a list of "files of interest" which the operator will work with.

The `backup` command will iterate through the files specified in `targets`,
copying their current state on the system into a timestamped folder
(`cp ~/<file> ./backups/<timestamp>/<file>`) Note: these backups are _ignored_
by git; to preserve a backup, overwrite the contents of `./files/` with the
contents of the timestamped folder and commit.

The `deploy` command will iterate through the files specified in `targets`,
copying their contents from this repository into the system
(`cp ./files/<file> ~/<file>`).

The `diff` command will iterate through the files specified in `targets`,
displaying their diff between this repository and the system. This gives a
preview of the changes that would be applied by `./operator.sh deploy`.

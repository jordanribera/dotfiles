#!/bin/sh

# Copy shared folder from Synology system 'kura' to FreeNAS system
#
# 'source' = shared folder name on 'kura'. These are assumed to live on
#   'volume1'; modify R_SRC setting below to suit your environment's server
#   and volume names.
#
# 'target' = dataset on FreeNAS system. These are assumed to live in a pool
#   named 'stack'; modify R_DEST below if needed.
#
# NB: WARNING! Study the various RSYNC_OPTS settings below! The current active
#   selection below uses the '--delete-during' flag, which syncs the target to the
#   source, deleting any folders/files on the target that don't exist on the source.
#   This may not be what you want.

if [ $# -lt 2 ]
then
  echo "$0: not enough arguments"
  echo "Need source target datasets"
  exit 2
fi

if [ $# -gt 2 ]
then
  echo "$0: too many arguments"
  echo "Need source target datasets"
  exit 2
fi

# This script logs results to a log file in /mnt/stack/management - modify to suit your environment:

R_LOGFILE="~/.scripts/rsync_helper.log"

# rsync options: study these and choose whichever suits your needs:

# RSYNC_OPTS="-rltgoDhv --delete-during --exclude @eaDir/ --exclude @eaDir --exclude Thumbs.db --inplace --log-file="${R_LOGFILE}
RSYNC_OPTS="-rltgoDhv --exclude @eaDir/ --exclude @eaDir --exclude Thumbs.db --inplace --log-file="${R_LOGFILE}
# RSYNC_OPTS="-ahv --exclude @eaDir/ --exclude @eaDir --exclude Thumbs.db --inplace --log-file="${R_LOGFILE}
# RSYNC_OPTS="-ahv --inplace --log-file="${R_LOGFILE}

R_SRC=/volume1/Vault/$1
R_DEST=/mnt/tamari/vault/$2

echo "Pull" ${R_SRC} "to" ${R_DEST} "from kura" >> ${R_LOGFILE}

set -x
rsync ${RSYNC_OPTS} jordan@10.0.0.11:${R_SRC} ${R_DEST}

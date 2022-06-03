#!/bin/bash

if [ -z "$1" ]
then
    echo "Usage: ./uninstall.sh /path/to/repo/root"
    exit 1
fi
DEST="$1"

rm $DEST/.git/hooks/post-checkout

echo "Done.  If you want to delete the scripts as well, run rm $HOME/bin/post-git-checkout $HOME/bin/git-checkout-recent"


#!/usr/bin/env bash

if [ -z "$1" ]
then
    echo "Usage: ./install.sh /path/to/repo/root"
    exit 1
fi
which yq &> /dev/null
if [ "$?" -ne 0 ]
then
    echo "Please install 'yq' with your package manager, eg apt install yq"
    exit 1
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
DEST="$1"
mkdir -p $HOME/bin
cp $SCRIPT_DIR/post-git-checkout $HOME/bin/
cp $SCRIPT_DIR/git-checkout-recent $HOME/bin/

ln -s $HOME/bin/post-git-checkout $DEST/.git/hooks/post-checkout

which git-checkout-recent &> /dev/null || echo 'export PATH=$PATH:'"$HOME/bin" >> $HOME/.profile
git config --global alias.cor '!git-checkout-recent'
echo "Done.  Reopen your shell to get the changes."
echo "Usage: 'git cor' will bring up a menu of recently checked out branches from which to choose"
echo "NOTE:  history begins now"


# git checkout recent

## what
Keeps track of and allows you to switch easily from recently checked out branches

## why
I get tired of typing in long branch names when having to switch back and forth from features.

## how
Uses a git post-checkout hook to store history in ~/.git-checkout-history.yml and a git alias to run
a simple bash script to parse that file and display it as a menu.

## requirements
- yq - command-line yaml parser (think 'jq' for yaml) -- install via your package manager
- git - obviously

## installation
./install.sh /path/to/repo/root

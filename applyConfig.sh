#!/usr/bin/env bash

confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [Y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY]|[jJ])
            true
            ;;
        [nN][oO]|[nN])
            false
            ;;
        *)
            confirm "$@"
    esac
}

dir=$(dirname $(realpath -s "$0"))

localName="undefined"

if [ $# -eq 0 ] ;then
  localName=$(hostname)
elif [ $# -eq 1 ] ;then 
  localName=$1
else
  echo "Need zero or one arguments."
fi

git fetch --all -q
git status 
echo "Local name: $localName"
confirm "Go ahead? [Y/N]" || exit

localDir="$dir/config/local/$localName/"

if ! [ -d "$localDir" ] ;then
  echo "Can't find local directory for the given device."
  exit
fi

echo $localDir

commonDir="$dir/config/common/"

sudo sh -c "cp -a \"$commonDir/.\" \"/etc/nixos/\" ;cp -a \"$localDir/.\" \"/etc/nixos/\""

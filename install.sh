#!/bin/sh

cwd=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
me=$(basename $0)

exclusions=("$me" ".git" ".gitignore" "README.md")

link_all() {
    local folder="$1"
    local file

    # List hidden files
    shopt -s dotglob

    for file in $folder/* ; do
        local name=$(basename $file)

        if [[ ${exclusions[*]} =~ $name ]] ; then echo "Skip exclusion: $name" ; continue ; fi
        link $(readlink -f $file) $HOME/$name
    done
}

link() {
    local src=$1
    local dest=$2

    if [ -h $dest ] ; then echo "Skip, exists symlink with name: $dest"; return; fi
    if [ -d $dest ] ; then echo "Skip, exists target folder: $dest" ; return; fi

    ln -s $src $dest
    echo "Linking from: $src to: $dest"
}

link_all "$cwd"

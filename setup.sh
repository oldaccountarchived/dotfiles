#!/bin/bash
shopt -s dotglob
DIR=$(dirname $(readlink -f "${BASH_SOURCE[0]}"))
FILES=".spacemacs .tmux .tmux.conf .vim .vimrc .zsh-custom .gitconfig. gitignore-global"
for file in $FILES; do
    SRC="${DIR}/${file}"
    DEST="${HOME}/${file}"
    if ! [[ -L "$DEST" || -f "$DEST" || -d "$DEST" ]]; then
        echo "Linking $SRC to $DEST"
        ln -s $SRC $DEST
    else
        echo "A file, symlink, or directory already exists at $DEST"
    fi
done
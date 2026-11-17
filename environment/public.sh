#!/bin/bash

export PATH=~/.local/bin:$PATH

export PATH=~/.bin:$PATH

export SUDO_EDITOR=/bin/vim
export EDITOR=/bin/vim

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="jtriley"
plugins=(git systemd)
. $ZSH/oh-my-zsh.sh

. "$HOME/.cargo/env"

export WG_CONF='/home/mayo/Documents/airvpn/mayo-pc.wg.conf'

# I have no earthly idea why this changed locations
# export DRAGONWILDS='/home/mayo/Software/Steam/steamapps/compatdata/1374490/pfx/drive_c/users/steamuser/AppData/Local/RSDragonwilds/Saved'
export DRAGONWILDS='/home/mayo/.local/share/Steam/steamapps/compatdata/1374490/pfx/drive_c/users/steamuser/AppData/Local/RSDragonwilds/Saved'

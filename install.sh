#!/bin/bash
if [ ! -f tmux.conf ]; then
    exit 1
fi
if [ -f ~/.tmux.conf ]; then
    echo "found ~/.tmux.conf, need to backup?(y/n)"
    read _tag 
    if [[ x$_tag == xy || x$_tag == x ]]; then
        mv ~/.tmux.conf ~/.tmux.conf.bak$(date +%s)
    else
        rm ~/.tmux.conf
    fi
fi
ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf
if [ -d ~/.tmux/plugins ]; then
    mkdir -p ~/.tmux/plugins && git clone git@github.com:ZhuzhuNo3/tmux-pane-ssh-title.git ~/.tmux/plugins/tmux-pane-ssh-title
fi

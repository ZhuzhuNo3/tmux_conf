#!/bin/bash
CONF_PATH=`dirname $0`
if [ ! -f "${CONF_PATH}/tmux.conf" ]; then
    exit 1
fi
if [[ -f ~/.tmux.conf || -L ~/.tmux.conf ]]; then
    echo "found ~/.tmux.conf, need to backup?(y/n)"
    read _tag 
    if [[ x$_tag == xy || x$_tag == x ]]; then
        mv ~/.tmux.conf ~/.tmux.conf.bak$(date +%s)
    else
        rm ~/.tmux.conf
    fi
fi
ln -s "${CONF_PATH}/tmux.conf" ~/.tmux.conf
if [[ ! -d ~/.tmux/plugins || ! -d ~/.tmux/plugins/tmux-pane-ssh-title ]]; then
    mkdir -p ~/.tmux/plugins && git clone git@github.com:ZhuzhuNo3/tmux-pane-ssh-title.git ~/.tmux/plugins/tmux-pane-ssh-title
fi

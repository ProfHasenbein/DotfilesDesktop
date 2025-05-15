# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

#location Obsync
export PATH=$PATH:~/Documents/Obsidian

fastfetch

#starship to make cmd look better
eval "$(starship init bash)"

##Aliases
#git bare repo dotfiles alias
alias config='/usr/bin/git --git-dir=$HOME/DotfilesGNOME/ --work-tree=$HOME'
alias off='shutdown -h now'
alias ..='cd ..'
alias ...='cd ../..'
alias la='ls -alh'

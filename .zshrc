# for LunarVim
alias v='lvim'

# for tmux
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias tl='tmux ls'

# for git
alias ga='git add .'
# alias gc='git commit -m'
alias gc='cz c'
alias gp='git push'
alias gs='git status'
alias gl='git log'
alias gf='git diff'

# for xdg-open
alias open='xdg-open'

# for shared dir
alias shared='sudo mount -t vboxsf shared-dir /home/vgalaxy/Desktop/shared'
alias download='sudo mount -t vboxsf download-dir /home/vgalaxy/Desktop/download/'

# for VPN test
alias pg='ping github.com'

# for gdb, do not display prompt
alias gdb="gdb -q"

# for diff-so-fancy
export PATH=/usr/bin/diff-so-fancy:$PATH
dif() { diff -u "$@" | diff-so-fancy; }

# replace ls with exa
alias ls='exa -l --color=always --group-directories-first --icons'
alias ll='exa -la --color=always --group-directories-first --icons'
alias l='exa --color=always --group-directories-first --icons'
alias t='exa -T --color=always --group-directories-first --icons'

# continue download
alias wget="wget -c"

# readable output
alias df='df -h'

# pacman for software managment
alias remove='sudo pacman -R'
alias install='sudo pacman -S'

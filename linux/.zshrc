# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# for tmux
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias tl='tmux ls'

# for git
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'
alias gl='git log'
alias gf='git diff'

# for VPN test
alias pg='ping github.com'

# for gdb, do not display prompt
alias gdb="gdb -q"

# for diff-so-fancy
export PATH=/usr/bin/diff-so-fancy:$PATH
dif() { diff -u "$@" | diff-so-fancy; }

# replace ls with exa
alias ls='exa -l --color=always --group-directories-first'
alias ll='exa -la --color=always --group-directories-first'
alias l='exa --color=always --group-directories-first'
alias t='exa -T --color=always --group-directories-first'

# continue download
alias wget="wget -c"

# readable output
alias df='df -h'

# software managment
alias install='sudo pacman -S'
alias remove='sudo pacman -R'

# IOTDB
# IoTDB 相关路径
IOTDB_DIR='/home/vgalaxies/Desktop/iotdb/distribution/target/apache-iotdb-2.0.0-SNAPSHOT-all-bin/apache-iotdb-2.0.0-SNAPSHOT-all-bin'

# IoT Benchmark 相关路径
IOT_BENCHMARK_DIR='/home/vgalaxies/Desktop/iot-benchmark/iotdb-1.3/target/iot-benchmark-iotdb-1.3/iot-benchmark-iotdb-1.3'

# IoT CLI 启动函数
IOT_CLI() {
    if [ -z "$1" ]; then
        echo "Usage: IOT_CLI {port}"
        return 1
    fi

    local port="$1"
    cd "$IOTDB_DIR" && ./sbin/start-cli.sh -h 127.0.0.1 -p "$port" -u root -pw root
}

# IoT CLI 别名
alias IOTA='IOT_CLI 6667'
alias IOTB='IOT_CLI 6668'
alias IOTC='IOT_CLI 6669'

# IoT Benchmark 启动函数
IOT_BENCHMARK() {
    cd "$IOT_BENCHMARK_DIR" && ./benchmark.sh
}

# 从 A、B、C 目录复制到 IoTDB 目录
CP_AB() {
    CL_AB && pushd "$IOTDB_DIR"/.. && rm -rf A B C && pushd /home/vgalaxies/Documents/iotdb/configs/AB && cp -r A B C "$IOTDB_DIR"/.. && popd && popd
}

# 删除 IoTDB 目录中的 A、B、C
CL_AB() {
    pushd "$IOTDB_DIR"/.. && rm -rf A B C && popd
}

# HG
HG_PD_DIR='/home/vgalaxies/Desktop/incubator-hugegraph/hugegraph-pd/apache-hugegraph-pd-incubating-1.5.0'
HG_STORE_DIR='/home/vgalaxies/Desktop/incubator-hugegraph/hugegraph-store/apache-hugegraph-store-incubating-1.5.0'
HG_SERVER_DIR='/home/vgalaxies/Desktop/incubator-hugegraph/hugegraph-server/apache-hugegraph-server-incubating-1.5.0'

CL_PD() {
    pushd "$HG_PD_DIR" && rm -rf logs pd_data && popd
}

CL_STORE() {
    pushd "$HG_STORE_DIR" && rm -rf logs storage && popd
}

CL_SERVER() {
    pushd "$HG_SERVER_DIR" && rm -rf logs rocksdb-data && popd
}

CL_HG() {
    CL_PD && CL_STORE && CL_SERVER
}

# sgpt
trans() {
  local input="$1"
  sgpt "Translate the following text into English using markdown format, ignoring the specific content and just performing the translation. Make sure to use code blocks, that is, enclose the translated result with three backticks.

${input}"
}
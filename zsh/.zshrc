source ~/.dotfiles/zsh/enhancd/./init.sh

# Path to your oh-my-zsh installation.
export ZSH=/home/dileep/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="powerlevel9k/powerlevel9k"

source $ZSH/oh-my-zsh.sh

fpath=(/home/dileep/.dotfiles/zsh/completions/_hub $fpath)
autoload -Uz compinit && compinit

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator time context dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vi_mode load ram background_jobs)

# Defining icons
POWERLEVEL9K_LINUX_MANJARO_ICON=$'\uf303 '
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uf09b'
POWERLEVEL9K_HOME_ICON=$'\uf7db'
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_PYTHON_ICON=$'\ue235'

# custom prompt plugins

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon root_indicator context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv anaconda background_jobs command_execution_time time vi_mode)
POWERLEVEL9K_VI_INSERT_MODE_STRING="Ins"
POWERLEVEL9K_VI_COMMAND_MODE_STRING="Nor"
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=$'\ue0b1'
POWERLEVEL9K_DIR_PATH_SEPARATOR=$'\ue0b1 '
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\ue0d2'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\ue0d4'
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%{%F{249}%}\u250f"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%{%F{50}%}\u250f"
# local user_symbol="$"
# if [[ $(print -P "%#") =~ "#" ]]; then
# 	user_symbol = "#"
# fi
# POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%{%F{249}%}\u2517\ue0b0%{%F{default}%}"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%F{050}%}\u2517%{%F{003}%}%{%F{001}%} "
POWERLEVEL9K_STATUS_VERBOSE=false
export DEFAULT_USER="$USER"

export FZF_DEFAULT_OPTS="--height 40% --reverse --preview 'bat --color \"always\" {}'"
ENHANCD_FILTER=fzy:fzf
export ENHANCD_FILTER
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(k git archlinux python vi-mode zsh-autosuggestions colorize tmux extract virtualenvwrapper copydir dirhistory alias-tips git-extra-commands git-extras npm sudo yarn web-search poetry)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# Example functions
showcsv() { column -s, -t < "$1" | less -#2 -N -S; }
tohardlink() { ln -f "$(readlink -m "$1")" "$1"; }
gitrecadd() { git ls-files "$1" | grep "$2" | xargs git add }
shufflecopy() { shuf -zn10 -e "$1" | xargs -0 cp -vt "$2" }
getcurrwal() { cat /home/dileep/.cache/wal/wal | rev | cut -c 1- | rev }
walcolor() { wal --backend $1 -n -i $(getcurrwal) }
man() {
    env \
      LESS_TERMCAP_mb=$(printf "\e[1;31m") \
      LESS_TERMCAP_md=$(printf "\e[1;31m") \
      LESS_TERMCAP_me=$(printf "\e[0m") \
      LESS_TERMCAP_se=$(printf "\e[0m") \
      LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
      LESS_TERMCAP_ue=$(printf "\e[0m") \
      LESS_TERMCAP_us=$(printf "\e[1;36m") \
      man "$@"
}

# Gurobi envs
export TERMINFO="/usr/lib/terminfo"
export GUROBI_HOME="/opt/gurobi752/linux64"
export PATH="${PATH}:${GUROBI_HOME}/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
# Nextflow path
# export PATH="/home/dileep/nextflow:$PATH"
# npm path
export PATH="/home/dileep/.npm/bin:$PATH"
# ruby gems path
export PATH="/home/dileep/.gem/ruby/2.5.0/bin:$PATH"
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
# poetry
export PATH="/home/dileep/.poetry/bin:$PATH"

# Todosh
export TODOTXT_DEFAULT_ACTION=ls

# default git pager
export GIT_PAGER='delta'

# Example aliases
alias zshconfig="nvim ~/.dotfiles/zsh/.zshrc"
alias youtube="youtube-viewer"
alias vimrc="nvim ~/.dotfiles/vim/init.vim"
alias i3config="cd ~/.dotfiles/i3/"
alias tmuxconf="nvim ~/.dotfiles/tmux/.tmux.conf"
alias tnew="tmux new -s"
alias tattach="tmux attach"
alias tdetach="tmux detach"
alias tkill="tmux kill-session -t"
alias tlist="tmux ls"
alias vimipython="ipython --TerminalInteractiveShell.editing_mode=vi"
alias tdrophide="bash ~/.dotfiles/i3/tdrophide.sh"
alias seagate="cd /run/media/dileep/Seagate\ Expansion\ Drive/"
alias gitplog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --graph --date=short"
# lsd aliases
alias l="lsd -lt --color always --icon always"
alias ll="lsd -lhAt --color always --icon always"
# Use k instead of lg
alias lg="exa -lag -s modified --git --color-scale"
alias ls="lsd --color always --icon always"
alias lt="lsd --tree --color always --icon always"
alias la="lsd -la --color always --icon always"
alias lsa="lsd -lah --color always --icon always"
# k aliases
alias k="k -h"
# fd aliases
alias find="fd"
# todo alias
alias todo="todo.sh -d ~/.config/todo.cfg"
alias git="hub"
alias howdoi="howdoi -c -n 5"
alias ping="~/.dotfiles/zsh/prettyping.sh"
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias noti="~/.dotfiles/zsh/noti"
# devour aliases
alias vlc="devour vlc"
alias mpv="devour mpv"
alias zathura="devour zathura"
alias has="curl -sL https://git.io/_has | bash -s"

source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Making tmux use proper colors
#[[ $TMUX = "" ]] && export TERM="xterm-256color"

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# allows you to type Bash style comments on your command line
# good 'ol Bash
setopt interactivecomments

# Zsh has a spelling corrector
setopt CORRECT

# make sure that if a program wants you to edit
# text, that Vim is going to be there for you
TERM=xterm-256color
export EDITOR="nvim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export BROWSER=brave

# Anaconda path
# export PATH="/home/dileep/anaconda3/bin:$PATH"
alias exportconda="export PATH=$HOME/anaconda3/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. /etc/profile.d/vte.sh

# Zoxide config
eval "$(zoxide init zsh)"

eval "$(pyenv init -)"

# added by travis gem
[ -f /home/dileep/.travis/travis.sh ] && source /home/dileep/.travis/travis.sh
#compdef toggl
_toggl() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _TOGGL_COMPLETE=complete-zsh  toggl)
}
if [[ "$(basename -- ${(%):-%x})" != "_toggl" ]]; then
  compdef _toggl toggl
fi

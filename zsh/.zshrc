# include Z, yo
. ~/z.sh

# Path to your oh-my-zsh installation.
  export ZSH=/home/dileep/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"
#ZSH_THEME="cobalt2"
#ZSH_THEME="statusline"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator time context dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vi_mode load ram background_jobs)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon root_indicator context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(anaconda vcs background_jobs time vi_mode)
POWERLEVEL9K_PYTHON_ICON=$'\UE63C'
POWERLEVEL9K_ANACONDA_BACKGROUND="yellow"
POWERLEVEL9K_ANACONDA_FOREGROUND="black"
# POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B1'
# POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0B3'
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M}"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%{%F{249}%}\u250f"
# local user_symbol="$"
# if [[ $(print -P "%#") =~ "#" ]]; then
# 	user_symbol = "#"
# fi
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%{%F{249}%}\u2517\ue0b0%{%F{default}%}"
POWERLEVEL9K_STATUS_VERBOSE=false
export DEFAULT_USER="$USER"

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
plugins=(git arch python z vi-mode zsh-autosuggestions colorize cp tmux extract virtualenvwrapper)

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
# Example aliases
alias zshconfig="nvim ~/.dotfiles/zsh/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias youtube="youtube-viewer"
alias vimrc="nvim ~/.dotfiles/vim/init.vim"
alias i3config="cd ~/.dotfiles/i3/"
alias tmuxconf="nvim ~/.dotfiles/tmux/.tmux.conf"
alias tnew="tmux new -s"
alias tattach="tmux attach"
alias tdetach="tmux detach"
# alias tkill="tmux tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"
alias tkill="tmux kill-session -t"
alias tlist="tmux ls"
alias condadir="cd /home/dileep/anaconda3/bin/"
alias vimipython="ipython --TerminalInteractiveShell.editing_mode=vi"


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
TERM=xterm-termite
export EDITOR="nvim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export BROWSER=vivaldi-stable

# Anaconda path
# export PATH="/home/dileep/anaconda3/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. /etc/profile.d/vte.sh

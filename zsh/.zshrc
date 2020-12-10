#!/bin/zsh

# Shell important exports

# Basic exports
TERM=xterm-256color
export EDITOR="nvim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export BROWSER=brave


# Set XDG directories.
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_BIN_HOME="${HOME}/.local/bin"
export XDG_LIB_HOME="${HOME}/.local/lib"
export XDG_CACHE_HOME="${HOME}/.cache"


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

################################################################################
# ZINIT INIT                                                                   #
################################################################################

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node
### End of Zinit's installer chunk

################################################################################
# PROMPT                                                                       #
################################################################################

# Theme the prompt with Powerlevel10k
zinit ice depth"1"
zinit light romkatv/powerlevel10k


################################################################################
# OMZ Libs and Plugins                                                         #
################################################################################
# NOTE:
# Ohmyzsh plugins and libs are loaded first as some these sets some defaults which are required later on.
# Otherwise something will look messed up
# ie. some settings help zsh-autosuggestions to clear after tab completion
setopt promptsubst

zinit lucid for \
    OMZP::tmux \
    OMZL::history.zsh

# Git
# Source: https://zdharma.org/zinit/wiki/Example-Oh-My-Zsh-setup/
zinit wait lucid for \
    OMZL::git.zsh \
    OMZP::git

# important libraries
zinit lucid for \
    OMZL::clipboard.zsh \
    OMZL::compfix.zsh \
    OMZL::spectrum.zsh

# important plugins
zinit wait lucid for \
    OMZP::asdf \
    OMZP::archlinux \
    OMZP::colored-man-pages \
    OMZP::copydir \
    OMZP::direnv \
    OMZP::extract \
    OMZP::npm \
    OMZP::pipenv \
    OMZP::pyenv \
    OMZP::python \
    OMZP::git-extras \
    OMZP::vi-mode \
    OMZP::virtualenvwrapper \
    OMZP::web-search

zinit wait"2" lucid atload"bindkey '^R' fzf-history-widget" for OMZP::fzf

################################################################################
# PLUGINS                                                                      #
################################################################################

# Fast-syntax-highlighting & autosuggestions & completions
# Source: zdharma/fast-syntax-highlighting
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" \
    zdharma/fast-syntax-highlighting \
 atload"_zsh_autosuggest_start; bindkey '^ ' autosuggest-accept" \
    zsh-users/zsh-autosuggestions \
 blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions

# Interactive `cd`
zinit wait lucid for b4b4r07/enhancd

# forgit
zinit wait"2" lucid for wfxr/forgit

# fast alias-tips
zinit wait lucid from"gh-r" as"program" for sei40kr/fast-alias-tips-bin
zinit wait lucid for sei40kr/zsh-fast-alias-tips

# Automatically switch virtualenvs in pipenv and poetry projects
zinit wait"2" lucid for MichaelAquilina/zsh-autoswitch-virtualenv

################################################################################
# PROGRAMS                                                                     #
################################################################################

# Automatically load env variables based on directory
# Source: https://zdharma.org/zinit/wiki/Direnv-explanation/
zinit as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
    atpull'%atclone' pick"direnv" src"zhook.zsh" for \
        direnv/direnv

# LS_COLORS
zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

# NOTE: fzf program and completions installed using AUR

# fd, bat and exa
# Source: https://zdharma.org/zinit/wiki/GALLERY/
zinit wait"2" lucid from"gh-r" as"null" for \
     sbin"**/fd"        @sharkdp/fd \
     sbin"**/bat"       @sharkdp/bat \
     sbin"exa* -> exa"  ogham/exa \
     sbin"noti"         variadico/noti

zinit wait lucid as"completion" for \
    https://raw.githubusercontent.com/sharkdp/fd/master/contrib/completion/_fd \
    https://raw.githubusercontent.com/BurntSushi/ripgrep/master/complete/_rg \
    https://github.com/ogham/exa/blob/master/completions/completions.zsh

# lsd
zinit wait lucid from"gh-r" as"null" for \
    sbin"**/lsd"        Peltoche/lsd \
    sbin"zoxide* -> zoxide" ajeetdsouza/zoxide

# zoxide and delta
zinit wait"2" lucid from"gh-r" as"null" for \
    sbin"**/delta"          dandavison/delta

# ripgrep
zinit wait lucid from"gh-r" as"null" for \
    sbin"**/rg"         BurntSushi/ripgrep

# yank
zinit ice as"program" wait lucid pick"yank" make
zinit light mptre/yank

# Useful git programs
# Source: https://zdharma.org/zinit/wiki/For-Syntax/
zinit as"null" wait"2" lucid for \
    sbin  Fakerr/git-recall \
    sbin  paulirish/git-open \
    sbin  paulirish/git-recent \
    sbin  davidosomething/git-my \
    sbin  arzzen/git-quick-stats \
    make"PREFIX=$ZPFX" tj/git-extras

zinit wait"1" as"program" lucid sbin"*cht.sh -> cht.sh" for "https://cht.sh/:cht.sh"

################################################################################
# FUNCTIONS                                                                   #
################################################################################

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


################################################################################
# SOURCE, EXPORTS and ALIASES                                                  #
################################################################################

# fzf config
export FZF_BASE="$HOME/.fzf"
export FZF_DEFAULT_OPTS="--height 40% --reverse --preview 'bat --style=numbers --color=always --line-range :500 {}'"


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
# default git pager
export GIT_PAGER='delta'

# Example aliases
alias youtube="youtube-viewer"
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
alias lg="exa -lag -s modified --git --color-scale"
alias ls="lsd --color always --icon always"
alias lt="lsd --tree --color always --icon always"
alias la="lsd -la --color always --icon always"
alias lsa="lsd -lah --color always --icon always"
# fd aliases
alias find="fd"
alias howdoi="howdoi -c -n 5"
alias ping="~/.dotfiles/zsh/prettyping.sh"
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
# devour aliases
alias vlc="devour vlc"
alias mpv="devour mpv"
alias zathura="devour zathura"
alias has="curl -sL https://git.io/_has | bash -s"
# Anaconda path alias
alias exportconda="export PATH=$HOME/anaconda3/bin:$PATH"

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# allows you to type Bash style comments on your command line
# good 'ol Bash
setopt interactivecomments

# Zsh has a spelling corrector
setopt CORRECT

# Pyenv config
eval "$(pyenv init -)"

# added by travis gem
[ -f /home/dileep/.travis/travis.sh ] && source /home/dileep/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zoxide config
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

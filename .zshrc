if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

zstyle ':omz:update' mode auto

HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=10000
setopt hist_ignore_dups
setopt hist_find_no_dups
unsetopt beep

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

export LS_COLORS="di=1;32:ex=1;36"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]=bold
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009,bold
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,bold
ZSH_HIGHLIGHT_STYLES[alias]=fg=214,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=214,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=214,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=214,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=214,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009,bold
ZSH_HIGHLIGHT_STYLES[path]=fg=253,underline,bold
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=108
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=108
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[assign]=none

# Alias
alias ls='ls --sort=extension'
alias la='ls -a'
alias ls='ls --color'
alias ll='ls -la'   # show long listing of all
alias .='cd .'
alias ..='cd ..'
alias cd..='cd ..'
alias '.2'='cd ../../'
alias '.3'='cd ../../../'
alias mv='mv -i'
alias cp='cp -i'
alias edit='vim'
alias vi='vim'
alias py='python3'
alias vrc='vim ~/.vimrc'
alias brc='vim ~/.bashrc'
alias zrc='vim ~/.zshrc'
alias gpo='git push origin master'
alias gp='git pull'
alias gs='git status'
alias gt='git push origin master --follow-tags'
alias glf='git ls-files'

mkd() {
    mkdir $1 && cd $1
}

cd() {
  builtin cd $1 && ls
}

# Extract archive of various types
ex() {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1     ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1     ;;
             *.rar)       rar x $1       ;;
             *.gz)        gunzip $1      ;;
             *.tar)       tar xf $1      ;;
             *.tbz2)      tar xjf $1     ;;
             *.tgz)       tar xzf $1     ;;
             *.zip)       unzip $1       ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1        ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

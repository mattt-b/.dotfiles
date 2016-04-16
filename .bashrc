export EDITOR='vim'

BASE16_SHELL="$HOME/.config/base16-shell/base16-tomorrow.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Custom bash prompt via kirsle.net/wizards/ps1.html
# export PS1="\[$(tput bold)\]\[$(tput setaf 7)\]\A>\[$(tput setaf 1)\]\h:\[$(tput setaf 2)\]\W \\$ \[$(tput sgr0)\]"
# Prompt with git branch on the end
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

export PS1="\[$(tput setaf 7)\]\A\[$(tput setaf 1)\]❯\[$(tput setaf 3)\]❯\[$(tput setaf 2)\]❯ \[$(tput setaf 1)\]\h:\[$(tput setaf 2)\]\W \$(parse_git_branch)\\[$(tput setaf 4)\]\$(~/.rvm/bin/rvm-prompt g)\[$(tput setaf 2)\]$ \[$(tput sgr0)\]"
 #\[$(tput setaf 4)\]\$(~/.rvm/bin/rvm-prompt g)

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

mkcd() {
        if [ $# != 1 ]; then
                echo "Usage: mkcd <dir>"
        else
                mkdir -p $1 && cd $1
        fi
}

# TODO: Make this work without re-sourcing
cd() {
      if [ -d "${@: -1}" ] ; then
          builtin cd $*;
      else
          $EDITOR "${@: -1}"
      fi
}

bind -r '\C-s'
stty -ixon

alias l='ls -A'
alias lah='ls -lAh'
alias lf='ls -CF'

alias ..='cd ..'
alias cls='clear'

# git aliases
alias gs='git status'
alias gb='git branch'
alias ga='git add'
alias gc='git commit -m '
#git h is set up in .gitconfig
alias gh='git h'

# Python Virtualenv aliases
alias vc='virtualenv venv'
alias va='source venv/bin/activate'

alias pyclean="find . -name '*.pyc' -delete"
alias pimp="python manage.py"

# Tmux
alias tks='tmux kill-session'
alias tls='tmux ls'

# Scheme with niceties
alias scheme="rlwrap -r -c -f ~/.config/mit_scheme_bindings.txt scheme"

#Add RVM to PATH for scripting
PATH=$PATH:/usr/local/rvm/bin
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
#for Homebrew
export PATH="/usr/local/bin:$PATH"

[[ -s "/usr/local/etc/bash_completion.d/git-completion.bash" ]] && source /usr/local/etc/bash_completion.d/git-completion.bash
[[ -s "/usr/local/etc/bash_completion.d/git-flow-completion.bash" ]] && source /usr/local/etc/bash_completion.d/git-flow-completion.bash

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

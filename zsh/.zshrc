autoload -U colors && colors
setopt prompt_subst

function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '('$branch')'
  fi
}

PS1="[%{$fg[green]%}%n%{$reset_color%}]:%{$fg[blue]%}[%~]%{$reset_color%}%{$fg[red]%}$(git_branch_name)Ш %{$reset_color%}"
#PS1="%{$fg[red][%n]%}%{$reset_color%}:%{$fg[blue]%}[%~]%{$reset_color%}%{$fg[red]%}Ш %{$reset_color%}"
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M%{$fg[red]%}]%{$reset_color%}:%{$fg[magenta]%}[%~]/>%{$reset_color%}%b "
PS2="%{$fg[red]%} >> %{$reset_color%}"
#keep history in right place
setopt HIST_IGNORE_SPACE
HISTSIZE=10
SAVEHIST=10
HISTFILE=~/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
zstyle ':completion:*' list-colors ''
setopt histignorealldups
compinit
_comp_options+=(globdots)
export EDITOR="nvim"
export BROWSER="brave-browser"
export TERM=xterm-256color

#paths
export GOPATH=$HOME/go
export GHIDRA_PATH='/home/suntsam/Apps/ghidra_9.2.2_PUBLIC'
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/local/sbin:/usr/sbin:/sbin:~/.local/bin:/snap/bin:/usr/local/go/bin:$GOPATH/bin:/opt/:$GHIDRA_PATH:$PATH

#crazy binds
bindkey -s '^f' 'ranger\n'
bindkey -s '^z' '. ~/.zshrc\n'

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# tomnomnom's gf autocompletion
source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.zsh
# Load zsh-syntax-highlighting; should be last.
function rhis { local HISTSIZE=0; }
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/web-search.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

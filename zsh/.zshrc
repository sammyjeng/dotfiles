#my last shell hop
autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M%{$fg[red]%}]%{$reset_color%}:%{$fg[magenta]%}[%~]/>%{$reset_color%}%b "


PS1="[%{$fg[green]%}%n%{$reset_color%}@%m]:%{$fg[blue]%}[%~]%{$reset_color%}%{$fg[red]%}Ш %{$reset_color%}"

PS2="%{$fg[red]%} >> %{$reset_color%}"


#keep history in right place
HISTSIZE=100
SAVEHIST=100
HISTFILE=~/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
zstyle ':completion:*' list-colors ''
setopt histignorealldups
compinit
_comp_options+=(globdots)
kitty + complete setup zsh | source /dev/stdin
export EDITOR="vim"
export BROWSER="firefox"
export TERM=xterm-256color
#paths
export GOPATH=$HOME/go
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/local/sbin:/usr/sbin:/sbin:~/.local/bin:/snap/bin:/usr/local/go/bin:$GOPATH/bin:/opt/pmp:/opt/2john:/opt$PATH
#crazy binds
bindkey -s '^f' 'ranger\n'
bindkey -s '^z' '. ~/.zshrc\n'
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi
#zsh/bash insulter
if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi
# tomnomnom's gf autocompletion
source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.zsh
# Load zsh-syntax-highlighting; should be last.
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/web-search.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

function rhis { local HISTSIZE=0; }

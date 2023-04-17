set fish_greeting
if status is-interactive
    # Commands to run in interactive sessions can go here
end
complete -x -c gf -a "(gf -list)"
#aliases
alias aws='python3 -m awscli '
alias dir='dir --color=auto'
alias du='du -h'
alias egrep='egrep --color=auto'
alias fenv='source ~/tools/frida-env/bin/activate.fish'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias la='ls -lha'
alias le='less'
alias ll='ls -lh'
alias ls='ls --color'
alias py='python3.11'
alias rm='rm -i'
alias tmux='tmux -u'
alias tx='~/.tmx.sh'
alias up='python3 -m http.server 8000'
alias v='nvim'
alias vi='nvim'
alias xo='open'
alias sp='v /tmp/sl.txt'
alias objkill="kill -9 $(ps aux | grep objection | awk -F "    " '{print$3}' |cut -d" " -f 2)"
alias r2='/usr/local/bin/r2 -e bin.relocs.apply=true'
alias ip="ifconfig | grep -E -i -w '192|10|172' | cut -d' ' -f2"
alias ainst='cfgutil install-app'
alias arem='cfgutil remove-app'
alias ff='frida -F -U'
alias bgbk='bagbak -z'

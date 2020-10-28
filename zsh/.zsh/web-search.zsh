# web_search from terminal
function web_search() {
  emulate -L zsh


  # define search engine URLS
  typeset -A urls
  urls=(
    google      "https://www.google.com/search?q="
    duckduckgo  "https://www.duckduckgo.com/?q="
    github      "https://github.com/search?q="
    youtube     "https://www.youtube.com/results?search_query="
    grepo       "https://www.github.com/"
    stackoverflow "https://stackoverflow.com/search?q="
    cheatsheet "https://cheat.sh/"
  )

  # check whether the search engine is supported
  if [[ -z "$urls[$1]" ]]; then
    echo "Search engine $1 not supported."
    return 1
  fi

  # search or go to main page depending on number of arguments passed
  if [[ $# -gt 1 ]]; then
    # build search url:
    # join arguments passed with '+', then append to search engine URL
    url="${urls[$1]}${(j:+:)@[2,-1]}"
  else
    # build main page url:
    # split by '/', then rejoin protocol (1) and domain (2) parts with '//'
    url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
  fi

   xdg-open "$url" 
} &> /dev/null  

alias grepo='web_search grepo'
alias google='web_search google'
alias ddg='web_search duckduckgo'
alias github='web_search github'
alias goodreads='web_search goodreads'
alias qwant='web_search qwant'
alias givero='web_search givero'
alias stackoverflow='web_search stackoverflow'
alias cc='web_search cheatsheet'

#add your own !bang searches here
alias wiki='web_search duckduckgo \!w'
alias news='web_search duckduckgo \!n'
alias youtube='web_search duckduckgo \!yt'
alias map='web_search duckduckgo \!m'
alias image='web_search duckduckgo \!i'
alias ducky='web_search duckduckgo \!'

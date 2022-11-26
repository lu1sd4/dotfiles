alias ls="exa --icons --group-directories-first"
alias la="exa -a --icons --group-directories-first"
alias ll="exa -l -a --icons --header --git --group-directories-first"
alias tree="exa -a --icons --tree --group-directories-first"
alias bat="bat --theme base16"
alias grep="grep --color=auto"
alias ip="ip -color=auto"
alias vim="nvim"
alias o="open"

precmd() $funcstack[1]() echo

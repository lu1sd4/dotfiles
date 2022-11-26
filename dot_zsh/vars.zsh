# PATH

## home scripts + pyenv
export PATH="$HOME/.scripts/:$HOME/esiee/bin/:$HOME/.pyenv/bin:$PATH"

## PERL
export PATH="$HOME/perl5/bin${PATH:+:${PATH}}"
export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"

# LD_LIBRARY

export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib/fst

# Node - NVM

export NVM_DIR="$HOME/.nvm"
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

# zsh history

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=1000
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# programs

export EDITOR='code'
export TERMINAL='alacritty'
export READER='zathura'
export FILE='ranger'

# Other

export COWPATH=~/.config/cows
export MYVIMRC=~/.config/nvim/init.lua

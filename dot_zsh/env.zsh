source $NVM_DIR/nvm.sh
source $HOME/.cargo/env

eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
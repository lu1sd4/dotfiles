setopt auto_cd
autoload -Uz compinit
compinit

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

if [[ "$TERM_PROGRAM" != "vscode" ]] && [[ "$(tty)" != "/dev/tty1" ]]; then
  [ -z "$TMUX"  ] && { tmux attach -t mess || exec tmux new -s mess }
fi



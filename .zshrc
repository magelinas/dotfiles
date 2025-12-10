export ZSH="$HOME/.zsh"

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

autoload -Uz compinit
compinit

fpath+=("$HOME/.zsh/pure")
autoload -Uz promptinit; promptinit
prompt pure

source "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

source "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

fpath+=("$HOME/.zsh/plugins/zsh-completions/src")

setopt AUTO_CD               # cd by just typing directory name
setopt CORRECT               # command correction
setopt EXTENDED_GLOB         # advanced globbing
setopt NO_BEEP               # silence

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

if command -v tmux >/dev/null 2>&1; then
    if [ -z "$TMUX" ]; then
        tmux attach-session -t default || tmux new-session -s default
    fi
fi

# Enable directory colors
eval "$(dircolors -b)"

alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -A --color=auto'

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

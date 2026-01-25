export ZSH="$HOME/.zsh"
export PATH=$PATH:$HOME/.local/bin

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

bindkey -e

autoload -Uz compinit
compinit

source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fpath+=("$HOME/.zsh/zsh-completions/src")

eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.toml)"

# Tokyo-Night scheme
ZSH_HIGHLIGHT_STYLES[command]='fg=#7aa2f7'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#7aa2f7'
ZSH_HIGHLIGHT_STYLES[function]='fg=#7aa2f7'

ZSH_HIGHLIGHT_STYLES[alias]='fg=#73daca'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#bb9af7'

ZSH_HIGHLIGHT_STYLES[path]='fg=#73daca'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#73daca'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=#73daca'

ZSH_HIGHLIGHT_STYLES[option]='fg=#bb9af7'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#bb9af7'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#bb9af7'

ZSH_HIGHLIGHT_STYLES[default]='fg=#c0caf5'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#7aa2f7'

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#9ece6a'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#9ece6a'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#9ece6a'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#9ece6a'

ZSH_HIGHLIGHT_STYLES[variable]='fg=#c0caf5'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#c0caf5'

ZSH_HIGHLIGHT_STYLES[redirection]='fg=#89ddff'

ZSH_HIGHLIGHT_STYLES[comment]='fg=#565f89,italic'

ZSH_HIGHLIGHT_STYLES[numeric]='fg=#ff9e64'

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#f7768e,bold'

ZSH_HIGHLIGHT_STYLES[bracket]='fg=#c0caf5'
ZSH_HIGHLIGHT_STYLES[separator]='fg=#c0caf5'

ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=#7aa2f7'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#7aa2f7'

ZSH_HIGHLIGHT_STYLES[globbing]='fg=#ff9e64'

ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#f7768e'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#565f89'

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

bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Enable directory colors
eval "$(dircolors -b)"

alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -A --color=auto'

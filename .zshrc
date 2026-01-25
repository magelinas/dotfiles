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

source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fpath=($HOME/.zsh/zsh-completions/src $fpath)

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' clear-screen true

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

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

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

# Fix a lot of keybinding stuff
# Taken from https://www.reddit.com/r/zsh/comments/eblqvq/comment/fb7337q/
# If NumLock is off, translate keys to make them appear the same as with NumLock on.
bindkey -s '^[OM' '^M'  # enter
bindkey -s '^[Ok' '+'
bindkey -s '^[Om' '-'
bindkey -s '^[Oj' '*'
bindkey -s '^[Oo' '/'
bindkey -s '^[OX' '='

# If someone switches our terminal to application mode (smkx), translate keys to make
# them appear the same as in raw mode (rmkx).
bindkey -s '^[OH' '^[[H'  # home
bindkey -s '^[OF' '^[[F'  # end
bindkey -s '^[OA' '^[[A'  # up
bindkey -s '^[OB' '^[[B'  # down
bindkey -s '^[OD' '^[[D'  # left
bindkey -s '^[OC' '^[[C'  # right

# TTY sends different key codes. Translate them to regular.
bindkey -s '^[[1~' '^[[H'  # home
bindkey -s '^[[4~' '^[[F'  # end

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^?'      backward-delete-char          # bs         delete one char backward
bindkey '^[[3~'   delete-char                   # delete     delete one char forward
bindkey '^[[H'    beginning-of-line             # home       go to the beginning of line
bindkey '^[[F'    end-of-line                   # end        go to the end of line
bindkey '^[[1;5C' forward-word                  # ctrl+right go forward one word
bindkey '^[[1;5D' backward-word                 # ctrl+left  go backward one word
bindkey '^H'      backward-kill-word            # ctrl+bs    delete previous word
bindkey '^[[3;5~' kill-word                     # ctrl+del   delete next word
bindkey '^J'      backward-kill-line            # ctrl+j     delete everything before cursor
bindkey '^[[D'    backward-char                 # left       move cursor one char backward
bindkey '^[[C'    forward-char                  # right      move cursor one char forward
bindkey '^[[A'    up-line-or-beginning-search   # up         prev command in history
bindkey '^[[B'    down-line-or-beginning-search # down       next command in history

bindkey '^I' complete-word

# Enable directory colors
eval "$(dircolors -b)"

alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -A --color=auto'

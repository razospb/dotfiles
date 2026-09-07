# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  web-search
  fzf-tab
  zsh-interactive-cd
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
#------------------------------------------------------------------------------
# ADDITIONAL CONFIGS
#------------------------------------------------------------------------------

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Shell Integrations
eval "$(fzf --zsh)"

# Give zsh-interactive-cd ownership of Tab
bindkey '^I' zic-completion
eval "$(zoxide init --cmd cd zsh)"

# Configure fzf
export FZF_DEFAULT_COMMAND="rg --files --follow --hidden --glob '!.git'"
export FZF_DEFAULT_OPTS="--highlight-line --info=inline-right --ansi --layout=reverse --border=none"
export FZF_CTRL_T_OPTS="--preview='less {}' --height=100% --bind shift-up:preview-page-up,shift-down:preview-page-down"

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# zstyle ':fzf-tab:complete:cd:*' fzf-preview "ls --color=always \${realpath}"

#------------------------------------------------------------------------------
# WIDGETS
#------------------------------------------------------------------------------

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

#------------------------------------------------------------------------------
# SYSTEM ADMINISTRATION
#------------------------------------------------------------------------------

# File System Navigation
alias cd..='cd ..'      # Fix common typo of cd.. instead of cd ..
alias ..='cd ..'        # Move up one directory level
alias ...='cd ../..'    # Move up two directory levels
alias .3='cd ../../..'  # Move up three directory levels
alias .4='cd ../../../..'  # Move up four directory levels
alias .5='cd ../../../../..'  # Move up five directory levels
alias up='cd ..'        # Alternative way to move up one directory
alias back='cd -'       # Return to previous directory (toggles between last two directories)
alias home='cd ~'       # Navigate to home directory
alias c='clear'         # Clear terminal contents

# File Listing and Management
# GNU coreutils
if (( $+commands[gls] )); then
  # macOS with Homebrew coreutils
  alias ls='gls -F -G --color=auto --group-directories-first'
  alias ll='gls -alh -G --color=auto --group-directories-first'
  alias lt='gls --human-readable --color=auto --size -1 -S --classify'
  alias lsr='gls --color=auto -t -1'
  alias find='gfind'
else
  # Linux / systems with GNU coreutils as the default
  alias ls='ls -F --color=auto --group-directories-first'
  alias ll='ls -alh --color=auto --group-directories-first'
  alias lt='ls --human-readable --color=auto --size -1 -S --classify'
  alias lsr='ls --color=auto -t -1'
fi

# Load custom GNU coreutils colors
if (( $+commands[gdircolors] )); then
  eval "$(gdircolors -b ~/.dircolors)"
elif (( $+commands[dircolors] )); then
  eval "$(dircolors -b ~/.dircolors)"
fi

# Universal aliases
alias tree='tree -C --dirsfirst -L'
alias mkdir='mkdir -pv'      # Create parent directories as needed, verbose output
alias cp='cp -iv'      # Interactive and verbose copy
alias mv='mv -iv'      # Interactive and verbose move

# Quick Configuration Edits
alias reload='source ~/.zshrc'      # Reload bash configuration
alias hosts='nvim /etc/hosts'      # Edit hosts file
alias vimrc='nvim ~/.vimrc'      # Edit default vim configuration file
alias zshrc='nvim ~/.zshrc'      # Edit bash configuration file
alias sshconfig='nvim ~/.ssh/config'

#------------------------------------------------------------------------------
# CUSTOM zsh-interactive-cd PREVIEW
#------------------------------------------------------------------------------

if (( $+commands[gls] )); then
  ZSH_LS="gls"
else
  ZSH_LS="ls"
fi

_zic_complete() {
  setopt localoptions nonomatch
  local l matches fzf tokens base fzf_bindings preview_cmd

  l=$(_zic_list_generator $@)

  if [ -z "$l" ]; then
    zle ${__zic_default_completion:-expand-or-complete}
    return
  fi

  fzf=$(__zic_fzf_prog)
  fzf_bindings=$(__zic_fzf_bindings)

  # Determine the base directory being completed.
  base="${(Q)@[-1]}"

  # Normalize the base directory.
  if [[ "$base" != */ ]]; then
    if [[ "$base" == */* ]]; then
      base="$(dirname -- "$base")"
      [[ ${base[-1]} != / ]] && base="$base/"
    else
      base=""
    fi
  fi

  # Build the preview command using the actual base path.
  if [[ -n "$base" ]]; then
    preview_cmd="$ZSH_LS --color=always --group-directories-first ${(q)base}"'{}'
  else
    preview_cmd="$ZSH_LS --color=always --group-directories-first "'{}'
  fi

  if [ $(echo $l | wc -l) -eq 1 ]; then
    matches=${(q)l}
  else
    matches=$(echo $l \
      | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} \
        --reverse $FZF_DEFAULT_OPTS $FZF_COMPLETION_OPTS \
        --bind '${fzf_bindings}'" \
        ${=fzf} \
        --preview "$preview_cmd" \
        --preview-window=right,40% \
        --bind 'ctrl-b:preview-page-up,ctrl-f:preview-page-down' \
      | while read -r item; do
          echo -n "${(q)item} "
        done)
  fi

  matches=${matches% }

  if [ -n "$matches" ]; then
    tokens=(${(z)LBUFFER})

    LBUFFER="${tokens[1]} "

    if [ -n "$base" ]; then
      base="${(q)base}"

      if [ "${tokens[2][1]}" = "~" ]; then
        base="${base/#$HOME/~}"
      fi

      LBUFFER="${LBUFFER}${base}"
    fi

    LBUFFER="${LBUFFER}${matches}/"
  fi

  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
}

#------------------------------------------------------------------------------
# CUSTOM FUNCTIONS
#------------------------------------------------------------------------------


# Find files/directories in the current directory only
findfile() {
    find "$1" -maxdepth 1 -type f -name "$2" -print | sort
}

finddir() {
    find "$1" -maxdepth 1 -type d -name "$2" -print
}

# Find files/directories recursively
findfileR() {
    find "$1" -type f -name "$2" -print | sort
}

finddirR() {
    find "$1" -type d -name "$2" -print
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

function y() {
	local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
	command rm -f -- "$tmp"
}

export EDITOR="nvim"

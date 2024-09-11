# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin:/bin:/usr/local/games:/usr/games

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

CASE_SENSITIVE="true"

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting you-should-use fzf)

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"

alias update="sudo apt update"
alias upgrade="sudo apt full-upgrade -y"
alias bat="batcat"
alias cat="bat"
alias reload-zsh="source ~/.zshrc"
alias ls="eza --color=always --long --git --icons=always --no-time"
alias cd="z"
alias fd="fdfind"
alias autoremove="sudo apt autoremove -y"

# Bat theme
export BAT_THEME=tokyonight_night

# The fuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# Zoxide (cd)
eval "$(zoxide init zsh)"

# fzf
export FZF_DEFAULT_OPTS="
--color=fg:#908caa,bg:#232136,hl:#fcff54
--color=fg+:#e0def4,bg+:#393552,hl+:#fcff54
--color=border:#44415a,header:#3e8fb0,gutter:#232136
--color=spinner:#f6c177,info:#9ccfd8
--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

export FZF_DEFAULT_COMMAND="fdfind --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fdfind --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fdfind --type=d --hidden --exclude .git . "$1"
}

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --icons=always --color=always {} | head -200; else batcat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}


# zsh syntax highlighting
# tokyonight
source ~/.oh-my-zsh/custom/themes/zsh-syntax-highlighting.zsh

# startship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

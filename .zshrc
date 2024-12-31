# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin:$HOME/.local/bin
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="comfyline"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# ZSH_CUSTOM=/path/to/new-custom-folder
plugins=(git docker zsh-autosuggestions zsh-syntax-highlighting fzf you-should-use command-not-found nmap)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"
# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
alias updt="sudo apt update"
alias upgrd="sudo apt full-upgrade -y"
alias bat="batcat"
alias cat="bat"
alias reload-zsh="source ~/.zshrc"
alias ls="eza --color=always --long --git --icons=always --no-time"
alias cd="z"
alias fd="fdfind"
alias autoremove="sudo apt autoremove -y"
alias cls="clear"
alias nuclei="nuclei.exe"
alias nmap="nmap.exe"
alias gobuster="gobuster.exe"
alias dirsearch="dirsearch.exe"
alias arjun="arjun.exe"
alias sqlmap="sqlmap.exe"
alias subfinder="subfinder.exe"
alias httpx="httpx-go.exe"
alias gau="gau.exe"
alias exiftool="exiftool.exe"
alias social-analyzer="python.exe -m social-analyzer"
alias sherlock="sherlock.exe"
alias maigret="maigret.exe"

eval "$(zoxide init zsh)"
export BAT_THEME=tokyonight_night

# fzf
source <(fzf --zsh)
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

source ~/.oh-my-zsh/custom/themes/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"                                       

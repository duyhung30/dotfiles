[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
# Example install plugins
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
# plug "zap-zsh/exa"
#Example plugin pinned to specifc commit or branch, just pass the git reference
plug "zsh-users/zsh-syntax-highlighting" "122dc46"

# Example theme
# plug "zap-zsh/zap-prompt"
# plug "zap-zsh/atmachine-prompt"
# plug "zettlrobert/simple-prompt"
# plug "MAHcodes/distro-prompt"

alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

alias lg="lazygit"
alias e="exit"
alias c="clear"
alias nf="neofetch"
alias update="sudo pacman -Syyu"
alias shutdown="poweroff"
alias kill="tmux kill-server"

alias ls='exa --group-directories-first --icons'
alias ll='ls -lh --git'
alias la='ll -a'
alias tree='ll --tree --level=2'

alias hx="helix"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(zoxide init zsh)"
# cowsay "Welcome back, Hung!!!"
# neofetch
# ~/.zshrc

# alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
#
# function nvims() {
#   items=("default" "AstroNvim")
#   config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
#   if [[ -z $config ]]; then
#     echo "Nothing selected"
#     return 0
#   elif [[ $config == "default" ]]; then
#     config=""
#   fi
#   NVIM_APPNAME=$config nvim $@
# }
#
# bindkey -s ^a "nvims\n"

eval "$(starship init zsh)"

if status is-interactive
    # Commands to run in interactive sessions can go here
end
# Removes fish intro prompt
set fish_greeting ""

# True-colour terminal
set -gx TERM xterm-256color

# Aliases
alias g git
alias grep rg
command -qv nvim && alias vim nvim

# Alias to clear swap if Linux refuses to
# clear RAM used
alias drop_cache="sudo sh -c \"echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'\""

if type -q exa
    alias ls='exa --group-directories-first --icons'
    alias ll='ls -lh --git'
    alias la='ll -a'
    alias tree='ll --tree --level=2'
end
alias lg="lazygit"
alias e="exit"
alias c="clear"
alias nf="neofetch"
alias update="sudo pacman -Syyu"
alias shutdown="poweroff"
alias kill="tmux kill-server"
alias cpu="sudo auto-cpufreq --stats"
alias up="uptime -p"

alias bigmoni="xrandr --output eDP --off"

# Set up Environmental Variables
set -gx EDITOR nvim
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH node_modules/.bin $PATH
set -gx XDG_CONFIG_HOME $HOME/.config/

zoxide init fish | source

begin
  nvm use 18
end &> /dev/null


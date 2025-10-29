if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -U fish_greeting ""

alias ls="eza"
alias cd="z"
alias conf="nvim /etc/nix-darwin"

starship init fish | source
zoxide init fish | source
neofetch

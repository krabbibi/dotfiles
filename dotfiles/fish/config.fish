if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -U fish_greeting ""

alias ls="eza"
alias cd="zoxide"

starship init fish | source
zoxide init fish | source
neofetch

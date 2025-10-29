{
  nix-colors,
    ...
}:
{
  imports = [
    ./hyprland.nix 
    ./hyprlock.nix 
    ./hyprpaper.nix
    ./hypridle.nix
    ./ghostty.nix
    ./btop.nix
    ./mako.nix
    # ./vscode.nix
    ./waybar.nix 
    ./wofi.nix
    # ./zoxide.nix
    ./zsh.nix
    nix-colors.homeManagerModules.default
  ];

  colorScheme = nix-colors.colorSchemes.catppuccin-mocha;
  # home.file = {
  #   ".local/share/omarchy/bin" = {
  #     source = ../../bin;
  #     recursive = true;
  #   };
  # };
}

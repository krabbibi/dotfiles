{
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../modules/home-manager/aerospace.nix
    ../modules/home-manager/common.nix
    ../modules/home-manager/btop.nix
    ../modules/home-manager/zsh.nix
    ../modules/packages/home/common.nix
    ../modules/packages/home/darwin.nix
  ];
  home = {
    username = "krabbe";
    homeDirectory = "/Users/krabbe";
    file = {
      ".config/sketchybar" = {
        source = ../dotfiles/sketchybar;
        recursive = true;
      };
      ".config/ghostty" = {
        source = ../dotfiles/ghostty;
        recursive = true;
      };
      ".config/raycast" = {
        source = ../dotfiles/raycast;
        recursive = true;
      };
    };
  };
}

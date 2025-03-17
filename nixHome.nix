{
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [ ./home.nix ];
  home = {
    username = "krabbe";
    homeDirectory = "/home/krabbe";
    packages = with pkgs; [
      thefuck
    ];
    file = {

      ".config/waybar" = {
        source = dotfiles/ghostty;
        recursive = true;
      };
      ".config/hypr" = {
        source = dotfiles/hypr;
        recursive = true;
      };
    };
  };
}

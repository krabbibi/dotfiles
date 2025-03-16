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
    packages = with pkgs; [
    ];
  };
}

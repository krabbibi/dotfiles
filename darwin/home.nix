{
  nix-colors,
  ...
}:
{
  imports = [
    nix-colors.homeManagerModules.default
    ../modules/home/aerospace.nix
    ../modules/home/common.nix
    ../modules/home/btop.nix
    ../modules/home/zsh.nix
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
      ".config/borders" = {
        source = ../dotfiles/borders;
        recursive = true;
      };
      ".config/raycast" = {
        source = ../dotfiles/raycast;
        recursive = true;
      };
    };
  };
}

{
  lib,
  ...
}:
{
  imports = [
    ./home.nix
    ./modules/home/default.nix
  ];
  home = {
    username = "krabbe";
    homeDirectory = lib.mkOverride 1 "/home/krabbe";
    file = {
      #
      #   ".config/waybar" = {
      #     source = dotfiles/waybar;
      #     recursive = true;
      #   };
      # ".config/hypr" = {
      #   source = dotfiles/hypr;
      #   recursive = true;
      # };
      #   ".config/wofi" = {
      #     source = dotfiles/wofi;
      #     recursive = true;
      #   };
    };
  };
}

{
  lib,
  nix-colors,
  ...
}:
{
  imports = [
    nix-colors.homeManagerModules.default
    ../modules/packages/home/common.nix
    ../modules/home/bindings.nix
    ../modules/home/common.nix
    ../modules/home/hyprland.nix
    ../modules/home/hyprlock.nix
    ../modules/home/hyprpaper.nix
    ../modules/home/hypridle.nix
    ../modules/home/ghostty.nix
    ../modules/home/btop.nix
    ../modules/home/mako.nix
    ../modules/home/waybar.nix
    ../modules/home/wofi.nix
    ../modules/home/zsh.nix
  ];
  home = {
    username = "krabbe";
    homeDirectory = lib.mkOverride 1 "/home/krabbe";
    sessionPath = [
      "/home/krabbe/.cargo/bin"
    ];
  };
}

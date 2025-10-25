{
  pkgs,
  ...
}:
let
  packages = import ../packages.nix { inherit pkgs; };
in
{
  imports = [
    ./hyprland.nix 
    ./system.nix
    ./1password.nix
    ./containers.nix
  ];
}

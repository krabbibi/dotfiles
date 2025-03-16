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
    homeDirectory = "/Users/krabbe";
    packages = with pkgs; [
      mkalias
    ];
  };
}

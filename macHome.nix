{ lib, config, pkgs, ... }:
{

  imports = [ ./home ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "krabbe";
  # home.homeDirectory = lib.mkDefault "/${if pkgs.stdenv.isDarwin then "Users" else "home"}/krabbe";
  home.homeDirectory = "/Users/krabbe/";
}

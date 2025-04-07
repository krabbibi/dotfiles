{
  pkgs,
  config,
  lib,
  ...
}:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.aldente
    pkgs.raycast
    #          pkgs.mullvad
  ];

  users.users.krabbe = {
    name = "krabbe";
    home = "/Users/krabbe";
  };
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  system.defaults.NSGlobalDomain._HIHideMenuBar = true;
  ##     system.defaults.NSGlobalDomain.InitialKeyRepeat = 2;

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };
    casks = [ "ghostty" ];
    brews = [
      "thefuck"
      "postgresql@17"
      "neomutt"
    ];
  };
  fonts.packages =
    [ ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  system.stateVersion = 6;
  system.defaults.SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
  security.pam.services.sudo_local.touchIdAuth = true;

  # The platform the configuration will be used on.
  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config = {
      allowUnfree = true;
    };
    # option.services.pgadmin.enable = true;
  };

  services = {
    openssh.enable = true;
    postgresql = {
      enable = true;
      package = pkgs.postgresql_17;
    };
  };
}

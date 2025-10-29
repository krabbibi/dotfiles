{
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../modules/packages/system/common.nix
    ../modules/packages/system/nixos.nix
  ];
  users = {
    defaultUserShell = pkgs.zsh;
    users.krabbe.isNormalUser = true;
    users.krabbe.group = "wheel";
  };
  # Bootloader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  nixpkgs.config.allowUnfree = true;

  environment = {
    variables.EDITOR = "nvim";
    shells = with pkgs; [
      zsh
    ];
  };

  programs = {
    hyprland = {
      enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland; # Use stable nixpkgs version to fix Qt version mismatch
    };
    mtr.enable = true;
    direnv.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    zsh.enable = true;
  };

  services = {
    resolved.enable = true;
    blueman.enable = true;
    greetd = {
      enable = true;
      settings.default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "krabbe";
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
    pulseaudio.enable = false;
  };
  fonts.packages =
    [ ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  hardware = {
    graphics.enable = true;
    bluetooth.enable = true;
  };

  security.rtkit.enable = true;
  system.stateVersion = "24.11"; # Did you read the comment?

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}

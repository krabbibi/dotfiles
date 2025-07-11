{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

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

  # Configure keymap in X11
  services = {
    kanata = {
      enable = true;
      keyboards = {
        "logi" = {
          config = ''
            (defsrc
              grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
              tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
              caps a    s    d    f    g    h    j    k    l    ;    '    ret
              lsft z    x    c    v    b    n    m    ,    .    /    rsft
              lctl lmet lalt           spc            ralt rmet rctl
            )

            (deflayer colemak
              grv   1    2    3    4    5    6    7    8    9    0    -    =    bspc
              tab   q    w    e    r    t    y    u    i    o    p    [    ]    \
              @hypr a    s    d    f    g    h    j    k    l    ;    '    ret
              lsft  z    x    c    v    b    n    m    ,    .    /    rsft
              lctl  lmet lalt           spc            ralt rmet rctl
            )
            (defalias
              hypr (multi lsft lctl lalt)
            )

          '';
          extraDefCfg = ''
            process-unmapped-keys yes
          '';
        };
      };
    };
    xserver.xkb = {
      layout = "us";
      variant = "";
      extraLayouts.ushypr = {
        description = "US layout with Hyper Key";
        languages = [ "eng" ];
      };
    };
    openssh.enable = true;
    ollama = {
      enable = true;
      acceleration = "rocm";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      extraConfig.pipewire."91-null-sinks" = {
        "context.objects" = [
          {
            factory = "spa-node-factory";
            args = {
              "factory.name" = "support.node.driver";
              "node.name" = "Dummy-Driver";
              "priority.driver" = 8000;
            };
          }
          {
            factory = "adapter";
            args = {
              "factory.name" = "support.null-audio-sink";
              "node.name" = "Microphone-Proxy";
              "node.description" = "Microphone";
              "media.class" = "Audio/Source/Virtual";
              "audio.position" = "MONO";
            };
          }
          {
            factory = "adapter";
            args = {
              "factory.name" = "support.null-audio-sink";
              "node.name" = "Main-Output-Proxy";
              "node.description" = "Main Output";
              "media.class" = "Audio/Sink";
              "audio.position" = "FL,FR";
            };
          }
        ];
      };
    };
    hypridle.enable = true;
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "greeter";
        };
      };
    };
  };

  security = {
        rtkit.enable = true;
        pam.services.hyprlock = {};
    };
  users.users.krabbe = {
    isNormalUser = true;
    description = "krabbe";
    extraGroups = [
      "networkmanager"
      "wheel"
      "uinput"
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    systemPackages = with pkgs; [
      bash
      zsh
      ghostty
      hyprpicker
      pavucontrol
      hyprcursor
      hyprlock
      hypridle
      hyprpaper
      waybar
      pyprland
      pywal
      kanata
    ];
    variables.EDITOR = "nvim";
  };
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
  fonts.packages =
    [ ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  hardware = {
    graphics.enable = true;
  };
  system.stateVersion = "24.11"; # Did you read the comment?
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}

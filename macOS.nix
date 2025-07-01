{
  pkgs,
  config,
  lib,
  ...
}:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    aldente
    raycast
  ];

  # The platform the configuration will be used on.
  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config = {
      allowUnfree = true;
    };
    # option.services.pgadmin.enable = true;
  };

  users.users.krabbe = {
    name = "krabbe";
    home = "/Users/krabbe";
  };

  # Necessary for using flakes on this system.
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      warn-dirty = false;
    };
  };

  homebrew = {
    enable = true;
    global.autoUpdate = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    casks = [
      "ghostty"
            "signal"
    ];

    brews = [
      "thefuck"
      "postgresql@17"
      "neomutt"
      "pyenv"
      "lcdf-typetools"
    ];

    masApps = {
      "Telegram" = 747648890;
    };
  };

  fonts.packages =
    [ ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  system.stateVersion = 6;
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    primaryUser = "krabbe";
    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        AppleShowScrollBars = "Always";
        NSUseAnimatedFocusRing = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;
        _HIHideMenuBar = false;
        NSDocumentSaveNewDocumentsToCloud = false;
        ApplePressAndHoldEnabled = false;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        "com.apple.mouse.tapBehavior" = 1;
        NSWindowShouldDragOnGesture = true;
        NSAutomaticSpellingCorrectionEnabled = false;
      };

      CustomUserPreferences = {
        "com.apple.finder" = {
          ShowExternalHardDrivesOnDesktop = true;
          ShowHardDrivesOnDesktop = false;
          ShowMountedServersOnDesktop = false;
          ShowRemovableMediaOnDesktop = true;
          _FXSortFoldersFirst = true;
          # When performing a search, search the current folder by default
          FXDefaultSearchScope = "SCcf";
          DisableAllAnimations = false;
          NewWindowTarget = "PfDe";
          NewWindowTargetPath = "file://$\{HOME\}/Desktop/";
          AppleShowAllExtensions = true;
          FXEnableExtensionChangeWarning = false;
          ShowStatusBar = true;
          ShowPathbar = true;
          WarnOnEmptyTrash = false;
        };

        "com.apple.desktopservices" = {
          # Avoid creating .DS_Store files on network or USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };

        "com.apple.dock" = {
          autohide = true;
          launchanim = false;
          static-only = false;
          show-recents = false;
          show-process-indicators = true;
          orientation = "left";
          tilesize = 36;
          minimize-to-application = true;
          mineffect = "scale";
          enable-window-tool = false;
        };

        "com.apple.ActivityMonitor" = {
          OpenMainWindow = true;
          IconType = 5;
          SortColumn = "CPUUsage";
          SortDirection = 0;
        };

        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };

        "com.apple.SoftwareUpdate" = {
          AutomaticCheckEnabled = true;
          # Check for software updates daily, not just once per week
          ScheduleFrequency = 1;
          # Download newly available updates in background
          AutomaticDownload = 1;
          # Install System data files & security updates
          CriticalUpdateInstall = 1;
        };

        "com.apple.TimeMachine".DoNotOfferNewDisksForBackup = true;

        # Prevent Photos from opening automatically when devices are plugged in
        "com.apple.ImageCapture".disableHotPlug = true;

        # Turn on app auto-update
        "com.apple.commerce".AutoUpdate = true;

        "com.googlecode.iterm2".PromptOnQuit = false;

        "com.google.Chrome" = {
          AppleEnableSwipeNavigateWithScrolls = true;
          DisablePrintPreview = true;
          PMPrintingExpandedStateForPrint2 = true;
        };

      };
      LaunchServices.LSQuarantine = false; # disables "Are you sure?" for new apps
      loginwindow.GuestEnabled = false;
      finder.FXPreferredViewStyle = "Nlsv";
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };

  services = {
    openssh.enable = true;
    postgresql = {
      enable = true;
      package = pkgs.postgresql_17;
    };

  };
}

{ pkgs, config, ... }: 
{
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
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

      homebrew.enable = true;
      homebrew.casks = [ "ghostty" ];

      # Enable alternative shell support in nix-darwin.
      programs.fish.enable = true;
      fonts.packages = [ 
          pkgs.nerd-fonts.comic-shanns-mono
          pkgs.nerd-fonts.fira-code ];
      # Set Git commit hash for darwin-version.
  #      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
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
        postgresql.enable = true;  
        spacebar = {
          enable = true;
          package = pkgs.spacebar;
          config = {
            position                   = "top";
            display                    = "main";
            height                     = 26;
            title                      = "on";
            spaces                     = "on";
            clock                      = "on";
            power                      = "on";
            padding_left               = 20;
            padding_right              = 20;
            spacing_left               = 25;
            spacing_right              = 15;
            text_font                  = ''"Menlo:Regular:12.0"'';
            icon_font                  = ''"Font Awesome 5 Free:Solid:12.0"'';
            background_color           = "0xff202020";
            foreground_color           = "0xffa8a8a8";
            power_icon_color           = "0xffcd950c";
            battery_icon_color         = "0xffd75f5f";
            dnd_icon_color             = "0xffa8a8a8";
            clock_icon_color           = "0xffa8a8a8";
            power_icon_strip           = " ";
            space_icon                 = "•";
            space_icon_strip           = "1 2 3 4 5 6 7 8 9 10";
            spaces_for_all_displays    = "on";
            display_separator          = "on";
            display_separator_icon     = "";
            space_icon_color           = "0xff458588";
            space_icon_color_secondary = "0xff78c4d4";
            space_icon_color_tertiary  = "0xfffff9b0";
            clock_icon                 = "";
            dnd_icon                   = "";
            clock_format               = ''"%d/%m/%y %R"'';
            right_shell                = "on";
            right_shell_icon           = "";
            right_shell_command        = "whoami";
          };
        };
      };
}

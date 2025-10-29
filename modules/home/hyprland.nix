{
  lib,
  config,
  ...
}:
let
  hexToRgba =
    hex: alpha:
    let
    in
    "rgba(${hex}${alpha})";

  inactiveBorder = hexToRgba config.colorScheme.palette.base09 "aa";
  activeBorder = hexToRgba config.colorScheme.palette.base0D "aa";
in
{
  imports = [ ./bindings.nix ];
  wayland.windowManager.hyprland = {
    enable = true;
    #    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 10;

        border_size = 2;
        resize_on_border = false;

        allow_tearing = false;

        "col.active_border" = activeBorder;
        "col.inactive_border" = inactiveBorder;
        layout = "dwindle";
      };

      decoration = {
        rounding = 4;
        shadow = {
          enabled = false;
          range = 30;
          render_power = 3;
          ignore_window = true;
          color = "rgba(00000045)";
        };
        blur = {
          enabled = true;
          size = 5;
          passes = 2;
          vibrancy = 0.1696;
        };
      };
      monitorv2 = [
        {
          output = "HDMI-A-1";
          mode = "3440x1440@100";
          position = "1080x0";
          scale = 1.33333333;
          transform = 0;
        }
        {
          output = "DP-1";
          mode = "1920x1080";
          position = "0x0";
          scale = 1;
          transform = 3;
        }
      ];

      input = lib.mkDefault {
        kb_layout = "us";
        # kb_variant =
        # kb_model =
        kb_options = "compose:caps";
        # kb_rules =

        follow_mouse = 1;
        repeat_delay = 150;
        repeat_rate = 18;

        sensitivity = -0.9; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
          natural_scroll = false;
        };
      };
      animations = {
        enabled = true; # yes, please :)
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 0, 0, ease"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        force_split = 2;
      };

      master = {
        new_status = "master";
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };
      # Default applications
      "$terminal" = lib.mkDefault "ghostty";
      "$fileManager" = lib.mkDefault "nautilus --new-window";
      "$browser" = lib.mkDefault "chromium --new-window --ozone-platform=wayland";
      "$music" = lib.mkDefault "spotify";
      "$passwordManager" = lib.mkDefault "1password";
      "$messenger" = lib.mkDefault "signal-desktop";
      "$webapp" = lib.mkDefault "$browser --app";
      exec-once = [
        # "hypridle & mako & waybar & fcitx5"
        # "waybar"
        # "swaybg -i ~/.config/omarchy/current/background -m fill"
        "hyprsunset"
        "systemctl --user start hyprpolkitagent"
        "wl-clip-persist --clipboard regular & clipse -listen"
        "bash /home/krabbe/scripts/paper.sh"

        # "dropbox-cli start"  # Uncomment to run Dropbox
      ];

      exec = [
        "pkill -SIGUSR2 waybar || waybar"
      ];
      windowrule = [
        # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
        "suppressevent maximize, class:.*"

        # Force chromium into a tile to deal with --app bug
        "tile, class:^(chromium)$"

        # Settings management
        "float, class:^(org.pulseaudio.pavucontrol|blueberry.py)$"

        # Float Steam, fullscreen RetroArch
        "float, class:^(steam)$"
        "fullscreen, class:^(com.libretro.RetroArch)$"

        # Just dash of transparency
        "opacity 0.97 0.9, class:.*"
        # Normal chrome Youtube tabs
        "opacity 1 1, class:^(chromium|google-chrome|google-chrome-unstable)$, title:.*Youtube.*"
        "opacity 1 0.97, class:^(chromium|google-chrome|google-chrome-unstable)$"
        "opacity 0.97 0.9, initialClass:^(chrome-.*-Default)$ # web apps"
        "opacity 1 1, initialClass:^(chrome-youtube.*-Default)$ # Youtube"
        "opacity 1 1, class:^(zoom|vlc|org.kde.kdenlive|com.obsproject.Studio)$"
        "opacity 1 1, class:^(com.libretro.RetroArch|steam)$"

        # Fix some dragging issues with XWayland
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

        # Float in the middle for clipse clipboard manager
        "float, class:(clipse)"
        "size 622 652, class:(clipse)"
        "stayfocused, class:(clipse)"
      ];

      layerrule = [
        # Proper background blur for wofi
        "blur,wofi"
        "blur,waybar"
      ];
    };
  };
  services.hyprpolkitagent.enable = true;
}

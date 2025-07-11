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
    homeDirectory = "/home/krabbe";
    packages = with pkgs; [
      wofi
    ];
    file = {

      ".config/waybar" = {
        source = dotfiles/waybar;
        recursive = true;
      };
      ".config/hypr" = {
        source = dotfiles/hypr;
        recursive = true;
      };
      ".config/wofi" = {
        source = dotfiles/wofi;
        recursive = true;
      };
    };
  };
programs = {
    hyprlock = {
        enable = true;
        settings = {
            background = [
                {
                    path = "screenshot";
                    blur_passes = 1;
                    blur_size = 8;
                }
            ];

            input-field = [
                {
                    size = "200, 50";
                    position = "0, -80";
                    monitor = "";
                    dots_center = true;
                    fade_on_empty = false;
                    font_color = "rgb(202, 211, 245)";
                    inner_color = "rgb(91, 96, 120)";
                    outer_color = "rgb(24, 25, 38)";
                    outline_thickness = 5;
                    shadow_passes = 2;
                }
            ];
        };
    };
};
}

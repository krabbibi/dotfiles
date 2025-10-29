{ ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      # Window settings
      window-padding-x = 14;
      window-padding-y = 14;
      background-opacity = 0.9;
      window-decoration = "none";

      font-family = "Iosevka Nerd Font Mono";
      font-size = 14;

      theme = "Catppuccin Mocha";
      keybind = [
        "ctrl+k=reset"
      ];
    };
  };
}

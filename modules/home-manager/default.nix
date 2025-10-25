{
  config,
  pkgs,
  lib,
  ...
}:
let
  packages = import ../packages.nix {
    inherit pkgs lib;
  };

  themes = import ../themes.nix;

  # Handle theme selection - either predefined or generated
  # selectedTheme =
  #   if (config.omarchy.theme == "generated_light" || config.omarchy.theme == "generated_dark") then
  #     null
  #   else
  #     themes.${config.omarchy.theme};

  # Generate color scheme from wallpaper for generated themes
  # generatedColorScheme =
    # if (config.omarchy.theme == "generated_light" || config.omarchy.theme == "generated_dark") then
    #   (inputs.nix-colors.lib.contrib { inherit pkgs; }).colorSchemeFromPicture {
    #     path = config.omarchy.theme_overrides.wallpaper_path;
    #     variant = if config.omarchy.theme == "generated_light" then "light" else "dark";
    #   }
    # else
    #   null;
in
{
  imports = [
    ./hyprland.nix 
    ./hyprlock.nix 
    ./hyprpaper.nix
    ./hypridle.nix
    ./ghostty.nix
    ./btop.nix
    ./direnv.nix
    ./git.nix
    ./mako.nix
    ./starship.nix
    ./vscode.nix
    ./waybar.nix 
    ./wofi.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  # home.file = {
  #   ".local/share/omarchy/bin" = {
  #     source = ../../bin;
  #     recursive = true;
  #   };
  # };
  home.packages = packages.homePackages;

  # colorScheme =
  #   if (config.omarchy.theme == "generated_light" || config.omarchy.theme == "generated_dark") then
  #     generatedColorScheme
  #   else
  #     inputs.nix-colors.colorSchemes.${selectedTheme.base16-theme};
  #
  # gtk = {
  #   enable = true;
  #   theme = {
  #     name = if config.omarchy.theme == "generated_light" then "Adwaita" else "Adwaita:dark";
  #     package = pkgs.gnome-themes-extra;
  #   };
  # };

  # TODO: Add an actual nvim config
  programs.neovim.enable = true;
}

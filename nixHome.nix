{
  inputs,
  ...
}:
{
  imports = [ 
    ./home.nix
    ./modules/home-manager/default.nix 
  ];
  home = {
    username = "krabbe";
    #homeDirectory = "/home/krabbe";
    # packages = with pkgs; [
    #   wofi
    #   unzip
    # ];
    # file = {
    #
    #   ".config/waybar" = {
    #     source = dotfiles/waybar;
    #     recursive = true;
    #   };
    #   ".config/hypr" = {
    #     source = dotfiles/hypr;
    #     recursive = true;
    #   };
    #   ".config/wofi" = {
    #     source = dotfiles/wofi;
    #     recursive = true;
    #   };
    # };
  };
  programs = {
      # hyprlock = {
      #     enable = true;
      # };
      # walker = {
      #     enable = true;
      #     runAsService = true;
      #     config = {
      #       theme = "catppuccin";
      #       force_keyboard_focus = true;                                                 # forces keyboard forcus to stay 
      #       close_when_open = true;                                                      # close walker when invoking while already opened
      #       selection_wrap = true;                                                       # wrap list if at bottom or top
      #       click_to_close = true;                                                       # closes walker if clicking outside of the main content area
      #       global_argument_delimiter = "#";                                             # query: firefox#https://benz.dev => part after delimiter will be ignored when querying. this should be the same as in the elephant config
      #       exact_search_prefix = "'";                                                   # disable fuzzy searching
      #       disable_mouse = false;
      #       placeholders."default" = { input = "Search"; list = "Example"; };
      #       providers = {
      #         default = [
      #           "desktopapplications"
      #           "menus"
      #           "websearch"
      #         ]; # providers to be queried by default
      #         empty = ["desktopapplications"]; # providers to be queried when query is empty
      #         max_results = 50; # global max results
      #         prefixes = [
      #           {prefix = "/"; provider = "providerlist";}
      #           {prefix = "."; provider = "files";}
      #           {prefix = ":"; provider = "symbols";}
      #           {prefix = "="; provider = "calc";}
      #           {prefix = "@"; provider = "websearch";}
      #           {prefix = "$"; provider = "clipboard";}
      #         ];
      #       };
      #       keybinds.quick_activate = ["F1" "F2" "F3"];
      #     };
      #
      #   };
  };
}

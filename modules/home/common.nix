{
  pkgs,
  nix-colors,
  ...
}:

{
  home = {
    stateVersion = "24.11"; # Please read the comment before changing.
    file = {
      ".config/neofetch" = {
        source = ../../dotfiles/neofetch;
        recursive = true;
      };
      ".config/starship.toml" = {
        source = ../../dotfiles/starship.toml;
      };
      ".config/nvim" = {
        source = ../../dotfiles/nvim;
        recursive = true;
      };
    };
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  colorScheme = nix-colors.colorSchemes.spaceduck;
  programs = {
    bash = {
      enable = true;
      initExtra = "zsh";
    };
    home-manager.enable = true;
    neovim = {
      enable = true;
      plugins = [
        pkgs.vimPlugins.nvim-treesitter.withAllGrammars
        pkgs.vimPlugins.statix
      ];
    };
    starship.enable = true;
    git = {
      enable = true;
      settings = {
        user = {
          name = "krabbibi";
          email = "sebastian.alexander.mock@gmail.com";
        };
        credential.helper = "store";
      };
    };

    gh = {
      enable = true;
      gitCredentialHelper = {
        enable = true;
      };
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}

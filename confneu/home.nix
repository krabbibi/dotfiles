{
  pkgs,
  inputs,
  ...
}:

{
  #  home.username = "krabbe";
  # home.homeDirectory = lib.mkDefault "/${if pkgs.stdenv.isDarwin then "Users" else "home"}/krabbe";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    # # terminal
    # bat
    # coreutils
    # delta
    # eza
    # fd
    # fish
    # fzf
    # gh
    # neofetch
    # ripgrep
    # tmux
    # tldr
    # zoxide
    #
    # # ui apps
    #     #spotify
    # obsidian
    # brave
    # pgadmin
    # neomutt
    #
    # # dev
    # nodejs
    #     pnpm
    # rustup
    # ollama
    #
    # # misc
    # age
    # gnupg
    # sops
    # ghostscript
    # imagemagick
    # mermaid-cli
    # tectonic
    # isync
    # msmtp
    # pass
    # abook
    # lynx
    # notmuch
  ];

  home.file = {
    # ".config/fish" = {
    #     source = dotfiles/fish;
    #     recursive = true;
    # };
    # ".config/ghostty" = {
    #   source = dotfiles/ghostty;
    #   recursive = true;
    # };
    ".config/neofetch" = {
      source = dotfiles/neofetch;
      recursive = true;
    };
    ".config/starship.toml" = {
      source = dotfiles/starship.toml;
    };
    ".config/nvim" = {
      source = dotfiles/nvim;
      recursive = true;
    };
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.sessionPath = [
    "/home/krabbe/.cargo/bin"
    "/etc/profiles/per-user/krabbe/bin"
  ];

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

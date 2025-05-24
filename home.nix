{
  lib,
  config,
  pkgs,
  ...
}:

{
  # imports = [ ./nixvim ];
  home.username = "krabbe";
  # home.homeDirectory = lib.mkDefault "/${if pkgs.stdenv.isDarwin then "Users" else "home"}/krabbe";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    # terminal
    bash
    zsh
    oh-my-posh
    neofetch
    tldr
    zoxide
    fd
    gh
    ripgrep
    fzf
    bat
    eza
    delta
    starship

    # ui apps
    spotify
    obsidian
    brave
    signal-desktop
    pgadmin
    neomutt

    # dev
    git
    nodejs
    rustup
    ollama

    # misc
    openssh
    age
    gnupg
    sops
    ghostscript
    imagemagick
    mermaid-cli
    tectonic
    isync
    msmtp
    pass
    abook
    lynx
    notmuch
  ];

  home.file = {
    ".config/ghostty" = {
      source = dotfiles/ghostty;
      recursive = true;
    };
    ".config/neofetch" = {
      source = dotfiles/neofetch;
      recursive = true;
    };
    ".config/starship.toml" = {
      source = dotfiles/starship.toml;
    };
    ".config/nvim" = {
      source = dotfiles/nvim;
    };
  };
  home.shell.enableZshIntegration = true;
  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "zsh";
  };

  programs = {
    bash.enable = true;
    direnv.enable = true;
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "krabbibi";
      userEmail = "sebastian.alexander.mock@gmail.com";

      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    ssh = {
      enable = true;
      addKeysToAgent = "yes";
      matchBlocks = {
        "github.com" = {
          hostname = "github.com";
          user = "git";
          identityFile = "~/.ssh/main";
        };
      };
    };
    #   zsh = {
    #     enable = true;
    #     autosuggestion.enable = true;
    #     enableCompletion = true;
    #     dotDir = ".config/zsh";
    #     shellAliases = {
    #       v = "nvim";
    #       c = "clear";
    #       s = "web_search duckduckgo";
    #     };
    #     oh-my-zsh = {
    #       enable = true;
    #       extraConfig = builtins.readFile ./extraConfig.zsh;
    #       # Additional oh-my-zsh plugins
    #       plugins = [
    #         "web-search"
    #         "copyfile"
    #         "copybuffer"
    #         "fzf"
    #         "thefuck"
    #       ];
    #     };
    #
    #     plugins = [
    #       # Autocompletions
    #       {
    #         name = "zsh-autosuggestions";
    #         src = pkgs.fetchFromGitHub {
    #           owner = "zsh-users";
    #           repo = "zsh-autosuggestions";
    #           rev = "v0.7.1";
    #           hash = "sha256-vpTyYq9ZgfgdDsWzjxVAE7FZH4MALMNZIFyEOBLm5Qo=";
    #         };
    #       }
    #       # Completion scroll
    #       {
    #         name = "zsh-completions";
    #         src = pkgs.fetchFromGitHub {
    #           owner = "zsh-users";
    #           repo = "zsh-completions";
    #           rev = "0.35.0";
    #           hash = "sha256-GFHlZjIHUWwyeVoCpszgn4AmLPSSE8UVNfRmisnhkpg=";
    #         };
    #       }
    #       # Highlight commands in terminal
    #       {
    #         name = "zsh-syntax-highlighting";
    #         src = pkgs.fetchFromGitHub {
    #           owner = "zsh-users";
    #           repo = "zsh-syntax-highlighting";
    #           rev = "0.8.0";
    #           hash = "sha256-iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
    #         };
    #       }
    #     ];
    #   };
  };
}

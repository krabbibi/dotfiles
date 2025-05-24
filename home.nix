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
    fish
    neovim
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
      recursive = true;
    };
    ".zshrc" = {
      source = dotfiles/zshrc;
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
  };
}

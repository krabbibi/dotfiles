{
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
    bat
    coreutils
    delta
    eza
    fd
    fish
    fzf
    gh
    neofetch
    ripgrep
    tmux
    tldr
    zoxide

    # ui apps
    spotify
    obsidian
    brave
    pgadmin
    neomutt

    # dev
    nodejs
        pnpm
    rustup
    ollama

    # misc
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
    ".config/fish" = {
        source = dotfiles/fish;
        recursive = true;
    };
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
    # ".aerospace.toml" = {
    #   source = dotfiles/aerospace/aerospace.toml;
    # };
    ".config/sketchybar" = {
      source = dotfiles/sketchybar;
      recursive = true;
    };
    ".config/nvim" = {
      source = dotfiles/nvim;
      recursive = true;
    };
    ".zshrc" = {
      source = dotfiles/.zshrc;
    };
  };
  home.shell.enableZshIntegration = true;
  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "zsh";
  };

  programs = {
    direnv.enable = true;
    home-manager.enable = true;
    neovim.enable = true;
    git = {
      enable = true;
       userName = "krabbibi";
       userEmail = "sebastian.alexander.mock@gmail.com";
    };
    ssh = {
      enable = true;
    };
    starship.enable = true;
  };
}

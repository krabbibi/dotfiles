{ lib, config, pkgs, ... }:

{
  imports = [ ./nixvim ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "krabbe";
  # home.homeDirectory = lib.mkDefault "/${if pkgs.stdenv.isDarwin then "Users" else "home"}/krabbe";
  home.homeDirectory = "/Users/krabbe";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    bash
    zsh
    oh-my-posh 
    neofetch
    spotify
    python3
    pywal
    brave
    git
    rustup
    openssh
    age
    sops

          mkalias
          gh
          pgadmin
    fzf
    thefuck
    bat
    eza
    delta
    tldr
    zoxide
    fd
  ];

  home.file = {
    ".config/nvim".source = config/nvim;
  };
  home.shell.enableZshIntegration = true;
  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "zsh";
  };

  programs = {
    bash.enable = true;
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "krabbibi";
      userEmail = "sebastian.alexander.mock@gmail.com";

      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    direnv.enable = true;
    starship.enable = true;
    nixvim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      luaLoader.enable = true;
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
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      dotDir = ".config/zsh";
      shellAliases = {
        hms = "home-manager switch";
        lg = "lazygit";
        v = "nvim";
        c = "clear";
        cat = "bat --theme='Catppuccin Mocha'";
        fk = "fuck";
        ls = "eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions";
        cd = "z";
        s = "web_search duckduckgo";
      };
      # oh-my-zsh = {
      #   enable = true;
      #   extraConfig = builtins.readFile ./extraConfig.zsh;
      #   # Additional oh-my-zsh plugins
      #   plugins = [
      #     "web-search"
      #     "copyfile"
      #     "copybuffer"
      #     "fzf"
      #     "thefuck"
      #   ];
      # };

      plugins = [
        # Autocompletions
        {
          name = "zsh-autosuggestions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "v0.7.1";
            hash = "sha256-vpTyYq9ZgfgdDsWzjxVAE7FZH4MALMNZIFyEOBLm5Qo=";
          };
        }
        # Completion scroll
        {
          name = "zsh-completions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-completions";
            rev = "0.35.0";
            hash = "sha256-GFHlZjIHUWwyeVoCpszgn4AmLPSSE8UVNfRmisnhkpg=";
          };
        }
        # Highlight commands in terminal
        {
          name = "zsh-syntax-highlighting";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-syntax-highlighting";
            rev = "0.8.0";
            hash = "sha256-iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
          };
        }
      ];
    #   initExtra = ''
    #     ;
    #             [[ ! -f ~/.config/home-manager/.p10k.zsh ]] || source ~/.config/home-manager/.p10k.zsh
    #   '';
    };
  };
}

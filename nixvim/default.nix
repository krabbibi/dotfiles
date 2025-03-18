{
  imports = [
    ./auto-cmds.nix
    ./bufferline.nix
    ./cmp.nix
    ./conform.nix
    ./keymaps.nix
    ./lsp.nix
    ./lualine.nix
    ./mini.nix
    ./neo-tree.nix
    ./options.nix
    ./snacks.nix
    ./telescope.nix
    ./tree-sitter.nix
  ];
  programs.nixvim = {
    colorschemes = {
      gruvbox.enable = true;
      catppuccin = {
        enable = false;
        settings = {
          flavour = "mocha";
          default_integrations = true;
          integrations = {
            cmp = true;
            treesitter = true;
            nvimtree = true;
            mini = {
              enabled = true;
              indentscope_color = "";
            };
          };
        };
      };
    };
    plugins = {
      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      transparent.enable = true;
      nui.enable = true;
      lazygit.enable = true;
      render-markdown.enable = true;
      web-devicons.enable = true;
      nix.enable = true;
      which-key.enable = true;
      trim = {
        enable = true;
        settings = {
          highlight = false;
          ft_blocklist = [
            "checkhealth"
            "floaterm"
            "lspinfo"
            "TelescopePrompt"
          ];
        };
      };
    };
  };
}

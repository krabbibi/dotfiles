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
        ./startup.nix
        ./telescope.nix
        ./tree-sitter.nix
		];
	programs.nixvim = {
		colorschemes = {
			catppuccin = {
        enable = true;
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

		      web-devicons.enable = true;
              nix.enable = true;
              which-key.enable = true;
		      nvim-autopairs.enable = true;
		      nvim-surround.enable = true;
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

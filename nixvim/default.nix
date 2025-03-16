{
	imports = [
		./tree-sitter.nix
		./options.nix
		./lualine.nix
        ./lsp.nix
        ./conform.nix
        ./cmp.nix
        ./mini.nix
        ./bufferline.nix
        ./telescope.nix
        ./auto-cmds.nix
        ./startup.nix
        ./keymaps.nix
		];
	programs.nixvim = {
		colorschemes = {
			tokyonight.enable = true;
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
		      none-ls.enable = true;
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

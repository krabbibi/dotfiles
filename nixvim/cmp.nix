let
  selectOpts = ''
    {
      behavior = cmp.SelectBehavior.Insert
    }
  '';
in
  {pkgs, ...}: {
    programs.nixvim.plugins = {
      avante.enable = true;
      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          performance = {
            debounce = 150;
          };
          sources = [
            {name = "path";}
            {
              name = "nvim_lsp";
              keywordLength = 1;
            }
            {
              name = "buffer";
              keywordLength = 3;
            }
            {name = "luasnip";}
          ];

          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          formatting = {
            fields = [
              "abbr"
              "kind"
              "menu"
            ];
            # format = lspkindFormat;
          };

          mapping = {
            "<Up>" = "cmp.mapping.select_prev_item(${selectOpts})";
            "<Down>" = "cmp.mapping.select_next_item(${selectOpts})";

            "<C-k>" = "cmp.mapping.select_prev_item(${selectOpts})";
            "<C-j>" = "cmp.mapping.select_next_item(${selectOpts})";

            "<C-u>" = "cmp.mapping.scroll_docs(-4)";
            "<C-d>" = "cmp.mapping.scroll_docs(4)";

            "<C-e>" = "cmp.mapping.abort()";
            "<C-y>" = "cmp.mapping.confirm({select = true})";
            "<CR>" = "cmp.mapping.confirm({select = false})";

            "<Tab>" = ''
              cmp.mapping(
                function(fallback)
                  local col = vim.fn.col('.') - 1

                  if cmp.visible() then
                    cmp.confirm({ select = true })
                  elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                    fallback()
                  else
                    cmp.complete()
                  end
                end,
                { "i", "s" }
              )
            '';

            "<S-Tab>" = ''
              cmp.mapping(
                function(fallback)
                  if cmp.visible() then
                    cmp.select_prev_item(select_opts)
                  else
                    fallback()
                  end
                end,
                { "i", "s" }
              )
            '';
          };
          window = {
            completion = {
              border = "rounded";
              winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None";
              zindex = 1001;
              scrolloff = 0;
              colOffset = 0;
              sidePadding = 1;
              scrollbar = true;
            };
            documentation = {
              border = "rounded";
              winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None";
              zindex = 1001;
              maxHeight = 20;
            };
          };
        };
      };
      cmp-nvim-lsp.enable = true;
      lspkind.enable = true;
      lspkind.cmp.enable = true;
      luasnip.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp-treesitter.enable = true;
      dap.enable = true;
      none-ls = {
        enable = true;
        sources.formatting = {
          alejandra.enable = true;
          hclfmt.enable = true;
          just.enable = true;
          opentofu_fmt.enable = true;
          prettier.enable = true;
          rubocop.enable = true;
          sqlformat.enable = true;
          stylua.enable = true;
          yamlfmt.enable = true;
        };
        sources.diagnostics = {
          trivy.enable = true;
          yamllint.enable = true;
        };
      };

      trouble = {
        enable = true;
      };
    };
  }

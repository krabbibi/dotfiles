{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;

        keymaps = {
          silent = true;
          diagnostic = {
            # Navigate in diagnostics
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };

        servers = {
          lua_ls.enable = true;
          nil_ls.enable = true;
          pyright.enable = true;
          pylsp.enable = true;
          tflint.enable = true;
          templ.enable = true;
          html.enable = true;
          htmx.enable = true;
          tailwindcss.enable = true;
          protols.enable = true;
          volar.enable = true;
          rust_analyzer = {
            enable = true;
            installRustc = false;
            installCargo = false;
          };
        };
      };
      none-ls = {
        enable = true;
        # sources.formatting = {
        #   alejandra.enable = true;
        #   hclfmt.enable = true;
        #   just.enable = true;
        #   opentofu_fmt.enable = true;
        #   prettier.enable = true;
        #   rubocop.enable = true;
        #   sqlformat.enable = true;
        #   stylua.enable = true;
        #   yamlfmt.enable = true;
        # };
        # sources.diagnostics = {
        #   trivy.enable = true;
        #   yamllint.enable = true;
        # };
      };

      trouble = {
        enable = true;
        settings = {
          modes = {
            lsp = {
              win = {
                position = "right";
              };
            };
          };
        };
      };
    };
  };
}

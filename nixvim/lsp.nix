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
          ts_ls.enable = true;
          rust_analyzer = {
            enable = true;
            installRustc = false;
            installCargo = false;
          };
        };
      };
    };
  };
}

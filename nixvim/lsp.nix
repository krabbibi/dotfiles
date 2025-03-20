{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        inlayHints = true;
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
          #         volar.init_options.vue.hybridMode = true;
          ts_ls = {
            enable = true;
            filetypes = [
              "javascript"
              "javascriptreact"
              "typescript"
              "typescriptreact"
              "vue"
            ];
            extraOptions = {
              plugins = {
                "@vue/typescript-plugin" = {
                  name = "@vue/typescript-plugin";
                  location = "/usr/local/lib/node_modules/@vue/typescript-plugin";
                  languages = [
                    "javascript"
                    "typescript"
                    "vue"
                  ];
                };
              };
              settings = {
                javascript = {
                  inlayHints = {
                    includeInlayEnumMemberValueHints = true;
                    includeInlayFunctionLikeReturnTypeHints = true;
                    includeInlayFunctionParameterTypeHints = true;
                    #  includeInlayParameterNameHints = "all";
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true;
                    includeInlayPropertyDeclarationTypeHints = true;
                    includeInlayVariableTypeHints = true;
                  };
                };
                typescript = {
                  inlayHints = {
                    includeInlayEnumMemberValueHints = true;
                    includeInlayFunctionLikeReturnTypeHints = true;
                    includeInlayFunctionParameterTypeHints = true;
                    #  includeInlayParameterNameHints = "all";
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true;
                    includeInlayPropertyDeclarationTypeHints = true;
                    includeInlayVariableTypeHints = true;
                  };
                };
              };
            };
          };
        };
      };
      none-ls.enable = false;
      bacon.enable = true;
      rustaceanvim = {
        enable = true;
        settings = {
          tools.enable_clippy = true;
          server = {
            default_settings = {
              inlayHints = {
                lifetimeElisionHints = {
                  enable = "always";
                };
              };
              rust-analyzer = {
                cargo = {
                  allFeatures = true;
                  loadOutDirsFromCheck = true;
                  buildScripts.enable = true;
                };
                check = {
                  command = "clippy";
                };
                checkOnSave = true;
                #               diagnostics = true;
                files = {
                  excludeDirs = [
                    "target"
                    ".git"
                    "node_modules"
                    ".cargo"
                    ".github"
                    ".direnv"
                  ];
                };
              };
            };
          };
        };
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
            diagnostics = {
              auto_open = true;
            };
          };
        };
      };
    };
  };
}

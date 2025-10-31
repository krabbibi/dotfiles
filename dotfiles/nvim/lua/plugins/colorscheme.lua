return {
  -- add gruvbox

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      auto_integrations = true,
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = {
      variant = "moon",
    },
  },
  {
    "spaceduck-theme/nvim",
    name = "spaceduck",
    priority = 1000,
  },
  {
    "sainnhe/sonokai",
    name = "sonokai",
    priority = 1000,
    opts = {
      transparent_background = true,
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "sonokai",
    },
  },
}

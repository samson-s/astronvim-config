return {
  colorscheme = 'gruvbox',

  plugins = {
    { "morhetz/gruvbox" },
    { "tpope/vim-surround", lazy = false },
    { "tpope/vim-fugitive", lazy = false },
    {
      "zbirenbaum/copilot.lua",
      lazy = false,
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({
          suggestion = {
            enabled = true,
            auto_trigger = true,
          },
          panel = {
            enabled = true,
            auto_refresh = true,
            keymap = {
              jump_prev = "<C-p>",
              jump_next = "<C-n>",
              accept = "<CR>",
              refresh = "gr",
              open = "<M-CR>"
            },
            layout = {
              position = "right", -- | top | left | right
              ratio = 0.4
            },
          },
        })
      end,
    },
    {
      "zbirenbaum/copilot-cmp",
      after = { "copilot.lua" },
      config = function()
        require("copilot_cmp").setup()
        astronvim.add_user_cmp_source "copilot"
      end,
    }
  },

  cmp = {
    source_priority = {
      -- copilot = 1250,
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  lsp = {
    servers = {
      "pyright",
      "tsserver",
      "rust_analyzer",
    },
    formatting = {
      format_on_save = {
        enabled = true,      -- enable or disable format on save globally
        ignore_filetypes = { -- disable format on save for specified filetypes
          "php",
        },
      },
    },
  }
}

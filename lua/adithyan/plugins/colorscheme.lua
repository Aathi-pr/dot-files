return {
  -- Other plugin configurations...

  --[[ Nightfox theme
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true, -- Enable transparent background
          styles = {
            comments = "italic", -- Italic comments
            keywords = "bold", -- Bold keywords
            types = "italic,bold", -- Italic and bold types
          },
        },
      })
      vim.cmd("colorscheme duskfox")
    end,
  },
--]]
  -- Catppuccin theme
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          notify = false,
          mini = false,
        },
      })
      vim.cmd("colorscheme catppuccin")
    end,
  },

  --[[ Solarized Osaka theme
  {
    "craftzdog/solarized-osaka.nvim", -- Add the solarized-osaka plugin
    lazy = false, -- Load the plugin eagerly
    priority = 1000, -- Set a high priority for loading the theme
    opts = {}, -- Additional options can be passed here
    config = function()
      require("solarized-osaka").setup({
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          sidebars = "dark",
          floats = "dark",
        },
        sidebars = { "qf", "help" },
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,
        on_colors = function(colors) end,
        on_highlights = function(highlights, colors) end,
      })
      vim.cmd("colorscheme solarized-osaka") -- Set the theme
    end,
  },
--]]
  -- Other plugin configurations...
}

return {
  -- Tokyo Night with transparency
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      local transparent = true -- Enable transparency

      local bg = "#011628"
      local bg_dark = "#011423"
      local bg_highlight = "#143652"
      local bg_search = "#0A64AC"
      local bg_visual = "#275378"
      local fg = "#CBE0F0"
      local fg_dark = "#B4D0E9"
      local fg_gutter = "#627E97"
      local border = "#547998"

      require("tokyonight").setup({
        style = "night",
        transparent = transparent,
        terminal_colors = true,
        styles = {
          sidebars = transparent and "transparent" or "dark",
          floats = transparent and "transparent" or "dark",
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
        },
        on_colors = function(colors)
          colors.bg = transparent and colors.none or bg
          colors.bg_dark = transparent and colors.none or bg_dark
          colors.bg_float = transparent and colors.none or bg_dark
          colors.bg_highlight = bg_highlight
          colors.bg_popup = transparent and colors.none or bg_dark
          colors.bg_search = bg_search
          colors.bg_sidebar = transparent and colors.none or bg_dark
          colors.bg_statusline = transparent and colors.none or bg_dark
          colors.bg_visual = bg_visual
          colors.border = border
          colors.fg = fg
          colors.fg_dark = fg_dark
          colors.fg_float = fg
          colors.fg_gutter = fg_gutter
          colors.fg_sidebar = fg_dark
        end,
      })
    end,
  },

  -- Catppuccin with transparency
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true, -- Enable transparency
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          telescope = { enabled = true, style = "nvchad" },
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
            inlay_hints = { background = true },
          },
          mason = true,
          which_key = true,
          notify = true,
          mini = true,
          flash = true,
          noice = true,
        },
      })
    end,
  },

  -- Solarized Osaka with transparency
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("solarized-osaka").setup({
        transparent = true, -- Enable transparency
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "transparent",
          floats = "transparent",
        },
        sidebars = { "qf", "help", "vista_kind", "terminal", "packer" },
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,
      })

      -- Set as default colorscheme
      vim.cmd("colorscheme solarized-osaka")
    end,
  },

  -- Enhanced transparency plugin
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 999,
    config = function()
      require("transparent").setup({
        groups = {
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLine",
          "CursorLineNr",
          "StatusLine",
          "StatusLineNC",
          "EndOfBuffer",
        },
        extra_groups = {
          "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
          "NvimTreeNormal", -- NvimTree
          "NvimTreeNormalNC",
          "TelescopeNormal",
          "TelescopeBorder",
          "TelescopePromptNormal",
          "TelescopeResultsNormal",
          "TelescopePreviewNormal",
          "WhichKeyFloat",
        },
        exclude_groups = {}, -- table: groups you don't want to clear
      })

      -- Enhanced transparency function for liquid glass effect
      local function apply_liquid_glass_transparency()
        local highlights = {
          -- Main editor transparency
          Normal = { bg = "none" },
          NormalNC = { bg = "none" },
          NormalFloat = { bg = "none", fg = "none" },
          FloatBorder = { bg = "none", fg = "#4a5568" },

          -- Sidebar transparency
          NvimTreeNormal = { bg = "none" },
          NvimTreeNormalNC = { bg = "none" },
          NvimTreeWinSeparator = { bg = "none", fg = "none" },

          -- Popup menus with subtle background
          Pmenu = { bg = "none", fg = "none" },
          PmenuSel = { bg = "#2d3748", fg = "none" },
          PmenuSbar = { bg = "none" },
          PmenuThumb = { bg = "#4a5568" },

          -- Telescope transparency
          TelescopeNormal = { bg = "none" },
          TelescopeBorder = { bg = "none", fg = "#4a5568" },
          TelescopePromptNormal = { bg = "none" },
          TelescopeResultsNormal = { bg = "none" },
          TelescopePreviewNormal = { bg = "none" },

          -- Status line transparency
          StatusLine = { bg = "none", fg = "none" },
          StatusLineNC = { bg = "none", fg = "none" },

          -- Which-key transparency
          WhichKeyFloat = { bg = "none" },

          -- Sign column
          SignColumn = { bg = "none" },

          -- Line numbers
          LineNr = { bg = "none" },
          CursorLineNr = { bg = "none" },

          -- Cursor line with subtle highlight
          CursorLine = { bg = "#1a202c" },

          -- Git signs
          GitSignsAdd = { bg = "none" },
          GitSignsChange = { bg = "none" },
          GitSignsDelete = { bg = "none" },
        }

        for group, opts in pairs(highlights) do
          vim.api.nvim_set_hl(0, group, opts)
        end
      end

      -- Apply liquid glass transparency
      apply_liquid_glass_transparency()

      -- Reapply on colorscheme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.defer_fn(apply_liquid_glass_transparency, 100)
        end,
      })

      -- Global function for manual refresh
      _G.apply_liquid_glass = apply_liquid_glass_transparency

      -- Keybinding to toggle transparency
      vim.keymap.set("n", "<leader>tt", "<cmd>TransparentToggle<cr>", { desc = "Toggle transparency" })
    end,
  },
}

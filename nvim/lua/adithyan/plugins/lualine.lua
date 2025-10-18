return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    -- Function to get colors from active colorscheme
    local function get_theme_colors()
      -- Try to get colors from the active colorscheme
      local colors_ok, colors_module = pcall(require, vim.g.colors_name)

      -- Default colors (your current theme) as fallback
      local default_colors = {
        blue = "#65D1FF",
        green = "#3EFFDC",
        violet = "#FF61EF",
        yellow = "#FFDA7B",
        red = "#FF4A4A",
        fg = "#c3ccdc",
        bg = "#112638",
        inactive_bg = "#2c3043",
      }

      -- Colorscheme-specific color mapping
      if vim.g.colors_name == "tokyonight" then
        return {
          blue = "#7aa2f7",
          green = "#9ece6a",
          violet = "#bb9af7",
          yellow = "#e0af68",
          red = "#f7768e",
          fg = "#c0caf5",
          bg = "#24283b",
          inactive_bg = "#1a1b26",
        }
      elseif vim.g.colors_name == "catppuccin-mocha" then
        return {
          blue = "#89b4fa",
          green = "#a6e3a1",
          violet = "#cba6f7",
          yellow = "#f9e2af",
          red = "#f38ba8",
          fg = "#cdd6f4",
          bg = "#1e1e2e",
          inactive_bg = "#11111b",
        }
      elseif vim.g.colors_name == "solarized-osaka" then
        return {
          blue = "#268bd2",
          green = "#859900",
          violet = "#d33682",
          yellow = "#b58900",
          red = "#dc322f",
          fg = "#93a1a1",
          bg = "#002b36",
          inactive_bg = "#073642",
        }
      else
        -- Use your custom colors as default
        return default_colors
      end
    end

    -- Function to create dynamic theme
    local function create_dynamic_theme()
      local colors = get_theme_colors()

      return {
        normal = {
          a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        insert = {
          a = { bg = colors.green, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        visual = {
          a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        command = {
          a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        replace = {
          a = { bg = colors.red, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        inactive = {
          a = { bg = colors.inactive_bg, fg = colors.fg, gui = "bold" },
          b = { bg = colors.inactive_bg, fg = colors.fg },
          c = { bg = colors.inactive_bg, fg = colors.fg },
        },
      }
    end

    -- Configure lualine with dynamic theme
    lualine.setup({
      options = {
        theme = create_dynamic_theme(),
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true, -- Single statusline for all windows
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })

    -- Auto-reload lualine when colorscheme changes
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        -- Small delay to ensure colorscheme is fully loaded
        vim.defer_fn(function()
          lualine.setup({
            options = {
              theme = create_dynamic_theme(),
              component_separators = { left = "", right = "" },
              section_separators = { left = "", right = "" },
              globalstatus = true,
              refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
              },
            },
            sections = {
              lualine_a = { "mode" },
              lualine_b = { "branch", "diff", "diagnostics" },
              lualine_c = { "filename" },
              lualine_x = {
                {
                  lazy_status.updates,
                  cond = lazy_status.has_updates,
                  color = { fg = "#ff9e64" },
                },
                { "encoding" },
                { "fileformat" },
                { "filetype" },
              },
              lualine_y = { "progress" },
              lualine_z = { "location" },
            },
          })
        end, 100)
      end,
    })

    -- Global function for theme switching (call this when switching themes)
    _G.reload_lualine = function()
      lualine.setup({
        options = {
          theme = create_dynamic_theme(),
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = "#ff9e64" },
            },
            { "encoding" },
            { "fileformat" },
            { "filetype" },
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end
  end,
}

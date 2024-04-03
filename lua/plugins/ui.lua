return {
  { -- STATUS BAR
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local custom_oceanic_next = require('lualine.themes.OceanicNext')

      local cmd = "git status --porcelain"
      local handle = assert(io.popen(cmd, 'r'), '')
      -- output contains empty line at end (removed by iterlines)
      local output = assert(handle:read('*a'))
      -- close io
      handle:close()

      local gs = output:gsub("^.(.).*", "%1")

      -- Change the background of lualine_b section for normal mode
      -- custom_oceanic_next.normal.b.bg = '#112233'
      -- local gs = vim.b.git_state
      if gs == 'M' then
        custom_oceanic_next.normal.b.fg = '#C7C400'
      else
        custom_oceanic_next.normal.b.fg = '#FFFFFF'
      end

      local function hello()
        return gs
      end

      require('lualine').setup({
        options = {
          theme = custom_oceanic_next
        },
        sections = {
          lualine_b = {
            'branch', 
          },
          lualine_c = {
            {
              'filename',
              file_status = true, -- displays file status (readonly status, modified status)
              show_modified_status = true,
              path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
            }
          } 
        },
      })
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    --"rcarriga/nvim-notify",
    }
  },
}

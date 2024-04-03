return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },
  {
    'f-person/git-blame.nvim',
    config = function()
      vim.g.gitblame_message_template = '<author> • <date> • {<sha>} • <summary>'
      vim.g.gitblame_date_format = '%r'
      vim.g.gitblame_use_blame_commit_file_urls = true
      vim.g.gitblame_virtual_text_column = 30
      vim.g.gitblame_delay = 100
      vim.g.gitblame_highlight_group = "IndentBlanklineChar"
    end
  },
  -- {
  --   "aspeddro/gitui.nvim",
  --   config = function()
  --     require("gitui").setup(
  --       {
  --         -- Command Options
  --         command = {
  --           -- Enable :Gitui command
  --           -- @type: bool
  --           enable = true,
  --         },
  --         -- Path to binary
  --         -- @type: string
  --         binary = "gitui",
  --         -- Argumens to gitui
  --         -- @type: table of string
  --         args = {},
  --         -- WIndow Options
  --         window = {
  --           options = {
  --             -- Width window in %
  --             -- @type: number
  --             width = 90,
  --             -- Height window in %
  --             -- @type: number
  --             height = 80,
  --             -- Border Style
  --             -- Enum: "none", "single", "rounded", "solid" or "shadow"
  --             -- @type: string
  --             border = "rounded",
  --           },
  --         },
  --       }
  --     )
  --   end
  -- },
}
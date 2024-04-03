return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup{
        on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, {expr=true})

      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, {expr=true})

      -- Actions
      map('n', '<leader>hs', gs.stage_hunk)
      map('n', '<leader>hr', gs.reset_hunk)
      map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
      map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
      map('n', '<leader>hS', gs.stage_buffer)
      map('n', '<leader>hu', gs.undo_stage_hunk)
      map('n', '<leader>hR', gs.reset_buffer)
      map('n', '<leader>hp', gs.preview_hunk)
      map('n', '<leader>hb', function() gs.blame_line{full=true} end)
      map('n', '<leader>tb', gs.toggle_current_line_blame)
      map('n', '<leader>hd', gs.diffthis)
      map('n', '<leader>hD', function() gs.diffthis('~') end)
      map('n', '<leader>td', gs.toggle_deleted)

      -- Text object
      map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
  }
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
  {
    "aspeddro/gitui.nvim",
    config = function()
      require("gitui").setup(
        {
          -- Command Options
          command = {
            -- Enable :Gitui command
            -- @type: bool
            enable = true,
          },
          -- Path to binary
          -- @type: string
          binary = "gitui",
          -- Argumens to gitui
          -- @type: table of string
          args = {},
          -- WIndow Options
          window = {
            options = {
              -- Width window in %
              -- @type: number
              width = 90,
              -- Height window in %
              -- @type: number
              height = 80,
              -- Border Style
              -- Enum: "none", "single", "rounded", "solid" or "shadow"
              -- @type: string
              border = "rounded",
            },
          },
        }
      )
    end
  },
}

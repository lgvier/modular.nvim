-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true, -- Set to true to close Neo-tree if it's the last window
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true, -- You can adjust this as needed
        },
      },
      event_handlers = {
        -- {
        --   event = 'file_open_requested',
        --   handler = function()
        --     -- auto close
        --     require('neo-tree.command').execute { action = 'close' }
        --   end,
        -- },
      },
      -- Other Neo-tree configuration options...
    }
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = vim.schedule_wrap(function()
        vim.cmd 'Neotree show'
      end),
    })
  end,
}

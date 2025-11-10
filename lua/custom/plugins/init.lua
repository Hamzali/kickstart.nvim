-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesitter-context').setup {
        enable = true, -- Enable this plugin (can be toggled later)
        max_lines = 3, -- How many lines the context window should show
        min_window_height = 0, -- Minimum editor height to enable context
        line_numbers = true, -- Show line numbers in context
        multiline_threshold = 20, -- Max number of lines for a single context
        trim_scope = 'outer', -- Which context lines to remove first
        mode = 'cursor', -- 'cursor' or 'topline'
        separator = '─', -- Use a visual separator (set to nil for none)
        zindex = 20, -- Display priority
        on_attach = nil, -- Custom logic for attaching per buffer
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-treesitter.configs').setup {
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobject
            lookahead = true,

            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ['ap'] = '@parameter.outer',
              ['ip'] = '@parameter.inner',
            },

            selection_modes = {
              ['@function.outer'] = 'V', -- linewise
              ['@class.outer'] = 'V',
              ['@parameter.outer'] = 'v', -- charwise
            },

            include_surrounding_whitespace = true,
          },
        },
      }
    end,
  },
}

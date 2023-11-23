return {
  -- Plugins will be added here accordingly
  {
    'blueshirts/darcula',
    config = function()
      vim.cmd([[colorscheme darcula]])
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup()
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup()
    end
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader><leader>f', builtin.find_files)
      vim.keymap.set('n', '<leader>ub', builtin.buffers)
      vim.keymap.set('n', '<leader>uh', builtin.help_tags)
      vim.keymap.set('n', '<leader>ug', builtin.live_grep)
      }
    end
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = function()
      require("nvim-treesitter.configs").setup({
        autotag = { enable = true },
        highlight = {
          enable = true,
          -- disable = function(_, buf)
          --   local max_filesize = 100 * 1024 -- 100 KB
          --   local _ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          --   if _ok and stats and stats.size > max_filesize then
          --     return true
          --   end
          -- end,
        },
        indent = { enable = true },
        ensure_installed = {
          "astro",
          "bash",
          "c",
          "comment",
          "cpp",
          "css",
          "dart",
          "dockerfile",
          "go",
          "gomod",
          "graphql",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "jsonc",
          "lua",
          "make",
          "markdown",
          "php",
          "prisma",
          "python",
          "regex",
          "rust",
          "scss",
          "sparql",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "yaml",
        },
      })
    end,
  }
}

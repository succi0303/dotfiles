return {
  -- Plugins will be added here accordingly
  {
    'sainnhe/gruvbox-material',
    config = function()
      vim.cmd([[colorscheme gruvbox-material]])
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
    'vim-jp/vimdoc-ja'
  },
  {
    'neovim/nvim-lspconfig'
  },
  {
    'williamboman/mason.nvim'
  },
  {
    'williamboman/mason-lspconfig'
  },
  {
    'jose-elias-alvarez/null-ls.nvim'
  },
  {
    'jayp0521/mason-null-ls.nvim'
  },
  {
    'stevearc/dressing.nvim'
  },
  {
    'tami5/lspsaga.nvim'
  },
  {
    'ray-x/lsp_signature.nvim'
  },
  {
    'onsails/lspkind-nvim'
  },
  {
    'j-hui/fidget.nvim'
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-emoji' },
    config = function()
      enabled = true
    end
  },
  {
    'hrsh7th/cmp-nvim-lsp'
  },
  {
    'hrsh7th/cmp-buffer'
  },
  {
    'hrsh7th/cmp-path'
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        config = function()
          require('telescope').load_extension('fzf')
        end
      }
    },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader><leader>f', builtin.find_files)
      vim.keymap.set('n', '<leader><leader>b', builtin.buffers)
      vim.keymap.set('n', '<leader><leader>h', builtin.help_tags)
      vim.keymap.set('n', '<leader><leader>g', builtin.live_grep)
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

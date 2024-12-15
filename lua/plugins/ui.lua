return {
  {
    "xiyaowong/transparent.nvim",
  },
  { "sho-87/kanagawa-paper.nvim" },
  { "sainnhe/gruvbox-material" },
  { "zenbones-theme/zenbones.nvim", dependencies = "rktjmp/lush.nvim", lazy = false, priority = 1000 },
  { "nyoom-engineering/oxocarbon.nvim" },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 10000,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {},
  },
  { "ajmwagar/vim-deus", event = "VeryLazy" },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "]b", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "[b", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  --- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    init = false,
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
 ▄▄▄▄   ▓█████ ▄▄▄    ██▒   █▓▓█████  ██▀███   █     █░ ▒█████   ██▀███   ██ ▄█▀  ██████ 
▓█████▄ ▓█   ▀▒████▄ ▓██░   █▒▓█   ▀ ▓██ ▒ ██▒▓█░ █ ░█░▒██▒  ██▒▓██ ▒ ██▒ ██▄█▒ ▒██    ▒ 
▒██▒ ▄██▒███  ▒██  ▀█▄▓██  █▒░▒███   ▓██ ░▄█ ▒▒█░ █ ░█ ▒██░  ██▒▓██ ░▄█ ▒▓███▄░ ░ ▓██▄   
▒██░█▀  ▒▓█  ▄░██▄▄▄▄██▒██ █░░▒▓█  ▄ ▒██▀▀█▄  ░█░ █ ░█ ▒██   ██░▒██▀▀█▄  ▓██ █▄   ▒   ██▒
░▓█  ▀█▓░▒████▒▓█   ▓██▒▒▀█░  ░▒████▒░██▓ ▒██▒░░██▒██▓ ░ ████▓▒░░██▓ ▒██▒▒██▒ █▄▒██████▒▒
░▒▓███▀▒░░ ▒░ ░▒▒   ▓▒█░░ ▐░  ░░ ▒░ ░░ ▒▓ ░▒▓░░ ▓░▒ ▒  ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░▒ ▒▒ ▓▒▒ ▒▓▒ ▒ ░
▒░▒   ░  ░ ░  ░ ▒   ▒▒ ░░ ░░   ░ ░  ░  ░▒ ░ ▒░  ▒ ░ ░    ░ ▒ ▒░   ░▒ ░ ▒░░ ░▒ ▒░░ ░▒  ░ ░
 ░    ░    ░    ░   ▒     ░░     ░     ░░   ░   ░   ░  ░ ░ ░ ▒    ░░   ░ ░ ░░ ░ ░  ░  ░  
 ░         ░  ░     ░  ░   ░     ░  ░   ░         ░        ░ ░     ░     ░  ░         ░  
      ░                   ░                                                                               
    ]]

      dashboard.section.header.val = vim.split(logo, "\n")
    -- stylua: ignore
            for _, button in ipairs(dashboard.section.buttons.val) do
                button.opts.hl = "AlphaButtons"
                button.opts.hl_shortcut = "AlphaShortcut"
            end
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          once = true,
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded "
            .. stats.loaded
            .. "/"
            .. stats.count
            .. " plugins in "
            .. ms
            .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}

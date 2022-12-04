local fn = vim.fn

local api = vim.api
vim.g.package_home = fn.stdpath("data") .. "/site/pack/packer/"
local packer_install_dir = vim.g.package_home .. "/opt/packer.nvim"

local plug_url_format = ""
if vim.g.is_linux then
  plug_url_format = "https://hub.fastgit.org/%s"
else
  plug_url_format = "https://github.com/%s"
end

local packer_repo = string.format(plug_url_format, "wbthomason/packer.nvim")
local install_cmd = string.format("10split |term git clone --depth=1 %s %s", packer_repo, packer_install_dir)

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_install_dir) == "" then
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  vim.cmd(install_cmd)
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")

local packer = require'packer'
local util = require'packer.util'

--- startup and add configure plugins
packer.startup({
  function(use)
    -- it is recommened to put impatient.nvim before any other plugins
    use { 'lewis6991/impatient.nvim', config = [[require('impatient')]] }

    use { 'wbthomason/packer.nvim', opt = true }

    -- file search
    
    use { "Yggdroot/LeaderF", cmd = "Leaderf", run = ":LeaderfInstallCExtension" }

    use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      requires = { { "nvim-lua/plenary.nvim" } },
    }

    -- color theme

    use({"shaunsingh/nord.nvim", opt = true})

    -- status line
    
    use {
      "nvim-lualine/lualine.nvim",
      event = "VimEnter",
      cond = firenvim_not_active,
      config = [[require('config.statusline')]],
    }

    use { "akinsho/bufferline.nvim", event = "VimEnter",
      cond = firenvim_not_active,
      config = [[require('config.bufferline')]]
    }

    -- Automatic insertion and deletion of a pair of characters
    use { "Raimondi/delimitMate", event = "InsertEnter" }

    -- Plugin to manipulate character pairs quickly
    use { "machakann/vim-sandwich", event = "VimEnter" }

    -- Modern matchit implementation
    use { "andymass/vim-matchup", event = "VimEnter" }

    -- notification plugin
    use({
      "rcarriga/nvim-notify",
      event = "BufEnter",
      config = function()
        vim.defer_fn(function() require('config.nvim-notify') end, 2000)
      end
    })

    -- file explorer
    use {
      "kyazdani42/nvim-tree.lua",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = [[require('config.nvim-tree')]],
    }
  end,
  config = {
    max_jobs = 16,
    compile_path = util.join_paths(vim.fn.stdpath('config'), 'lua', 'packer_compiled.lua'),
    git = {
      default_url_format = plug_url_format,
    },
  },
})

-- For fresh install, we need to install plugins. Otherwise, we just need to require `packer_compiled.lua`.
if fresh_install then
  -- We run packer.sync() here, because only after packer.startup, can we know which plugins to install.
  -- So plugin installation should be done after the startup process.
  packer.sync()
else
  local status, _ = pcall(require, "packer_compiled")
  if not status then
    local msg = "File packer_compiled.lua not found: run PackerSync to fix!"
    vim.notify(msg, vim.log.levels.ERROR, { title = "nvim-config" })
  end
end

-- Auto-generate packer_compiled.lua file
api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "*/nvim/lua/plugins.lua",
  group = api.nvim_create_augroup("packer_auto_compile", { clear = true }),
  callback = function(ctx)
    local cmd = "source " .. ctx.file
    vim.cmd(cmd)
    vim.cmd("PackerCompile")
    vim.notify("PackerCompile done!", vim.log.levels.INFO, { title = "Nvim-config" })
  end,
})

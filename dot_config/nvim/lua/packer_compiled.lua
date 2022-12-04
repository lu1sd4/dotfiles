-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/lu1sd4/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/lu1sd4/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/lu1sd4/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/lu1sd4/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/lu1sd4/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LeaderF = {
    commands = { "Leaderf" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lu1sd4/.local/share/nvim/site/pack/packer/opt/LeaderF",
    url = "https://hub.fastgit.org/Yggdroot/LeaderF"
  },
  ["bufferline.nvim"] = {
    config = { "require('config.bufferline')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lu1sd4/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://hub.fastgit.org/akinsho/bufferline.nvim"
  },
  delimitMate = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lu1sd4/.local/share/nvim/site/pack/packer/opt/delimitMate",
    url = "https://hub.fastgit.org/Raimondi/delimitMate"
  },
  ["impatient.nvim"] = {
    config = { "require('impatient')" },
    loaded = true,
    path = "/home/lu1sd4/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://hub.fastgit.org/lewis6991/impatient.nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('config.statusline')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lu1sd4/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://hub.fastgit.org/nvim-lualine/lualine.nvim"
  },
  ["nord.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/lu1sd4/.local/share/nvim/site/pack/packer/opt/nord.nvim",
    url = "https://hub.fastgit.org/shaunsingh/nord.nvim"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23config.nvim-notify\frequire-\1\0\4\0\3\0\0066\0\0\0009\0\1\0003\2\2\0)\3�\aB\0\3\1K\0\1\0\0\rdefer_fn\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lu1sd4/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://hub.fastgit.org/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "require('config.nvim-tree')" },
    loaded = true,
    path = "/home/lu1sd4/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://hub.fastgit.org/kyazdani42/nvim-tree.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/lu1sd4/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://hub.fastgit.org/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/lu1sd4/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://hub.fastgit.org/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/lu1sd4/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://hub.fastgit.org/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/lu1sd4/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://hub.fastgit.org/nvim-telescope/telescope.nvim"
  },
  ["vim-matchup"] = {
    after_files = { "/home/lu1sd4/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/lu1sd4/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "https://hub.fastgit.org/andymass/vim-matchup"
  },
  ["vim-sandwich"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/lu1sd4/.local/share/nvim/site/pack/packer/opt/vim-sandwich",
    url = "https://hub.fastgit.org/machakann/vim-sandwich"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require('config.nvim-tree')
time([[Config for nvim-tree.lua]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
require('impatient')
time([[Config for impatient.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Leaderf lua require("packer.load")({'LeaderF'}, { cmd = "Leaderf", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'nvim-notify'}, { event = "BufEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'bufferline.nvim', 'vim-sandwich', 'lualine.nvim', 'vim-matchup'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'delimitMate'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

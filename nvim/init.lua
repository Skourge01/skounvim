                                                                                                                                                                                                                                                                                                                                                                                                                                                                     .config/nvim/init.lua
-- Carregar e configurar o Packer (gerenciador de plugins)
vim.cmd([[packadd packer.nvim]])

require('packer').startup(function(use)
  -- Plugins recomendados
  use 'junegunn/fzf.vim'               -- Pesquisa rápida com fzf
  use 'tpope/vim-fugitive'             -- Controle de versão (git)
  use {'neoclide/coc.nvim', branch = 'release'} -- Completação de código (LSP)
  use 'preservim/nerdtree'             -- Gerenciador de arquivos
  use 'junegunn/goyo.vim'              -- Modo distraction-free
  use 'projekt0n/github-nvim-theme'    -- Tema github
  use 'vim-airline/vim-airline'        -- Barra de status Airline
  use 'vim-airline/vim-airline-themes'  -- Temas para o Airline
  use 'ThePrimeagen/vim-be-good'
  use 'tpope/vim-dispatch'
  use 'voldikss/vim-floaterm'
  use 'lewis6991/gitsigns.nvim'        -- Integração do Git
end)

-- Configurações adicionais
vim.o.background = 'dark' -- Definir o fundo escuro
vim.wo.relativenumber = true -- Números relativos
vim.wo.number = true -- Números absolutos
vim.o.lazyredraw = true -- Melhora a performance

-- Mapeamentos
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', { noremap = true, silent = true })  -- Abre o fzf
vim.api.nvim_set_keymap('n', '<Leader>e', ':NERDTreeToggle<CR>', { noremap = true, silent = true }) -- Alternar NERDTree
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })  -- Salvar arquivo
vim.g.airline_theme = 'luna'  -- Tema do airline

-- Carregar o esquema de cores
vim.cmd('syntax enable')
vim.o.background = 'dark'
vim.cmd('colorscheme github_dark_default')

-- Mapeamentos para o NERDTree
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true }) -- Alternar NERDTree
vim.cmd([[autocmd bufwinleave * if !tabpagenr('$') | quit | endif]])  -- Fechar NERDTree quando o último arquivo for fechado

-- Mapear copiar e colar
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })  -- Copiar
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true, silent = true })  -- Colar

-- Garantir que o Packer está instalado
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Instalando packer... reinicie o Neovim.")
  vim.cmd([[packadd packer.nvim]])
  return
end

-- Inicializar o Packer
vim.cmd([[packadd packer.nvim]])
-- lazygit keybind
vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", { noremap = true, silent = true })





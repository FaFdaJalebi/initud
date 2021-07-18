vim.cmd 'packadd paq-nvim'		-- Load package
local paq = require'paq-nvim'.paq	-- Import module and bind `paq` function
paq{'savq/paq-nvim', opt=true}		-- Let Paq manage itself
-- Add your packages
paq{'lervag/vimtex', opt=true}		-- Use braces when passing options
paq{'bluz71/vim-moonfly-colors'}
paq{'roxma/nvim-yarp'}
paq{'roxma/vim-hug-neovim-rpc'}
paq{'Shougo/deoplete.nvim'}
paq{'Shougo/deoplete-clangx'}
paq{'deoplete-plugins/deoplete-jedi'}
paq{'Shougo/neoinclude.vim'}
paq{'dense-analysis/ale'}
paq{'preservim/nerdtree'}
paq{'kevinhwang91/nvim-bqf'}
paq{'glepnir/spaceline.vim'}
paq{'ryanoasis/vim-devicons'}
paq{'kyazdani42/nvim-web-devicons'}
paq{'nvim-lua/popup.nvim'}
paq{'nvim-lua/plenary.nvim'}
paq{'nvim-telescope/telescope.nvim'}
paq{'sakhnik/nvim-gdb', run='./install.sh' }
paq{'cohama/lexima.vim'}
paq{'hrsh7th/vim-vsnip'}
--paq{'rafamadriz/friendly-snippets'}
paq{'CorruptedVor/friendly-snippets'}
paq{'mhinz/vim-startify'}
paq{'pacha/vem-tabline'}
paq{'edluffy/specs.nvim'}
paq{'simeji/winresizer'}
paq{'yamatsum/nvim-cursorline'}
paq{'nacro90/numb.nvim'}
paq{'CorruptedVor/initud'}

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opts = {}
local nr = {noremap = true}
local sil = {silent = true}

map("","f", "<leader>", nr)
map("","<esc>", ":noh<cr>", opts)						-- remove highlight on esc
map("","<F1>", ":w<cr>", opts)
map("","<F2>", ":q<cr>", opts)
map("","<F3>", ":vimgrep<Space>/w+/j<Space>%<Space><bar>copen<cr>", opts)	-- open quickfix
map("","<F4>", ":ccl<cr>", opts)						-- close quickfix 
map("n","<F5>", ":term<cr>", opts)
map("n","<F12>", ":qa<cr>", opts)

-- telescope maps 
map("","<leader>ff", "<cmd>Telescope find_files<cr>", nr)
map("","<leader>fg", "<cmd>Telescope live_grep<cr>", nr)
map("","<leader>fb", "<cmd>Telescope buffers<cr>", nr)
map("","<leader>fh", "<cmd>Telescope help_tags<cr>", nr)

-- nerdtree maps
map("","<leader>n", ":NERDTreeFocus<CR>", nr)
map("","<C-space>", ":NERDTreeToggle<CR>", nr)
map("","<C-f>", ":NERDTreeFind<CR>", nr)

-- select tabs
map("","<leader>t", ":tabnew<CR>", nr)
map("","<leader>1", ":1tabnext<CR>", nr)
map("","<leader>2", ":2tabnext<CR>", nr)
map("","<leader>3", ":3tabnext<CR>", nr)
map("","<leader>4", ":4tabnext<CR>", nr)
map("","<leader>5", ":5tabnext<CR>", nr)
map("","<leader>6", ":6tabnext<CR>", nr)
map("","<leader>7", ":7tabnext<CR>", nr)
map("","<leader>8", ":8tabnext<CR>", nr)
map("","<leader>9", ":9tabnext<CR>", nr)

-- Use ctrl-[jkil] to select the active split!
map("", "<c-s>", ":vsp<CR>", sil)
map("", "<c-j>", ":wincmd h<CR>", sil)
map("", "<c-k>", ":wincmd j<CR>", sil)
map("", "<c-i>", ":wincmd k<CR>", sil)
map("", "<c-l>", ":wincmd l<CR>", sil)

-- commands
--vim.api.nvim_command('set noshowmode')
vim.cmd('set nocompatible')
vim.cmd("highlight Pmenu guibg=white guifg=black gui=bold")
vim.cmd("set number")
vim.cmd("filetype plugin indent on")
vim.cmd("highlight Comment gui=bold")
vim.cmd("highlight Normal gui=none")
vim.cmd("highlight NonText guibg=none")
vim.cmd("let g:winresizer_start_key = '<C-T>'")
-- vim-vsnip
-- NOTE: You can use other key to expand snippet.
-- Expand
vim.cmd("imap <silent> <expr> q	vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : 'q'")
vim.cmd("smap <silent> <expr> q	vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : 'q'")
-- Expand or jump
vim.cmd("imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'")
vim.cmd("smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'")
-- Jump forward or backward
vim.cmd("imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'")
vim.cmd("smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'")
vim.cmd("imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'")
vim.cmd("smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'")
-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- See https://github.com/hrsh7th/vim-vsnip/pull/50
vim.cmd("nmap        s   <Plug>(vsnip-select-text)")
vim.cmd("xmap        s   <Plug>(vsnip-select-text)")
vim.cmd("nmap        S   <Plug>(vsnip-cut-text)")
vim.cmd("xmap        S   <Plug>(vsnip-cut-text)")

-- vem-tabline
vim.cmd("nmap <leader>l <Plug>vem_move_buffer_left-")
vim.cmd("nmap <leader>r <Plug>vem_move_buffer_right-")
vim.cmd("nmap <leader>p <Plug>vem_prev_buffer-")
vim.cmd("nmap <leader>n <Plug>vem_next_buffer-")
vim.cmd("nmap <leader>w <Plug>vem_delete_buffer-")

-- spaceline
vim.cmd("let g:spaceline_seperate_style = 'slant-cons'")
-- deoplete (clang)
vim.cmd("let g:deoplete#enable_at_startup = 1")
vim.cmd("call deoplete#custom#option('sources', { '_': [],})")
vim.cmd("inoremap <silent><expr> <Tab> pumvisible() ? '<C-n>' : '<TAB>'")
vim.cmd("inoremap <silent><expr> <S-Tab> pumvisible() ? '<C-p>' : '<S-TAB>'")
-- Acceptable because it seems to have no impact on "startup time"
vim.cmd("PaqInstall")
vim.cmd("PaqUpdate")
vim.cmd("PaqClean")

-- options
vim.o.background = "dark"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.swapfile = true
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.visualbell = true
vim.o.cindent = true
vim.o.number = true
vim.o.syntax = "on"
vim.o.termguicolors = true

-- global variables 
vim.g.NERDTreeShowHidden		= 1 		-- show hidden files
vim.g.dir				= "/tmp/nvim" 	-- don't waste writes to storage device
vim.g.encoding				= "UTF-8"	
vim.g.colors_name			= "moonfly"
vim.g.moonflyCursorColor		= 1
vim.g.moonflyUnderlineMatchParen	= 1

require('specs').setup{ 
    show_jumps  = true,
    min_jump = 10,
    popup = {
        delay_ms = 300, -- delay before popup displays
        inc_ms = 5, -- time increments used for fade/resize effects 
        blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 30,
        winhl = "PMenu",
        fader = require('specs').linear_fader,
        resizer = require('specs').shrink_resizer
    },
    ignore_filetypes = {},
    ignore_buftypes = {
        nofile = true,
    },
}

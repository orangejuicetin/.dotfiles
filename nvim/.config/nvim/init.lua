-- if you want to use your other (formerly init.vim) vimrc.vim file, uncomment
-- local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
-- vim.cmd.source(vimrc)

-- Make line numbers default
vim.opt.number = true
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'
-- Save undo history
vim.opt.undofile = true


-- begin plugin installations: https://github.com/junegunn/vim-plug
vim.cmd [[
 let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

 if empty(glob(data_dir . '/autoload/plug.vim'))

     silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

     autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

 endif
]]
-- begin plugin installations: https://github.com/junegunn/vim-plug
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('junegunn/seoul256.vim')
-- Plug 'junegunn/fzf.vim-- Plugin outside ~/.vim/plugged with post-update hook
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
-- https://github.com/ibhagwan/fzf-lua?tab=readme-ov-file#coming-from-fzfvim
--`:FzfLua setup_fzfvim_cmds` to get the same commands as fzf.vim
Plug('ibhagwan/fzf-lua', { ['branch'] = 'main'})
Plug('vim-airline/vim-airline')
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
vim.call('plug#end')

-- make seoul256 background slightly darker than standard
vim.g.seoul256_background = 234
vim.cmd 'colorscheme seoul256'

-- Mason Setup, https://github.com/williamboman/mason.nvim
-- require("mason").setup()
-- require("mason-lspconfig").setup()
-- after this run :MasonInstall rust-analyzer codelldb to install and manage
-- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/#1-download-rust-analyzer-and-codelldb-with-neovims-plugins

local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  extends = "›",
  precedes = "‹",
  nbsp = "␣",
}


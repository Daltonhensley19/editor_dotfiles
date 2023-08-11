call plug#begin()
     Plug 'https://github.com/p00f/nvim-ts-rainbow.git'
	 Plug 'itchyny/lightline.vim'
   	 Plug 'jiangmiao/auto-pairs'
	 Plug 'tpope/vim-surround'
	 Plug 'https://github.com/tpope/vim-fugitive'
   	 Plug 'https://github.com/rhysd/vim-clang-format'
     "Plug 'https://github.com/nvim-lua/completion-nvim.git'
	 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	 Plug 'junegunn/fzf.vim'
	 Plug 'https://github.com/tree-sitter/tree-sitter-cpp'
	 Plug 'https://github.com/preservim/nerdtree'
	 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    "Plug 'https://github.com/agude/vim-eldar'
	 Plug 'https://github.com/neovim/nvim-lspconfig.git'
	 Plug 'https://github.com/kabouzeid/nvim-lspinstall.git'
	 Plug 'https://github.com/preservim/nerdcommenter.git'
    "Plug 'https://github.com/morhetz/gruvbox'
     Plug 'https://github.com/folke/lsp-colors.nvim'
     Plug 'RRethy/nvim-base16'
     Plug 'https://github.com/simrat39/rust-tools.nvim.git'
     Plug 'https://github.com/rust-lang/rust.vim.git'
     Plug 'hrsh7th/cmp-nvim-lsp'
     Plug 'hrsh7th/cmp-buffer'
     Plug 'hrsh7th/cmp-path'
     Plug 'hrsh7th/nvim-cmp'
     Plug 'https://github.com/ggandor/lightspeed.nvim.git'
     Plug 'https://github.com/lewis6991/impatient.nvim.git'
     Plug 'https://github.com/embark-theme/vim.git'
     Plug 'https://github.com/bluz71/vim-moonfly-colors.git'
     "Plug 'https://github.com/tree-sitter/tree-sitter-rust.git'
     "Plug 'https://github.com/sheerun/vim-polyglot.git'
     "Plug 'https://github.com/trishume/syntect.git'
     "Plug 'https://github.com/arzg/vim-rust-syntax-ext.git'
     "Plug 'https://github.com/sdiehl/vim-ormolu.git'
     Plug 'https://github.com/averms/black-nvim.git'
     Plug 'williamboman/mason.nvim'
     Plug 'https://github.com/hrsh7th/cmp-nvim-lsp-signature-help.git'
     Plug 'https://github.com/neovimhaskell/haskell-vim.git'
     Plug 'https://github.com/mihaimaruseac/hindent.git'
     Plug 'https://github.com/smolck/command-completion.nvim.git'
     Plug 'https://github.com/catppuccin/nvim.git'
    
     Plug 'SirVer/ultisnips'
     Plug 'honza/vim-snippets'
     Plug 'quangnguyen30192/cmp-nvim-ultisnips'
     Plug 'https://github.com/lukas-reineke/indent-blankline.nvim.git'
     Plug 'https://github.com/folke/todo-comments.nvim.git'

     Plug 'https://github.com/alx741/vim-hindent.git'

     Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

call plug#end()





lua << EOF
require("nvim-treesitter.configs").setup {
  highlight = {
      -- ...
      disable = {"rust"},
  },
  -- ...
  rainbow = {
    enable = true,
   -- disable = { "rust" }, --list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
EOF


lua << EOF
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
EOF

lua << EOF
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
EOF

lua require('command-completion').setup()

lua << EOF

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = true, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"



EOF


set nocompatible
set clipboard+=unnamedplus
set completeopt=menu,menuone,noselect
set background=dark
let base16colorspace=256
hi Normal ctermbg=NONE

imap jj <esc> 

set nu
set termguicolors
set cc=80
filetype plugin indent on
set smartindent
set nowrap
nnoremap ; :
set splitright
set splitbelow
set ttyfast
set lazyredraw
set nofoldenable
set mouse=a
set spelllang=en,cjk


nnoremap <C-n> :NERDTreeToggle<CR>





set completeopt=menuone,noinsert,noselect 
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']



au Filetype rust set colorcolumn=110
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

lua << EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require('lspconfig')['jedi_language_server'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['clangd'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['hls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

local pid = vim.fn.getpid()

local omnisharp_bin = "/usr/bin/OmniSharp"

require'lspconfig'.omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
    on_attach = on_attach
}

require'lspconfig'.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}

EOF



lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'
  local cmp_ultisnips_mappings = require'cmp_nvim_ultisnips.mappings'


  cmp.setup({


    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
--        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
         vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
       completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      --['<TAB>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    else
      cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
    end
    end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'ultisnips' },
    { name = 'path' },
      { name = 'nvim_lsp_signature_help' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
      { name = 'path' }
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
      { name = 'path' },
      { name = 'ultisnips' },
      { name = 'nvim_lsp_signature_help' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  
EOF



lua << EOF
 require("toggleterm").setup {
    open_mapping = [[<c-space>]],
    start_in_insert = true,
    direction = 'float',
    auto_scroll = true,
}
EOF


set spelllang=en,cjk
set spellsuggest=best,9
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords









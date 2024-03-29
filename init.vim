 " Plugins will be downloaded under the specified directory.
call plug#begin()
" markdown read
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" Declare the list of plugins.
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
" 自動補全 類似 you complete me
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" 模糊搜尋
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" snippets
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'

" 快速註解
Plug 'preservim/nerdcommenter'

" vim git
Plug 'tpope/vim-fugitive'

" 快速括號某一段code
Plug 'tpope/vim-surround'

" 可以跳行 或者跳字搜尋
Plug 'easymotion/vim-easymotion'

" flutter 套件
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

" buffer theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" javascript hightlight
Plug 'pangloss/vim-javascript'

" vue
Plug 'posva/vim-vue'
" indent line
Plug 'Yggdroot/indentLine'
" List ends here. Plugins become visible to Vim after this call.
"
" typescript
" typescript 用 treesitter 去highlight
" 因為德古拉套件的支援較少，就不用typescript-vim 了
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" sticky header 效果
Plug 'wellle/context.vim'
Plug 'rust-lang/rust.vim'

call plug#end()
filetype plugin on
let mapleader = " "
set fileencodings=utf-8,bg18030,gbk,big5
set hidden
set nu
set tabstop=2 
set softtabstop=2
set shiftwidth=2
set t_Co=256
set expandtab
set incsearch
" 相對行數
set relativenumber
" coc 讀取時間
set updatetime=500

set scrolloff=1

set nowrap
set smartindent

set showmatch
set matchtime=1

let g:lsc_auto_map = v:true
" dart 儲存自動format
let g:dart_format_on_save = 1
let g:javascript_plugin_jsdoc = 1
let g:dracula_colorterm = 0
let g:dracula_italic = 0
let dart_html_in_string=v:true
let g:dart_style_guide = 2
let g:dart_format_on_save = 1
let g:lsc_auto_map = v:true
" 讓vue 套件只highlight HTML js css (不highlight typescript)
let g:vue_pre_processors = []
autocmd BufWritePre *.dart* DartFmt

syntax on
syntax enable


colorscheme dracula

" buffer
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprevious<cr>
nnoremap <leader>bd :bdelete<cr>

" tab resize 
nnoremap <silent> <leader>+ :vertical resize+10<cr> 
nnoremap <silent> <leader>- :vertical resize-10<cr> 

" 分割視窗
nnoremap <leader>wv <C-w>v<C-w>t
nnoremap <leader>ws <C-w>s<C-w>t

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" 顯示tab
let g:airline#extensions#tabline#enabled = 1
let g:NERDSpaceDelims = 2


" visual 模式下可以 移動code
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

 " 自動補齊括號 
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i



" 套件相關快捷設定
" 啟動 easymotion
map <Leader>s <Plug>(easymotion-s2)
" 行數跳轉
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
" 行內跳轉
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><leader>l <Plug>(easymotion-lineforward)



nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <silent> <leader>. v<Plug>(coc-codeaction-selected)
"ctrl p fzzf
nnoremap <leader>p :Files<CR>

" Flutter Hot Reload flutter 套件
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

" 開啟模擬器
nnoremap <silent><F4>  :FlutterEmulatorsLaunch iOS Simulator<cr>

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
  },
}
EOF

let g:context_enabled = 1

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()







" Plugins will be downloaded under the specified directory.
call plug#begin()
" markdown read
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" Declare the list of plugins.
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'preservim/nerdcommenter'
" flutter 套件
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 樹狀結構
Plug 'preservim/nerdtree'
" List ends here. Plugins become visible to Vim after this call.
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
" coc 讀取時間
set updatetime=500
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
autocmd BufWritePre *.dart* DartFmt
syntax on
syntax enable
colorscheme dracula
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
"ctrl p
nnoremap <C-l> :Files<CR>
" Flutter Hot Reload
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>
" buffer
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprevious<cr>
nnoremap <leader>bd :bdelete<cr>
" coc action 快捷
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>. :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>. :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" 樹狀結構 <F5> 開啟
nnoremap <silent> <F5> :NERDTree<CR>
" 分割視窗
nnoremap <leader>wv <C-w>v<C-w>t
nnoremap <leader>ws <C-w>s<C-w>t
" 開啟模擬器
nnoremap <silent><F4>  :FlutterEmulatorsLaunch iOS Simulator<cr>
" 顯示tab
let g:airline#extensions#tabline#enabled = 1
let g:NERDSpaceDelims = 2

set autoindent
" Automatically closing braces
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>

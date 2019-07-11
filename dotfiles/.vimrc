" -----basic settings-----
syntax on
set termencoding=utf-8
set encoding=utf-8
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp

set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set smartindent
set cinwords="if,else,while,do,for,switch"
set hlsearch
set ignorecase
set incsearch

set number
set ruler
set scroll=0
set scrolloff=10
set showmatch
set cursorline


nnoremap <C-Tab>   gt

nmap <F8> :TagbarToggle<CR>
nmap <C-k> :resize +5<CR>
nmap <C-j> :resize -5<CR>
nmap <C-l> :vertical resize +5<CR>
nmap <C-h> :vertical resize -5<CR>


" dein.vim settings
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('vim-scripts/The-NERD-tree')
    call dein#add('vim-scripts/quickhl.vim')
    call dein#add('vim-scripts/quickrun.vim')
    call dein#add('vim-scripts/Emmet.vim')
    call dein#add('vim-scripts/fugitive.vim')
    call dein#add('vim-scripts/neocomplcache')
    call dein#add('vim-scripts/Tagbar')
    call dein#add('t9md/vim-textmanip')
    call dein#add('gregsexton/gitv')
    call dein#add('kchmck/vim-coffee-script')
    call dein#add('kannokanno/previm')
    call dein#add('tyru/open-browser.vim')
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/neomru.vim')
    call dein#add('nathanaelkane/vim-indent-guides')
    call dein#add('bronson/vim-trailing-whitespace')
  endif
  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on


" -----neocomplcache-----
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
 hi Pmenu ctermbg=4 ctermfg=black
 hi PmenuSel ctermbg=1 ctermfg=black
 hi PMenuSbar ctermbg=4


" -----quickhl------
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)


" ----- color settings ------
set t_Co=256
syntax enable
autocmd ColorScheme * highlight Normal ctermbg=none
colorscheme dracula

hi Visual guibg=DarkBlue ctermbg=DarkBlue
hi VisualNOS guibg=DarkBlue ctermbg=DarkBlue
hi Search gui=Bold guifg=Black guibg=Yellow cterm=Bold ctermfg=Black ctermbg=Yellow

" hightlight current line
hi clear CursorLine
hi CursorLine   cterm=NONE ctermbg=234 guibg=0   guifg=None
hi CursorColumn cterm=NONE ctermbg=234 guibg=0   guifg=None


" ----- vim-textmanip: https://github.com/t9md/vim-textmanip -----
xmap <Space>d <Plug>(textmanip-duplicate-down)
nmap <Space>d <Plug>(textmanip-duplicate-down)
xmap <Space>D <Plug>(textmanip-duplicate-up)
nmap <Space>D <Plug>(textmanip-duplicate-up)
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)
nmap <F10> <Plug>(textmanip-toggle-mode)
xmap <F10> <Plug>(textmanip-toggle-mode)

" markdown file prefix
au BufRead,BufNewFile *.md set filetype=markdown

:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>


"-----unite setting-----
" start with insert mode
let g:unite_enable_start_insert=1
" buffer list
noremap <C-P> :Unite buffer<CR>
" file list
noremap <C-N> :Unite -buffer-name=file file<CR>
" recently file list
noremap <C-Z> :Unite file_mru<CR>
" set sources as directory opened now
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" open with split window
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" open with split window vertically
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" quit when ESC key typed twice
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


" vim-indent-guides
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=232
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=239
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

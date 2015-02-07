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

:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
hi Visual guibg=Blue ctermbg=Blue ctermfg=black
hi Search gui=Bold guifg=Black guibg=Yellow cterm=Bold ctermfg=Black ctermbg=Yellow

nnoremap <C-Tab>   gt

nmap <F8> :TagbarToggle<CR>
nmap <C-k> :resize +5<CR>
nmap <C-j> :resize -5<CR>
nmap <C-l> :vertical resize +5<CR>
nmap <C-h> :vertical resize -5<CR>



" -----vundle settings-----
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/vundle.git/
call vundle#rc()
Bundle 'The-NERD-tree'
"Bundle 'FuzzyFinder'
Bundle 'quickhl.vim'
Bundle 'quickrun.vim'
Bundle 'Markdown'
Bundle 'Emmet.vim'
Bundle 'fugitive.vim'
Bundle 'neocomplcache'
Bundle 'Tagbar'
Bundle 't9md/vim-textmanip'
Bundle 'gregsexton/gitv'
filetype plugin indent on     " required!



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
colorscheme molokai

" hightlight current line
:hi CursorLine   cterm=NONE ctermbg=234 guibg=0 guifg=None
:hi CursorColumn cterm=NONE ctermbg=234 guibg=0 guifg=None

" highlight current word
:hi CurrentWord term=NONE ctermbg=219 ctermfg=black
function! s:HighlightCurrentWord()
  function! l:GetCurrentWord()
    function! l:EscapeText( text )
      return substitute( escape(a:text, '\' . '^$.*[~'), "\n", '\\n', 'ge' )
    endfunction

    let l:cword = expand('<cword>')
    if !empty(l:cword)
      let l:regexp = l:EscapeText(l:cword)
      if l:cword =~# '^\k\+$'
        let l:regexp = '\<' . l:regexp . '\>'
      endif
      return l:regexp
    else
      return ''
    endif
  endfunction

  let l:word = l:GetCurrentWord()
  if !empty(l:word)
    if exists("w:current_match")
      call matchdelete(w:current_match)
    endif
    let w:current_match = matchadd('CurrentWord', l:word, 0)
  endif
endfunction
augroup cwh
 autocmd!
  autocmd CursorMoved,CursorMovedI * call s:HighlightCurrentWord()
augroup END




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


set termencoding=utf-8
set encoding=utf-8
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp

"強調表示
syntax on
"タブはスペース2つ
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
"cinwordsと同時に使うと指定した文字列の後にインデントを一段深くする
set smartindent
set cinwords="if,else,while,do,for,switch"
"カーソルを点滅させない
"set guicursor=a:blinkwait500-blinkoff300-blinkon500-ver20"
"検索文字列をハイライト
set hlsearch
"検索で大文字、小文字を区別しない
set ignorecase
"インクリメンタルサーチ
set incsearch
"set list"

"行数表示
set number
"ルーラー表示
set ruler
"CTRL-Dなどでスクロールする行数（0を指定すると画面の半分をスクロール）
set scroll=0
"カーソル行の上下に最低限表示する行数
set scrolloff=10
"対応する括弧を表示
set showmatch
" カーソル行をハイライト
set cursorline
" :hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=white guibg=darkred guifg=None
" :hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=white guibg=darkred guifg=None
:hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=white guibg=darkred guifg=None
:hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=white guibg=darkred guifg=None

:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
" 選択範囲のカラー設定
hi Visual guibg=Blue ctermbg=Blue ctermfg=black
" 検索結果
hi Search gui=Bold guifg=Black guibg=Yellow cterm=Bold ctermfg=Black ctermbg=Yellow


"タブ切り替え
nnoremap <C-Tab>   gt

" vundle設定start
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
" Bundle 'jslint.vim'
Bundle 't9md/vim-textmanip'
Bundle 'gregsexton/gitv'



filetype plugin indent on     " required!
"vundle設定end

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

" 補完候補viewの色設定
 hi Pmenu ctermbg=4 ctermfg=black
 hi PmenuSel ctermbg=1 ctermfg=black
 hi PMenuSbar ctermbg=4


nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

nmap <F8> :TagbarToggle<CR>

nmap <C-k> :resize +5<CR>
nmap <C-j> :resize -5<CR>
nmap <C-l> :vertical resize +5<CR>
nmap <C-h> :vertical resize -5<CR>



" カレントワードをハイライト
highlight CurrentWord term=None ctermbg=brown ctermfg=255

function! s:EscapeText( text )
  return substitute( escape(a:text, '\' . '^$.*[~'), "\n", '\\n', 'ge' )
endfunction

function! s:GetCurrentWord()
  let l:cword = expand('<cword>')
  if !empty(l:cword)
    let l:regexp = s:EscapeText(l:cword)
    if l:cword =~# '^\k\+$'
      let l:regexp = '\<' . l:regexp . '\>'
    endif
    return l:regexp
  else
    return ''
  endif
endfunction

function! s:HighlightCurrentWord()
  let l:word = s:GetCurrentWord()
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
" カレントワードをハイライト end


let $JS_CMD='node'


xmap <Space>d <Plug>(textmanip-duplicate-down)
nmap <Space>d <Plug>(textmanip-duplicate-down)
xmap <Space>D <Plug>(textmanip-duplicate-up)
nmap <Space>D <Plug>(textmanip-duplicate-up)

xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)

" toggle insert/replace with <F10>
nmap <F10> <Plug>(textmanip-toggle-mode)
xmap <F10> <Plug>(textmanip-toggle-mode)


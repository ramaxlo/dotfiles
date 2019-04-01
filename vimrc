color zmrok
set nobackup
set cindent
syntax on
set ruler
set cursorline

" Vundle setup
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Required
Plugin 'gmarik/Vundle.vim'

Plugin 'YankRing.vim'
Plugin 'c.vim'
Plugin 'minibufexpl.vim'
Plugin 'Markdown'
Plugin 'taglist.vim'
Plugin 'help.vim'
Plugin 'CSApprox'
Plugin 'ScrollColors'
Plugin 'sessionman.vim'
Plugin 'DirDiff.vim'
"Plugin 'motemen/git-vim'
Plugin 'fugitive.vim'
"Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'aceofall/gtags.vim'
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}

" Code and files fuzzy finder
Plugin 'kien/ctrlp.vim'
Plugin 'fisadev/vim-ctrlp-cmdpalette'

call vundle#end()
filetype plugin on

" CtrlP ------------------------------

" file finder mapping
let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
nmap ,t :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap ,T :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap ,f :CtrlPLine<CR>
" recent files finder mapping
nmap ,m :CtrlPMixed<CR>
" commands finder mapping
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
	execute ':CtrlP' . a:ctrlp_command_end
	call feedkeys(a:search_text)
endfunction

" same as previous mappings, but calling with current word as default text
nmap ,wt :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wT :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'Mixed')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
 \ 'dir': '\v[\/](\.git|\.hg|\.svn)$',
 \ 'file': '\.pyc$\|\.pyo$',
 \ }

" Use git to fetch list of files if we're in a repository
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

let Tlist_Auto_Highlight_Tag = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplMapCTabSwitchWindows = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2

" To prevent c.vim from affecting C-j mapping in minibufexpl.vim
let g:C_Ctrl_j = 'off'

nmap <F2> :SessionList<CR>
nmap <F3> :SessionSave<CR>
nmap <F4> :TlistToggle<CR>
nmap <F5> :call Help(expand("<cword>"))<CR>
nnoremap <silent> <F6> :NERDTreeToggle<CR>
nnoremap <silent> <F7> :YRShow<CR>

" ======== Git ========
nmap ,gb :Gblame<CR>
nmap ,gs :Gstatus<CR>
nmap ,gl :Glog -- %<CR>:cope<CR>
nmap ,ga :Gwrite<CR>
nmap ,gc :Gcommit<CR>
nmap ,gd :Gvdiff<CR>

" ==== airline ====
" Remove comments below if you want to use airline. Also make sure to install
" DejaVu powerline fonts
"set laststatus=2
"let g:airline_powerline_fonts = 1

if (&term == 'xterm' || &term =~? '^screen')
	" On my machine, I use Konsole with 256 color support
	set t_Co=256
	"let g:CSApprox_konsole = 1
endif

set guifont=DejaVu\ Sans\ Mono\ 11

" ==== Window operations ====
nmap + <C-w>+
nmap - <C-w>-
if has("autocmd")
	" Because we have minibufexpl.vim, the winnr
	" of current buffer will start from 2
	autocmd BufEnter *
	\      if winnr() == 2   |
	\           nmap < <C-w><|
	\           nmap > <C-w>>|
	\      else              |
	\           nmap < <C-w>>|
	\           nmap > <C-w><|
	\      endif             |
endif

" ==== NERDTree ====
let g:NERDTreeWinPos = 'right'

" ==== gtags ====
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

" ==== Go ====
let g:go_bin_path = $HOME . '/bin/go'
au FileType go nmap ,oi <Plug>(go-info)
au FileType go nmap ,od <Plug>(go-doc)
au FileType go nmap ,op :GoImports<CR>
au FileType go nmap ,oc <Plug>(go-callstack)
au FileType go imap <C-o> <C-x><C-o>

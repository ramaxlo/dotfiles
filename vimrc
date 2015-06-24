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

" Code and files fuzzy finder
Plugin 'kien/ctrlp.vim'
Plugin 'fisadev/vim-ctrlp-cmdpalette'

call vundle#end()
filetype on

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
nnoremap <silent> <F6> :YRShow<CR>

" ======== Git ========
nmap ,gb :Gblame<CR>
nmap ,gs :Gstatus<CR>
nmap ,gl :Glog -- %<CR>:cope<CR>
nmap ,ga :Gwrite<CR>
nmap ,gc :Gcommit<CR>

if (&term == 'xterm' || &term =~? '^screen')
	" On my machine, I use Konsole with 256 color support
	set t_Co=256
	"let g:CSApprox_konsole = 1
endif

set guifont=DejaVu\ Sans\ Mono\ 11

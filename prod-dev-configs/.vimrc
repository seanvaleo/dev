
""""""""" Vim-Plug """""""""

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Define plugins
" Must manually install with :PlugInstall
call plug#begin('~/.vim/plugged')

    " Auto-completion for all supported languages
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }

    " More Go support
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()






"""""""" Preferences """"""""

" Use Vim defaults instead of 100% vi compatibility
set nocompatible

" CVE-2007-2438
set modelines=0		

" More powerful backspacing
set backspace=2		

" Disable loading vim defaults
let skip_defaults_vim=1

" When editing a file, always jump to the last cursor position
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

" Theme
set term=xterm-256color
set t_Co=256
set termguicolors
hi LineNr guifg=#464a54
hi EndOfBuffer guifg=#464a54
hi CursorLineNr guifg=cyan
hi CursorLine guibg=#464a54
hi Pmenu guibg=cyan guifg=#000000
hi YcmWarningSign guibg=#e07b00 guifg=#000000
hi YcmWarningSection guibg=#e07b00 guifg=#000000

" Show hybrid line number on the left
set number relativenumber

" Merge clipboards
set clipboard^=unnamed,unnamedplus

" Turn syntax highlighting off
syntax off

" Highlight current line
set cursorline

" Keep the current line in the vertical center of the screen
set scrolloff=200

" Stop the cursor moving left when exiting insert. Causes a bug in arrow keys.
inoremap <silent> <Esc> <Esc>`^

" Display a column for folds
set foldcolumn=1
hi FoldColumn guifg=cyan
hi FoldColumn guibg=#1c1f25
hi Folded guifg=cyan
hi Folded guibg=#464a54

" Remember folds between sessions
augroup remember_folds
    autocmd!
    autocmd BufWinLeave ?* mkview | filetype detect
    autocmd BufWinEnter ?* silent loadview | filetype detect
augroup END

" Statusline Options
set laststatus=2
set statusline=
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number

" Home backup directory to avoid backups ending up in Git
set backupdir=$HOME//
set directory=$HOME//

" Enable mouse scrolling
set mouse=n

" Default indentation 4 spaces
set expandtab shiftwidth=4 tabstop=4

" Enable filetype for command below
filetype plugin indent on

" Indentation based on file type
if has("autocmd")
    autocmd FileType c,cpp,h,hpp set expandtab shiftwidth=4 tabstop=4
    autocmd FileType python set expandtab shiftwidth=4 softtabstop=4
    autocmd FileType go set noexpandtab shiftwidth=4 tabstop=4 
    autocmd FileType make set noexpandtab tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
    autocmd Filetype typescript set expandtab shiftwidth=2 softtabstop=2
endif



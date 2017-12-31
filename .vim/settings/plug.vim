" ================ Install vim-plug if not installed ==============

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
" General plugins
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-sensible'

Plug 'scrooloose/nerdtree'

" Plug 'Raimondi/delimitMate'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --go-completer --js-completer' }

" Git plugins
" Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'

""" Languages

Plug 'sheerun/vim-polyglot'

" Go plugins
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Javascript plugins
Plug 'pangloss/vim-javascript'

" HTML plugins
Plug 'mattn/emmet-vim'

""" Visual

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Theme
Plug 'dracula/vim'

call plug#end()

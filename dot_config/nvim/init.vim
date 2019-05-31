let $NVIM_HOME = $HOME.'/.config/nvim'

let mapleader = "\<Space>"

" ================ General Config ====================

set encoding=utf8  " Set encoding
set laststatus=2   " Always show statusline
set number         " Enable line Numbers
set relativenumber " Enable relative line numbers
set nowrap         " Disable line wrap
set showcmd        " Show incomplete cmds down the bottom
set showmode       " Show current mode down the bottom
set visualbell     " No sounds"
set noautochdir    " Dont set CWD when as rootdir when opening vim
set autoread       " Reload files changed outside vim
set hidden         " This makes vim act like all other editors, buffers can exist in the background without being in a window. http://items.sjbach.com/319/configuring-vim-right
set colorcolumn=80 " Display a column at the 80th column
set tags=./tags
set nocompatible

set splitbelow " Default horizontal split direction
set splitright " Default vertical split direction

" Re-balance when vim is resize
autocmd VimResized * :wincmd =

" ================ Indentation ================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set list listchars=tab:⇥\ ,trail:·

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype indent on

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
if has('persistent_undo') && isdirectory($NVIM_HOME.'/backups')
  silent !mkdir $NVIM_HOME/backups > /dev/null 2>&1
  set undodir=$NVIM_HOME/backups
  set undofile
endif

" ================ Folds ================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ keymaps ===========================

" fix rubocop offensed with <leader>ra
nnoremap <silent> <leader>ra :silent !bundle exec rubocop -a %<cr>

" == Buffers
" buffer next: Go to next buffer
nnoremap <leader>bn :bn<cr>
nnoremap <leader>b] :bn<cr>
" buffer previous: Go to previous buffer
nnoremap <leader>bp :bp<cr>
nnoremap <leader>b[ :bp<cr>
" buffer delete: Delete current buffer
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bk :bd<cr>
" buffer last: Go to last oppened buffer
nnoremap <leader>bl :bl<cr>
" buffer save: Writes buffer
nnoremap <leader>bs :w<cr>

" == Project
" project .: Open sidebard on current context
nnoremap <leader>p. :NERDTreeFind<cr>
" Find files
nnoremap <leader><leader> :FZF<cr>

" == Git
" git status: open git
nnoremap <leader>gs :Gst<cr>
" git add: git add current buffer
nnoremap <silent> <leader>ga :silent !git add %<cr>

" == Windows
" Zoom in
nnoremap <leader>w- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>wmb :wincmd _<cr>:wincmd \|<cr>
" Re-balance windows
nnoremap <leader>w= :wincmd =<cr>
"Max out the height of the current split
nnoremap <leader>w_ :wincmd _<cr>
nnoremap <leader>wms :wincmd _<cr>
"Max out the width of the current split
nnoremap <leader>w\| :wincmd \|<cr>
nnoremap <leader>wmv :wincmd \|<cr>
" window new: New empty window
nnoremap <leader>wN :new<cr>
" window vertical new: New vertical empty window
nnoremap <leader>wV :bnew<cr>
" window split: Open a horizontal split
nnoremap <leader>ws :sp<cr>
" window vertical split: Open a vertical split
nnoremap <leader>wv :vsp<cr>
" window quit: Close current window
nnoremap <leader>wq :q<cr>
" window breakout: break out split into window
nnoremap <leader>wB :wincmd T<cr>
" window kill others: kill other windows
nnoremap <leader>wo :wincmd o<cr>
" window rotate: swaps windows
nnoremap <leader>wr :wincmd r<cr>

" window left: moves the cursor buffer on the left
nnoremap <leader>wh :wincmd h<cr>
" window down: moves the cursor buffer on the bottom
nnoremap <leader>wj :wincmd j<cr>
" window up: moves the cursor buffer on the top
nnoremap <leader>wk :wincmd k<cr>
" window right: moves the cursor buffer on the right
nnoremap <leader>wl :wincmd l<cr> 

" window move left: moves buffer to the left
nnoremap <leader>wH :wincmd H<cr>
" window move down: moves the buffer to the bottom
nnoremap <leader>wJ :wincmd J<cr>
" window move up: moves the buffer to the top
nnoremap <leader>wK :wincmd K<cr>
" window move right: moves cursor buffer to the right
nnoremap <leader>wL :wincmd L<cr> 

" == Toggles
" toggle sidebar: Open sidebar
nnoremap <leader>ts :NERDTreeToggle<cr>

" == Files
" file todo: opens TODO.md in a vertical split
nnoremap <leader>ft :vsplit ~/TODO.md<cr>
" find here: sarches for file in the current directory
nnoremap <leader>f/ :FZF %:p:h<cr>
nnoremap <leader>ff :FZF %:p:h<cr>
" find save: writes the buffer (same as <leader>bs)
nnoremap <leader>fs :w<cr>

" == Open
" open project: open project sidebar
nnoremap <leader>op :NERDTreeToggle<cr>
" open dired: open the current folder
nnoremap <leader>o- :e .<cr>

runtime macros/matchit.vim

so $NVIM_HOME/plug.vim

" Heavely inspired by github.com/skwp/dotfiles

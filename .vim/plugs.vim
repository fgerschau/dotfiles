" ================ Vim plugin configuration ====================
call plug#begin('~/dotfiles/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'shougo/vimproc.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'rakr/vim-one', { 'as': 'one'  }
Plug 'vim-airline/vim-airline'

" Typescript
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
" Plug 'soywod/typescript.vim'
" Plug 'HerringtonDarkholme/yats.vim'

" Fuzzy search
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

" Renaming files w/ :rename[!]
Plug 'danro/rename.vim'
Plug 'zivyangll/git-blame.vim'

" Dart
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

" Commenting code
Plug 'scrooloose/nerdcommenter'

" Close all buffers except this one
Plug 'vim-scripts/BufOnly.vim'

" Git
Plug 'tpope/vim-fugitive'

" Airline theme
Plug 'vim-airline/vim-airline-themes'

" Search
Plug 'dyng/ctrlsf.vim'
Plug 'nixprime/cpsm', { 'do': 'env PY3=OFF ./install.sh' }

" Fixes weird quickfix window behavior
Plug 'romainl/vim-qf'

" Markdown preview
Plug 'JamshedVesuna/vim-markdown-preview'

" Testing
Plug 'janko-m/vim-test'

call plug#end()

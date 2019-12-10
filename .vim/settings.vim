" ================ Stuff I added later ================
" ================== Nerdtree ==================
nmap <F6> :NERDTreeToggle<CR>

" Opens NERDTree if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
syntax enable

let g:NERDTreeNodeDelimiter = "\u00a0"

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" ================== Tabs ==================
let NERDTreeMapOpenInTab='\r'
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" ================== Other ==================
" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" Color config
set background=dark
colorscheme solarized

" Fuzzy search options crtlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Requires fd to be installed (brew install fd)
let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
let g:ctrlp_use_caching = 0
" Requires boost to be installed (brew install cmake python boost)
" https://bluz71.github.io/2017/10/26/turbocharge-the-ctrlp-vim-plugin.html
" let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }

" ===== Coc =====
set hidden
set cmdheight=2
set shortmess=aFc

" Markdown preview
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'

" Vim-test settings
let g:test#preserve_screen = 0

" Enters normal mode in terminal
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

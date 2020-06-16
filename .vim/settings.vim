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

" Quits nerdtree when opening a file
let g:NERDTreeQuitOnOpen = 1

" Other nerdtree settings
let g:NERDTreeWinSize=60
let NERDTreeShowHidden=1

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

" FZF
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" ===== Coc =====
set hidden
set cmdheight=2
set shortmess=aFc

" Plugins
"let g:coc_global_extensions=[
    "\ "coc-tsserver",
    "\ "coc-tslint-plugin"
    "\ "coc-json",
    "\ "coc-css",
    "\ "coc-omni",
"\]

" Markdown preview
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'

" Vim-test settings
let g:test#preserve_screen = 0

" Enters normal mode in terminal
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" ===== ALE =====
" Ale configuration
let g:ale_linters = {
 \   'javascript': ['eslint'],
 \   'typescript': ['eslint'],
 \   'typescriptreact': ['eslint'],
 \   'dart': ['dartanalyzer'],
 \   'scss': ['stylelint'],
 \}

let g:ale_fixers = {
\   'dart': ['dartfmt'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'typescriptreact': ['eslint'],
\   'scss': ['stylelint']
\}

let g:ale_fix_on_save = 1

set cursorline

" Leader
let mapleader=','
map , <leader>
map m <leader>

" Map / to - since it's easier to reach
nmap - /

" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Fuzzy search
nmap <C-p> :FZF<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
function! s:go_to_definition()
  execute ':NERDTreeClose'
  call CocAction('jumpDefinition')
endfunction

nmap <silent> gd :call <SID>go_to_definition()<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" For local replace
"nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
"nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
if &filetype == 'vim'
  execute 'h '.expand('<cword>')
else
  call CocAction('doHover')
endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>r  <Plug>(coc-format-selected)
nmap <leader>r  <Plug>(coc-format-selected)

augroup mygroup
autocmd!
" Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

"nmap <leader>qf  <Plug>(coc-fix-current)
" Fix autofix problem of current line
nmap <leader>ff  <Plug>(coc-fix-current)

" Fix file using ALE
noremap <leader>af :ALEFix<CR>

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Restart tsserver
nnoremap <leader>tr :CocCommand tsserver.restart<CR>

" COC Multiple cursors
nmap <silent> <C-c> <Plug>(coc-cursors-position)
nmap <silent> <C-w> <Plug>(coc-cursors-word)
xmap <silent> <C-w> <Plug>(coc-cursors-range)
nmap <leader>x  <Plug>(coc-cursors-operator)

" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

" Close buffer
noremap <leader>d :bp\|bd #<CR>
noremap <leader>D :bd!<CR>

" Close all buffers except the current one
noremap <leader>s :BufOnly<CR>

" Flutter
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>

" Surrounding with parenthesis
xnoremap s( xi()<Esc>P%
xnoremap s[ xi[]<Esc>P%
xnoremap s{ xi{}<Esc>P%
xnoremap s" xi""<Esc>P%
xnoremap s' xi''<Esc>P%
xnoremap s` xi``<Esc>P%

" COC
nmap <leader>rn <Plug>(coc-rename)

" Search
nmap <leader>FF <Plug>CtrlSFPrompt
nmap <leader>Fn <Plug>CtrlSFCwordPath
nmap <leader>Fp <Plug>CtrlSFPwordPath

" Markdown preview toggle
let vim_markdown_preview_hotkey='<C-m>'

" Vim test
nmap <leader>tf :TestFile<CR>
nmap <leader>tn :TestNearest<CR>
nmap <leader>ts :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>tv :TestVisit<CR>

" Emojis
nnoremap <leader>et a<C-v>U2705<esc>

" Copy file path
"
" This maps the following keys:
"
"  'cs copies just the filename.
"  'cl copies the filename including its full path.
"  'c8 copies the filename in 8.3 format for DOS and Windows 9x
"
" Convert slashes to backslashes for Windows.
if has('win32')
  nmap 'cs :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
  nmap 'cl :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>

  " This will copy the path in 8.3 short format, for DOS and Windows 9x
  nmap 'c8 :let @*=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
  nmap 'cs :let @*=expand("%")<CR>
  nmap 'cl :let @*=expand("%:p")<CR>
endif

lua require('base_config.mappings')

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
nnoremap H ^
nnoremap L $
omap H ^
omap L $
xmap H ^
xmap L $
vnoremap Y "+y
nnoremap Y "+y
nnoremap <Space>p "+p
nmap <leader>w :w!<cr>
" map <C-;> <Esc>
" imap <C-;> <Esc>
" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
" vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Migrate <c-l> to <c-n> and add disable highlighting

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-w>h


map <Space>l <C-W>l
map <Space>h <C-W>h
map <Space>j <C-W>j
map <Space>k <C-W>k

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <silent> <M-j> mz:m+<cr>`z
nmap <silent> <M-k> mz:m-2<cr>`z
vmap <silent> <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <silent> <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader> [使用 <leader> 的快捷方式]
map <leader>sa zg
map <leader>s? z=
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-h> <Left>
inoremap <M-l> <Right>
inoremap <M-;> <Del>
nnoremap <M-h> :<C-u>tabprevious<cr>
nnoremap <M-l> :<C-u>tabnext<cr>

inoremap <Char-0x1f> <ESC>
noremap <Char-0x1f> <ESC>
cnoremap <Char-0x1f> <C-c>

nnoremap <silent> <Space>n :noh<bar>SnipClose<cr><c-l>
nnoremap <leader>v :<c-u>source ~/.config/nvim/init.lua<cr>
map <C-q> <C-w>q

vnoremap <M-l> :normal gvdp<cr>`[v`]
vnoremap <M-h> :normal gvdhP<cr>`[v`]

nmap <leader>rf <Plug>SnipRun
nmap <leader>r <Plug>SnipRunOperator
vmap  <leader>r <Plug>SnipRun

nnoremap <silent> <leader>m :<c-u>lua require("harpoon.mark").add_file()<CR>
nnoremap <silent> <Space>m :<c-u>lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <silent> <leader>l :<c-u>lua require("harpoon.ui").nav_next()<CR>
nnoremap <silent> <leader>h :<c-u>lua require("harpoon.ui").nav_prev()<CR>

nnoremap <M-a> :<c-u>AI
vnoremap <M-a> :<c-u>AI
inoremap <M-a> :<Esc>:AI<CR>a

" vim-translator
" Echo translation in the cmdline
nmap <silent> <Leader>tt <Plug>Translate
vmap <silent> <Leader>tt <Plug>TranslateV
" Display translation in a window
nmap <silent> <Leader>te <Plug>TranslateW
vmap <silent> <Leader>te <Plug>TranslateWV

nmap <silent> <leader>q :Bd<cr>

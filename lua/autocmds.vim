source ~/.config/nvim/lua/vim_file/helper_functions.vim

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif
au FocusGained,BufEnter * checktime
" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif
if exists('$TMUX')
  let &t_SI = "\<Esc>]12;cyan\x7"
  let &t_EI = "\<Esc>]12\x7"
endif
autocmd BufRead,BufNewFile *.v :Copilot disable
autocmd BufRead,BufNewFile *.v setfiletype verilog

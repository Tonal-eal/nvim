lua require('base_config.options')

let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_compiler_method = 'latexrun'
" set laststatus=2  "永远显示状态栏
set t_Co=256      "在windows中用xshell连接打开vim可以显示色彩
let g:ai_no_mappings = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:VM_set_statusline=0
let g:VM_maps = {}
let g:VM_leader = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps['Find Under']                  = '<C-s>'
let g:VM_maps['Find Subword Under']          = '<C-s>'
let g:VM_maps["Select All"]                  = '<M-s>'
let g:VM_maps["Visual Cursors"]              = '<C-s>'
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1
" let maplocalleader = ';'
set hidden
set updatetime=200
set showcmd
set noerrorbells
set number
set autoread
set novisualbell
" set shiftwidth=4 softtabstop=4 tabstop=4 expandtab smarttab
set nocompatible
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
 if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set termguicolors
  endif

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set regular expression engine automatically
set regexpengine=0
" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

if has('termguicolors')
    set termguicolors
endif
" set background=dark
let g:gruvbox_italic=1


let g:edge_style = 'neon'
let g:edge_better_performance = 1
let g:airline_theme = 'edge'
" colorscheme edge


" let g:airline_theme='minimalist' " 'minimalist'
" let g:gruvbox_material_background = 'soft'
" let g:gruvbox_material_better_performance = 1
" colorscheme gruvbox-material


" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e"

    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=1 "0 don' show 1 need show 2 all show
catch
endtry

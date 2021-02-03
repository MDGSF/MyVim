"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"    Huang Jian (1342042894@qq.com)
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files, backups and undo
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs, windows and buffers
"    -> Status line
"    -> Misc
"    -> keymapping
"    -> Autogroups
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" Vim 需要记住多少次历史操作。
" Sets how many lines of history VIM has to remember
set history=1000

" 开启文件类型检查，并且载入与该类型对应的缩进规则。比如，如果编辑的是.py文件，Vim
" 就是会找 Python 的缩进规则~/.vim/indent/python.vim。
" Enable filetype plugins
filetype plugin on
filetype indent on

" 打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示。
" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=","
let g:mapleader=","

" Fast saving
nnoremap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" 垂直滚动时，光标距离顶部/底部的位置（单位：行）。
" Set 5 lines to the cursor - when moving vertically using j/k
set scrolloff=5

" 水平滚动时，光标距离行首或行尾的位置（单位：字符）。该配置在不折行时比较有用。
set sidescrolloff=15

" 命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下
" Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令。
" Turn on the Wild menu
set wildmenu
set wildmode=longest:list,full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" 在状态栏显示光标的当前位置（位于哪一行哪一列）。
" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" 搜索时忽略大小写。
" Ignore case when searching
set ignorecase
" set noignorecase

" 如果同时打开了ignorecase，那么对于只有一个大写字母的搜索词，将大小写敏感；
" 其他情况都是大小写不敏感。比如，搜索Test时，将不匹配test；搜索test时，将匹配Test。
" When searching try to be smart about cases
set smartcase

" 搜索时，高亮显示匹配结果。
" Highlight search results
set hlsearch

" 输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果。
" Makes search act like search in modern browsers
set incsearch

" Faster redrawing
set ttyfast

" Vim loves to redraw the screen during things it probably doesn't need to—like
" in the middle of macros. This tells Vim not to bother redrawing during these
" scenarios, leading to faster macros.
" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" 光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号。
" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" 出错时，不要发出响声。
" No annoying sound on errors
set noerrorbells
" 出错时，发出视觉提示，通常是屏幕闪烁。
set novisualbell
set t_vb=
set tm=500

" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" 打开语法高亮。自动识别代码，使用多种颜色显示。
" Enable syntax highlighting
syntax enable
syntax on

" 启用 256 色,必须有这个了，下面的配色方案才会生效
" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" 配色方案
" try
"   colorscheme desert
" catch
" endtry
" colorscheme badwolf 会使用 ~/.vim/colors/badwolf.vim 这个文件
colorscheme desert

" set background=dark

" 使用 utf-8 编码。
" Set utf8 as standard encoding and en_US as the standard language
" vim 打开文件的时候，会根据 fileencodings 所列出的编码来一个个尝试打开文件，
" 成功打开文件了，把对应的编码设置到 fileencoding 里面，然后把文件内容从 fileencoding 编码
" 转换为 encoding 编码。
" vim 保存文件的时候，会先把内存中的 encoding 编码的内容转换为 fileencoding
" 编码的格式，然后再保存到文件中。
" 那么，你如果想把一个文件的格式转换为 utf-8，你只要先打开文件，然后执行 set fileencoding=utf-8，再保存文件就可以了。
" 你可以使用 `set encoding` 来查看当前的 encoding 编码。
" 你可以使用 `set fileencoding` 来查看当前的 fileencoding 编码。
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gb2312,gb18030,gbk,cp936,latin1
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" 设置备份文件、交换文件、操作历史文件的保存位置。
" 结尾的//表示生成的文件名带有绝对路径，路径中用%替换目录分隔符，这样可以防止文件重名。

if !isdirectory($HOME.'/.vim/.backup') && exists('*mkdir')
  call mkdir($HOME.'/.vim/.backup')
endif
if !isdirectory($HOME.'/.vim/.swp') && exists('*mkdir')
  call mkdir($HOME.'/.vim/.swp')
endif
if !isdirectory($HOME.'/.vim/.undo') && exists('*mkdir')
  call mkdir($HOME.'/.vim/.undo')
endif

set backup
set backupdir=~/.vim/.backup//,~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim/.swp//,~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set undodir=~/.vim/.undo//
set writebackup

" Turn backup off, since most stuff is in SVN, git et.c anyway...
" set nobackup
" set nowb
" set noswapfile

" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" set noexpandtab : use tab
" set expandtab : use space
set expandtab

" Be smart when using tabs ;)
set smarttab

set shiftwidth=2 " 在文本上按下>>（增加一级缩进）、<<（取消一级缩进）或者==（取消全部缩进）时，每一级的字符数。
set shiftround

set tabstop=2 " 按下 Tab 键时，Vim 显示的空格数。
set softtabstop=2 " Tab 转为多少个空格。

" 只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说，不会在单词内部折行。
set linebreak

" 设置行宽
" set textwidth=80 这么设置的话，在超过 80 的时候，会自动在末尾添加换行符。
set textwidth=0

" set autoindent
" set cindent
" set smartindent
" choose one of them
set smartindent

" 自动折行，这个是在长度超过窗口的时候，显示为两行，但是实际数据还是一行。
set wrap

" 关闭自动折行
" set nowrap

" 指定折行处与编辑窗口的右边缘之间空出的字符数。
set wrapmargin=2

" }}}


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" {{{

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Close the current buffer
noremap <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
noremap <leader>ba :bufdo bd<cr>

noremap <leader>l :bnext<cr>
noremap <leader>h :bprevious<cr>

" Useful mappings for managing tabs
noremap <leader>ti :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tn :tabnext<cr>
noremap <leader>tp :tabprev<cr>
noremap <leader>tm :tabmove

noremap <C-N> :tabnext<cr>
noremap <C-P> :tabprev<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nnoremap <Leader>tl :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" }}}


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" {{{

" Always show the status line
" 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示。
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" 执行 :split 的时候，在当前窗口的下方新建窗口
" open new windows below the current windows.
set splitbelow

" 执行 :vsplit 的时候，在当前窗口的右方新建窗口
" open new windows right of the current windows.
set splitright

" set number 打开
" set nonumber 关闭
" set number? 查询配置项是打开还是关闭
" :help number 查看帮助文档
set number

" 不与 Vi 兼容（采用 Vim 自己的操作命令）。
set nocompatible

" 在底部显示，当前处于什么模式。
set showmode

" 在底部显示输入的命令，具体看帮助文档 :help showcmd
set showcmd

" 支持使用鼠标。
set mouse=a

" 显示光标所在的当前行的行号，其他行都为相对于该行的相对行号。
" set relativenumber

" 光标所在的当前行高亮。
set cursorline

" Searches wrap around end-of-file.
set wrapscan

" Always report changed lines.
set report=0

" Switch between buffers without having to save first.
set hidden

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
" nnoremap $ <nop>
" nnoremap ^ <nop>

" 自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，
" 默认的工作目录是打开的第一个文件的目录。该配置可以将工作目录自动切换到，正在编辑的文件的目录。
" set noautochdir
" set autochdir

" 如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块。
" set listchars=tab:»■,trail:■
" set list


setlocal foldenable
setlocal foldmethod=syntax
setlocal foldopen-=search  "don't open folds when I search
setlocal foldopen-=undo    "don't open folds when I undo

"don't folds when I open the file
setlocal foldlevelstart=100
setlocal foldlevel=100

nnoremap <space> @=((foldclosed(line( '.' ))<0) ? 'zc' : 'zo')<CR>

" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => keymapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

noremap <F5> :set ts=2<CR>:set expandtab<CR>:%retab!<CR>
noremap <C-F5> :set ts=2<CR>:set noexpandtab<CR>:%retab!<CR>

noremap <silent> <leader>ev :e ~/.vimrc<CR>
noremap <silent> <leader>sv :source ~/.vimrc<CR>
autocmd! bufwritepost .vimrc source ~/.vimrc

noremap <silent> <leader>ez :vsp ~/.zshrc<CR>

noremap <leader>v :vsplit<CR>

" map <C-A> ggvGY
" map! <C-A> <Esc>ggvGY

" 去除行尾空白字符
nnoremap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>

" 格式化整个文档
nnoremap <leader>= :call Preserve("normal gg=G")<CR>

" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AngleBrackets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup AngleBrackets
  autocmd!
  autocmd FileType h,hpp,inl,cpp,c,cxx set matchpairs+=<:>
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autogroups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.go :call <SID>StripTrailingWhitespaces()
  autocmd FileType java setlocal noexpandtab
  autocmd FileType java setlocal list
  autocmd FileType java setlocal listchars=tab:+\ ,eol:-
  autocmd FileType java setlocal formatprg=par\ -w80\ -T4
  autocmd FileType php setlocal expandtab
  autocmd FileType php setlocal list
  autocmd FileType php setlocal listchars=tab:+\ ,eol:-
  autocmd FileType php setlocal formatprg=par\ -w80\ -T4
  autocmd FileType ruby setlocal tabstop=2
  autocmd FileType ruby setlocal shiftwidth=2
  autocmd FileType ruby setlocal softtabstop=2
  autocmd FileType ruby setlocal commentstring=#\ %s
  autocmd FileType python setlocal commentstring=#\ %s
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.sh setlocal tabstop=2
  autocmd BufEnter *.sh setlocal shiftwidth=2
  autocmd BufEnter *.sh setlocal softtabstop=2
  autocmd BufEnter *.js setlocal tabstop=2
  autocmd BufEnter *.js setlocal shiftwidth=2
  autocmd BufEnter *.js setlocal softtabstop=2
augroup END



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

function! CmdLine(str)
  call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" toggle between number and relativenumber
function! ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunction

" strips trailing whitespace at the end of files.
" this is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
  " save last search & cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor
  " position
  let @/=_s
  call cursor(l, c)
endfunction


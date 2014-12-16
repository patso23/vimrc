" From http://fishshell.org/wiki/moin.cgi/Recipes at 2008-01-06
" Why does VIM give error messages when started from fish?
" (Thanks to James Vega for this solution) 
"
" When run from the fish shell, VIM gives error messages like: "E484: Can't open file /tmp/v916556/0" 
"
" The problem occurs because VIM expects to be run from a POSIX shell, although this is not mentioned anywhere in the documentation. A workaround is to add the following lines to the your local ~/.vimrc or global /etc/vimrc file:
if $SHELL =~ 'bin/fish'
    set shell=/bin/sh
endif
" Assuming /bin/sh is a link to a POSIX compliant shell - even minimal shells like 'ash' or 'dash' will do.

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = ['dwm.vim']

" load pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim

" and infect the runtime
call pathogen#infect()

" jquery syntax
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" Sets how many lines of history VIM has to remember
set history=300

" Enable filetype plugin
filetype plugin on
filetype indent on

syn on
set background=dark

if has("gui_running")
    "colo mustang 
    colo lucius
    " highlight line number
    hi CursorLine guibg=NONE
    hi CursorLineNr gui=bold guifg=#afd75f
    set cursorline
else
    " nice theme for console
    colo elflord 
    
    " Mouse support
    "set mouse=a 
endif 

set gfn=DejaVu\ Sans\ Mono\ 7
"set number

set et  "Expand tabs
set autoindent
"set smartindent
set tabstop=4
"set softtabstop=4
set shiftwidth=4
"set hls

" Set 7 lines to the curors - when moving vertical..
set so=7

set cc=80   " vertical visual line

highlight ColorColumn ctermbg=7

set wildmenu "Turn on WiLd menu

set ruler "Always show current position

set hid "Change buffer - without saving

" makes vim work like every other multiple-file editor on the planet. You can have edited buffers that aren't visible in a window somewhere
set hidden

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"set incsearch "Make search act like search in modern browsers

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs in powerline

let g:Powerline_symbols = 'unicode'

let g:snips_author = 'Patrick OShea'

" remove trailing space
nmap <leader>rt :%s/\s\+$//<CR>

" :W also write file
cnoreabbrev W w

" ;; in insert mode do the completion
"imap ;; <C-P>
" ctrl space for completion
" imap <C-Space> <C-N>

"supertab !
let g:SuperTabDefaultCompetionType = ""
"let g:SuperTabDefaultCompletionType = context"
"let g:SuperTabMappingForward = '<c-space>'                                                                      
"let g:SuperTabMappingBackward = '<s-c-space>'


" Automatically update copyright notice with current year
" http://vim.wikia.com/wiki/Automatically_Update_Copyright_Notice_in_Files
autocmd BufWritePre *
  \ if &modified |
  \   exe '%s:'.
  \       '\cCOPYRIGHT\s*\%((c)\|©\|©\)\?\s*'.
  \         '\%([0-9]\{4}\(-[0-9]\{4\}\)\?,\s*\)*\zs'.
  \         '\('.
  \           '\%('.strftime("%Y").'\)\@![0-9]\{4\}'.
  \           '\%(-'.strftime("%Y").'\)\@!\%(-[0-9]\{4\}\)\?'.
  \         '\&'.
  \           '\%([0-9]\{4\}-\)\?'.
  \           '\%('.(strftime("%Y")-1).'\)\@!'.
  \           '\%([0-9]\)\{4\}'.
  \         '\)'.
  \         '\ze OpenERP\%(\%([0-9]\{4\}\)\@!.\)*$:'.
  \       '&, '.strftime("%Y").':e' |
  \   exe '%s:'.
  \       '\cCOPYRIGHT\s*\%((c)\|©\|©\)\?\s*'.
  \         '\%([0-9]\{4}\%(-[0-9]\{4\}\)\?,\s*\)*\zs'.
  \           '\%('.strftime("%Y").'\)\@!\([0-9]\{4\}\)'.
  \           '\%(-'.strftime("%Y").'\)\@!\%(-[0-9]\{4\}\)\?'.
  \         '\ze OpenERP\%(\%([0-9]\{4\}\)\@!.\)*$:'.
  \       '\1-'.strftime("%Y").':e' |
  \ endif



" Syntastic
"let g:syntastic_enable_signs=1

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_python_checker_args = '--ignore=E501,E301,E302'
"let g:syntastic_javascript_checker = 'jshint'

" TagBar 
let g:tagbar_usearrows = 1
"nnoremap <leader>l :TagbarToggle<CR>
nmap <F8> :TagbarToggle<CR>

" NERDTree
nmap <F2> :NERDTreeToggle<CR>
" auto close NERDTree at close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"An autocmd to make vim not break when used for crontab -e
"See :help 'backupcopy' and scroll down a bit
autocmd FileType crontab set backupcopy=yes

"Set folding options for CSS files
au FileType css,*.css setlocal foldmethod=marker foldmarker={,} foldcolumn=3

"Using <space> to open/close a folding.
nnoremap <space> za 
vnoremap <Space> za
nnoremap <A-space> zA

"Using <TAB> to move between windows
nnoremap <TAB> <C-W><C-W>

"and tabs
map <C-S-Tab> :tabprevious<CR>
nmap <C-S-Tab> :tabprevious<CR>
imap <C-S-Tab> <Esc>:tabprevious<CR>i
map <C-Tab> :tabnext<CR>
nmap <C-Tab> :tabnext<CR>
imap <C-Tab> <Esc>:tabnext<CR>i 

" esay switch between buffers
nnoremap <leader>ls :ls<CR>:b<Space>

" keep selection when indent with > or <
vnoremap < <gv
vnoremap > >gv


" skybison mappings (ones from video)
"nnoremap <cr>       2:<c-u>call SkyBison("b ")<cr>
"autocmd               * nnoremap <buffer> <cr> a<cr>
" nnoremap <bs>        :<c-u>call GenerateTagsForBuffers()<cr>2:<c-u>call SkyBison("tag ")<cr>
"nnoremap <space>h   2:<c-u>call SkyBison("h ")<cr>
"nnoremap <space>e    :<c-u>call SkyBison("e ")<cr>
"nnoremap <space>;    :<c-u>call SkyBison("")<cr>
"cnoremap <c-l>       <c-r>=SkyBison("")<cr><cr>


""" some tibits from https://github.com/sjl/dotfiles/blob/master/vim/vimrc

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Fuck you, help key.
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a

" "Uppercase word" mapping.
"
" This mapping allows you to press <c-u> in insert mode to convert the current
" word to uppercase.  It's handy when you're writing names of constants and
" don't want to use Capslock.
"
" To use it you type the name of the constant in lowercase.  While your
" cursor is at the end of the word, press <c-u> to uppercase it, and then
" continue happily on your way:
"
"                            cursor
"                            v
"     max_connections_allowed|
"     <c-u>
"     MAX_CONNECTIONS_ALLOWED|
"                            ^
"                            cursor
"
" It works by exiting out of insert mode, recording the current cursor location
" in the z mark, using gUiw to uppercase inside the current word, moving back to
" the z mark, and entering insert mode again.
"
" Note that this will overwrite the contents of the z mark.  I never use it, but
" if you do you'll probably want to use another mark.
inoremap <C-u> <esc>mzgUiw`za

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
nnoremap <c-z> mzzMzvzz15<c-e>`z

""" 

""""""""""
" Author: Rick L.
" Date  : 20210713
" Info  : latest updates to the ever expanding/changing vimrc file
"
""""""""""
scriptencoding utf-8
set undodir=~/.vim/undodir/
set backupdir=~/.vim/backup/
set directory=~/.vim/swp/
set nocompatible                    " use vim settings, rather than vi settings
set softtabstop=2                   " indent by 2 spaces when hitting tab
set shiftwidth=4                    " indent by 4 spaces when auto-indenting
set tabstop=4                       " show existing tab with 4 spaces width
"filetype indent on                  " enable indenting for files
"set autoindent                      " enable auto indenting
set number                          " enable line numbers
set relativenumber                  " also enable with 'set rnu'
" disable via :set nonu and :set nornu
augroup toggle_relative_number
    autocmd InsertEnter * :setlocal norelativenumber
    autocmd InsertLeave * :setlocal relativenumber
" execute :w!! quickly to save a file that you did not open with proper permissions
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
"colorscheme desert
"set nobackup " disable backup files
set laststatus=2 "show status line
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
"set statusline=%F%m%r%h%w\ \ \ [FORMAT=%{&ff}]\ \ \ [TYPE=%Y]\ \ \ [ASCII=\%03.3b]\ \ \ [POS=%04l,%04v][%p%%]\ \ \ [LEN=%L]
set rulerformat=%22(%M%n\ %=%l,%c%V\ %P%)

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" See what is installed: PlugStatus
" Install missing plugins: PlugInstall
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
"Plug 'junegunn/vim-easy-align'
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'itchyny/lightline.vim'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'farmergreg/vim-lastplace'
"Plug 'tomtom/tcomment_vim'
"Plug 'dhruvasagar/vim-table-mode'
"Plug 'andymass/vim-matchup'                                                                           " Extended matching with '%'
"Plug 'airblade/vim-gitgutter'                                                                         " Shows a git diff in the sign column. Stage and undo individual hunks.
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }                  " Language server protocol client.
"Plug 'Badacadabra/vim-archery'                                                                        " Vim colorscheme inspired by Arch Linux colors
Plug 'benmills/vimux'                                                                                 " Easily interact with tmux from vim.
Plug 'brooth/far.vim'                                                                                 " Find and replace for vim
Plug 'christoomey/vim-tmux-navigator'                                                                 " Navigate seamlessly between vim and tmux splits
"Plug 'cyansprite/Extract'                                                                             " Extract; Draw forth what really matters
Plug 'dracula/vim'                                                                                    " Dracula colorscheme for vim
Plug 'easymotion/vim-easymotion'                                                                      " Vim motion on speed!.
Plug 'editorconfig/editorconfig-vim'                                                                  " Follow .editorconfig settings in projects
Plug 'godlygeek/tabular'                                                                              " Align text easily.
Plug 'joshdick/onedark.vim'                                                                           " A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme.
Plug 'jsfaint/gen_tags.vim'                                                                           " Async plugin to ease the use of ctags/gtags.
Plug 'junegunn/fzf.vim'                                                                               " fuzzy finder for vim.
Plug 'junegunn/goyo.vim'                                                                              " Distraction-free writing in Vim.
"Plug 'junegunn/gv.vim'                                                                                " Git commit browser
Plug 'lifepillar/vim-solarized8'                                                                      " Solarized true color colorscheme for vim.
Plug 'majutsushi/tagbar'                                                                              " Class outline viewer for vim.
"Plug 'mileszs/ack.vim'                                                                                " Run your favorite search tool from vim.
Plug 'morhetz/gruvbox'                                                                                " Gruvbox colorscheme for vim.
"Plug 'nathanaelkane/vim-indent-guides'                                                                " Visually diosplaying indent levels for vim.
"Plug 'ncm2/ncm2'                                                                                      " Slim, fast hackable completion framework, for neovim.
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-jedi'
"Plug 'ncm2/ncm2-markdown-subscope'
"Plug 'ncm2/ncm2-path'
"Plug 'ncm2/ncm2-racer'
"Plug 'ncm2/ncm2-tern', { 'do': function('BuildNcm2Tern') }
"Plug 'ncm2/ncm2-tmux'
"Plug 'ncm2/ncm2-ultisnips'
"Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
"Plug 'rakr/vim-one'                                                                                   " Adaptation of one-light and one-dark colorschemes for Vim
"Plug 'rodjek/vim-puppet'                                                                              " Make vim more puppet friendly!.
"Plug 'roxma/nvim-yarp'                                                                                " Required by ncm2
" Replacing NerdTree with Fern
Plug 'lambdalisue/fern.vim'
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"  \ | Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/echodoc.vim'                                                                             " Show function signature and inline doc.
Plug 'Shougo/neco-vim'                                                                                " Autocompletion for vimscript
Plug 'Shougo/neco-syntax'                                                                             " Syntax autocompletion
"Plug 'sickill/vim-pasta'                                                                              " context-aware pasting
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'                                                   " Snippets for vim.
Plug 'sjl/gundo.vim'                                                                                  " Visualize your vim undo tree.
"Plug 'sourcegraph/javascript-typescript-langserver', { 'do': 'npm install && npm run build' }         " Language server protocol for javascript.
"Plug 'tpope/vim-fugitive'                                                                             " Git wrapper for vim
Plug 'tpope/vim-repeat'                                                                               " Enable repeating supported plugin maps with `.`
Plug 'tpope/vim-surround'                                                                             " Quoting/parenthesizing made simple
"Plug 'vim-pandoc/vim-pandoc'                                                                          " Facilities to integrate Vim with the pandoc document converter
"Plug 'vim-pandoc/vim-pandoc-syntax'                                                                   " Standalone pandoc syntax module
"Plug 'vim-utils/vim-man'                                                                              " View man pages in vim. Grep for the man pages.

" Initialize plugin system
call plug#end()

let g:table_mode_corner="|"
let mapleader = ','

let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

""" <AUTOCMD Features> """
" When editing a file, always jump to the last cursor position
if has("autocmd")
    autocmd BufReadPost *
    \ if ! exists("g:leave_my_cursor_position_alone") |
    \     if line("'\"") > 0 && line ("'\"") <= line("$") |
    \         exe "normal g'\"" |
    \     endif |
    \ endif    
    autocmd FileType helpfile set nonumber                  " no line numbers when viewing help
    autocmd FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
    autocmd FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back
    autocmd BufRead,BufNewFile *.zrx,*.rx,*.rexx  setfiletype rexx
    "autocmd FileType cpp,c,java,sh,pl,py,php set autoindent
    "autocmd FileType cpp,c,java,sh,pl,py,php set smartindent
    "autocmd FileType cpp,c,java,sh,pl,py,php set cindent
    autocmd BufRead,BufNewFile *.txt  setfiletype txt
    autocmd BufRead,BufNewFile *.vcf  setfiletype txt
    autocmd BufWritePost *httpd*.conf,vhosts.conf !apachectl -t
    autocmd BufNewFile,BufRead modprobe.conf set syntax=modconf
    autocmd BufWritePost *.sh,*.py,*.pl,*.rb,*.rx,*.zrx,*.rexx !chmod +x %
    autocmd GUIEnter * set visualbell t_vb=                 " 
    """ Enable editing of gzipped files """
    "   read: set binary mode before reading the file
    "   uncompress text in buffer after reading
    "   write: compress file after writing
    "   append: uncompress file, append, compress file
    autocmd BufReadPre,FileReadPre      *.gz set bin
    autocmd BufReadPost,FileReadPost    *.gz '[,']!gunzip
    autocmd BufReadPost,FileReadPost    *.gz set nobin
    autocmd BufWritePost,FileWritePost  *.gz !mv <afile> <afile>:r
    autocmd BufWritePost,FileWritePost  *.gz !gzip <afile>:r
    autocmd FileAppendPre    *.gz !gunzip <afile>
    autocmd FileAppendPre    *.gz !mv <afile>:r <afile>
    autocmd FileAppendPost    *.gz !mv <afile> <afile>:r
    autocmd FileAppendPost    *.gz !gzip <afile>:r 
    "autocmd BufNewFile *.html 0r $VIMHOME/templates/html.tpl    " populate empty html files with a template
    "autocmd BufNewFile *.sh 0r $VIMHOME/templates/bash.tpl    " set up empty bash scripts
    "autocmd BufNewFile *.sh 0r $VIMHOME/templates/sh.tpl    " set up empty bash scripts
    " the above 3 lines can be replaced with the line below.  By naming the *.tpl files appropriately, the file extension will be used
    autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl 
    """ end gzip section """
    " set up views - remember cursor placement, folds, etc. when moving between multiple folders
    set viewdir=~/.vim/views/
    "autocmd BufWinLeave * mkview 
    "autocmd BufWinEnter * silent loadview
    " save and load sessions by default
    autocmd VimEnter * call LoadSession() 
    autocmd VimLeave * call SaveSession()
    function! SaveSession()
        execute 'mksession! $HOME/.vim/sessions/session.vim'
    endfunction
    function! LoadSession()
        if argc() == 0
            execute 'source $HOME/.vim/sessions/session.vim'
        endif
    endfunction
endif
""" </AUTOCMD Features> """

iabbrev timeloop echo "timing method X"<cr>time for ((i=1 ; i < 500 ; i++ )) ; do<cr>    command to run &> /dev/null<cr>done

syntax enable
let loaded_matchparen = 1
filetype on                " enable filetype detection

"set scrolloff=999         " keep cursor in the center of the screen, up/down arrows move the text
set nolist
set listchars=tab:>-,trail:·,eol:$                      " these two lines will make tabs and trailing spaces visible when requested
"set listchars=tab:\|\ ,trail:·,eol:<
set scrolloff=3            " how many lines you are allowed to get from the top/bottom of the screen before the text starts moving up/down
set t_ti= t_te=            " don't clear the screen when exiting a vi session
set noerrorbells           " get rid of any bell noises
set visualbell t_vb=       " stop the visual flash of the screen when a beep would happen
set nobackup
set backspace=indent,eol,start  " allow backspacing over indention, line breaks and insertion start
set whichwrap+=<,>,h,l     " backspace and cursor keys wrap to next/prev lines
set ruler                  " display the ruler
set ignorecase             " obvious
"set smarttab               " when on, a <tab> in front of a line inserts blanks according to 'shiftwidth'.  'tabstop' or 'softtabstop' is 
                           " used in other places.  A <BS> will delete a 'shiftwidth' worth of space at the start of the line.
set foldenable             " good for coding
set foldlevelstart=20
set foldmethod=marker      " folding based on markers
"set shiftround             " Round indent to multiple of 'shiftwidth'.  Applies to > and < commands
set expandtab              " Replaces tab with spaces
set mousehide              " gvim specific
set showcmd                " show incomplete commands
set showmode               " display what mode you are in
set showmatch              " show matching brackets
set hlsearch               " obvious - disabled from within a vi session by doing a simple :nohl
set history=1000           " by default, vim only remembers the last 20 commands and search patterns entered.
set wildmenu               " by default, pressing <TAB> in command mode will choose the first possible completion with no 
                           " indication of how many others there might be.
set wildmode=list:longest  " to have the completion behave similarly to a shell, i.e. complete only up to the point of ambiguity 
                           "(while still showing you what your options are), also add this line.
set guioptions+=c          " use console dialogs instead of popup dialogs for simple choices
set viminfo='1000,f1,<500,s10,h,%                       " remember some stuff after quiting vim, marks, registers, searches, buffer list
set dictionary+=$VIMDIR/wordlists/dict_words

nmap <silent> <leader>s :set nolist!<CR>        " by default whitespace will be hidden, but now it can be toggled with ,s. 

""""""""""""""""""""""""""""""""
" SecureCRT specific Changes
" option 1
"if !has("gui_running")
"  set t_Co=8
"  set t_Sf=^[[3%p1%dm
"  set t_Sb=^[[4%p1%dm
"endif

" option 2 - this did work pretty well
"if &term =~ "xterm"
"  if has("terminfo")
"    set t_Co=8
"    set t_Sf=^[[3%p1%dm
"    set t_Sb=^[[4%p1%dm
"  else
"    set t_Co=8
"    set t_Sf=^[[3%dm
"    set t_Sb=^[[4%dm
"  endif
"endif

" option 3 - didn't work well
"set t_Co=1

" option 4
" IMPORTANT: Uncomment one of the following lines to force
" using 256 colors (or 88 colors) if your terminal supports it
" but does not automatically use 256 colors by default.
"set t_Co=256
"set t_Co=88
"if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
"    \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
"    " Use the guicolorscheme plugin to makes 256-color or 88-color
"    " terminal use GUI colors rather than cterm colors.
"    runtime! plugin/guicolorscheme.vim
"    GuiColorScheme desert
"    "GuiColorScheme darkblue
"else
"    " For 8-color 16-color terminals or for gvim, just use the 
"    " regular :colorscheme command.
"    colorscheme desert
"    "colorscheme darkblue
"endif

"if has("gui_running")
"  syntax on
"  set hlsearch
"  colorscheme desert
"  set bs=2
"  set ai
"  set ruler
"endif


"""""""""""""""""""""""""""""""""

" uncomment the mapping keys if you have problems with the arrow keys
" map arrow keys
"map <ESC>[A     <Up>
"map <ESC>[B     <Down>
"map <ESC>[C     <Right>
"map <ESC>[D     <Left>
"imap <ESC>[A    <Up>
"imap <ESC>[B    <Down>
"imap <ESC>[C    <Right>
"imap <ESC>[D    <Left>                                

" ==== Version 7 related ====
if version >= 700 
    "set spell                    " turn on spell check
    set cul                      " highlight current line
    "set cursorcolumn             " highlight current column
    au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta 
    au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse 
    colorscheme desert
    "colorscheme darkblue
endif

"if has("gui_running")
    " See ~/.gvimrc
    "set guifont=Monospace\ 10  " use this font
    "set lines=40    " height = 50 lines
    "set columns=100        " width = 100 columns
    "set selectmode=mouse,key,cmd
"else
"endif

function InitBackupDir()
    let separator = "."
    let parent = $HOME .'/' . separator . 'vim/'
    let backup = parent . 'backup/'
    let tmp    = parent . 'tmp/'
    if exists("*mkdir")
        if !isdirectory(parent)
            call mkdir(parent)
        endif
        if !isdirectory(backup)
            call mkdir(backup)
        endif
        if !isdirectory(tmp)
            call mkdir(tmp)
        endif
    endif
    let missing_dir = 0
    if isdirectory(tmp)
        execute 'set backupdir=' . escape(backup, " ") . "/,."
    else
        let missing_dir = 1
    endif
    if isdirectory(backup)
        execute 'set directory=' . escape(tmp, " ") . "/,."
    else
        let missing_dir = 1
    endif
    if missing_dir
        echo "Warning: Unable to create backup directories: " . backup ." and " . tmp
        echo "Try: mkdir -p " . backup
        echo "and: mkdir -p " . tmp
        set backupdir=.
        set directory=.
    endif
endfunction
call InitBackupDir()    

"noremap <C-X> :set ft=sh<CR>i#!/bin/bash<CR><CR>#<CR># author:   Rick L. <ESC>:r!date<CR><ESC>0i# date:     <ESC>o#<CR># desc: <CR><CR>source /home/rickl/info/myprefs.cfg<CR><CR>main (){<CR><CR>}<CR><CR>main<CR><ESC>4ki
noremap <C-X> :set ft=sh<CR>i#!/bin/bash<CR><CR>######<CR># Author: Rick L.<CR># Date  :<CR># Info  :<CR>#<CR>######<CR><CR><CR>main (){<CR><CR>}<CR><CR>main<ESC>4ki
map W :wq!
map Q :q!

" MRU recent file plugin
" disable gvim functionality
let MRU_Add_Menu = 0 
let MRU_Max_Entries = 30
let MRU_Window_Height = 30

ab cl #-----------------------------------------

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   PLUGINS
"                                   "
"                                   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""
"  Ack  "
"  """""""""
if executable('ag')
          let g:ackprg = 'ag --vimgrep'
  endif

  """""""""
  "  Ale  "
  "  """""""""
  let g:ale_sign_error = '✗✗'
  let g:ale_sign_warning = '∆∆'
  highlight clear ALEErrorSign
  highlight clear ALEWarningSign

  """""""""""""
  "  Airline  "
  "  """""""""""""
"  if !exists('g:airline_symbols')
"            let g:airline_symbols = {}
"    endif
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tagbar#enabled = 1           " enable/disable tagbar integration >
    let g:airline#extensions#tabline#enabled = 1          " Enable the list of buffers
    let g:airline#extensions#tabline#buffer_min_count = 0 " configure the minimum number of buffers needed to show the tabline.
    let g:airline#extensions#branch#enabled = 1           " enable/disable fugitive/lawrencium integration
    let g:airline#extensions#branch#empty_message = ''    " change the text for when no branch is detected
    let g:airline#extensions#branch#use_vcscommand = 0    " do not use vcscommand.vim if available
    let g:airline_theme='one'                             " airline theme

    """"""""""""""""
    "  EasyMotion  "
    "  """"""""""""""""
    let g:EasyMotion_smartcase = 1                " Turn on case insensitive feature
    let g:EasyMotion_startofline = 0              " keep cursor colum when JK motion
    nmap <silent> s <Plug>(easymotion-overwin-f2)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    map <Leader>l <Plug>(easymotion-lineforward)
    map <Leader>h <Plug>(easymotion-linebackward)

    """"""""""""""""""
    "  EditorConfig  "
    "  """"""""""""""""""
    let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

    """""""""""""
    "  Extract  "
    "  """""""""""""
    let g:extract_useDefaultMappings = 0
    let g:extract_maxCount = 25
    let g:extract_loadDeoplete = 1
    " mappings for insert
    " imap <m-v> <Plug>(extract-completeReg)
    " imap <c-v> <Plug>(extract-completeList)
    "
    " """"""""""""""
    " "  Fugitive  "
    " """"""""""""""
    " nmap <silent><leader>gs :Gstatus<cr>
    " nmap <silent><leader>ge :Gedit<cr>
    " nmap <silent><leader>gr :Gread<cr>
    " nmap <silent><leader>gb :Gblame<cr>
    "
    " """""""""
    " "  FZF  "
    " """""""""
    " nmap <silent><leader>t :Files<cr>
    " nmap <silent><leader>a :Ag<cr>
    "
    " """"""""""""""""""""
    " "  LanguageClient  "
    " """"""""""""""""""""
    " " used on CTRL-X CTRL-U on insert mode
    " set completefunc=LanguageClient#complete
    " " on formatting
    " set formatexpr=LanguageClient_textDocument_rangeFormatting()
    "
    " nnoremap <silent> gh :call LanguageClient_textDocument_hover()<CR>
    " nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
    " nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
    " nnoremap <silent> gs :call
    " LanguageClient_textDocument_documentSymbol()<CR>
    " nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
    " let g:LanguageClient_autoStart = 1 " Automatically start language
    " servers.
    " let g:LanguageClient_loadSettings = 1 " Use an absolute configuration
    " path if you want system-wide settings 
    " let g:LanguageClient_settingsPath =
    " expand('~/.vim/cquery_settings.json')
    " let g:LanguageClient_serverCommands = {
    "     \ 'c': ['~/.vim/plugged/cquery/build/release/bin/cquery',
    "     '--log-file=/tmp/cq.log'],
    "         \ 'cpp': ['~/.vim/plugged/cquery/build/release/bin/cquery',
    "         '--log-file=/tmp/cq.log'],
    "             \ 'javascript': ['node',
    "             '~/.vim/plugged/javascript-typescript-langserver/lib/language-server-stdio'],
    "                 \ 'php': ['php',
    "                 '~/.vim/plugged/php-language-server/bin/php-language-server.php'],
    "                     \ 'puppet': ['bundle', 'exec', 'ruby',
    "                     '~/.vim/plugged/puppet-vscode/server/puppet-languageserver',
    "                     '--stdio', '--debug=/home/deop/puppet-lsp.log',
    "                     '--timeout=10', '-c'],
    "                         \ 'ruby': ['docker', 'run',
    "                         'mtsmfm/language_server-ruby'],
    "                             \ 'rust': ['rustup', 'run', 'nightly',
    "                             'rls'],
    "                                 \ }
    "
    "                                 """""""""""""""""""""""
    "  Markdown Composer  "
    "  """""""""""""""""""""""
    let g:markdown_composer_autostart = 0

    """"""""""""""
    "  NERDTree  "
    "  """"""""""""""
"    let NERDTreeWinSize = 30
"    let g:NERDTreeQuitOnOpen = 0
"    let NERDTreeShowHidden = 1

    """"""""""""
    "  Tagbar  "
    "  """"""""""""
    let g:tagbar_type_puppet = {
      \ 'ctagstype': 'puppet',
      \ 'kinds': [
        \'c:class',
        \'s:site',
        \'n:node',  
        \'d:definition',
        \'r:resource',
        \'f:default'
      \]
      \}

    """"""""""
    "  Tmux  "
    "  """"""""""
    let g:tmux_navigator_no_mappings = 1
    nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
    nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

    """""""""""""""
    "  UltiSnips  "
    "  """""""""""""""
    "let g:UltiSnipsExpandTrigger='<tab>'
    "let g:UltiSnipsListSnippets='<c-l>'
    "let g:UltiSnipsEditSplit='vertical'           " Open snips vertically
    "let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips' " Store snips in this
    "folder
    "
    """"""""""""
    "  Vimux  "
    "  """""""""""
    map <Leader>rb :call VimuxRunCommand('clear; rspec ' . bufname("%"))<CR> " Run the current file with rspec
    map <Leader>vp :VimuxPromptCommand<CR>                                   " Prompt for a command to run
    map <Leader>vl :VimuxRunLastCommand<CR>                                  " Run last command executed by VimuxRunCommand
    map <Leader>vi :VimuxInspectRunner<CR>                                   " Inspect runner pane
    map <Leader>vq :VimuxCloseRunner<CR>                                     " Close vim tmux runner opened by VimuxRunCommand
    map <Leader>vx :VimuxInterruptRunner<CR>                                 " Interrupt any command running in the runner pane
    map <Leader>vz :call VimuxZoomRunner()<CR>                               " Zoom the runner pane (use <bind-key> z to restore runner pane)

    " enable ncm2 for all buffer
    " autocmd BufEnter * call ncm2#enable_for_buffer()
    "
    " " note that must keep noinsert in completeopt, the others is optional
    " set completeopt=noinsert,menuone,noselect
    " inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
    " inoremap <Nul> <C-x><C-o> 
    " " wrap existing omnifunc
    " " Note that omnifunc does not run in background and may probably block
    " the
    " " editor. If you don't want to be blocked by omnifunc too often, you
    " could
    " " add 180ms delay before the omni wrapper:
    " "  'on_complete': ['ncm2#on_complete#delay', 180,
    " "               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
    " "au User Ncm2Plugin call ncm2#register_source({
    " "        \ 'name' : 'css',
    " "        \ 'priority': 9, 
    " "        \ 'subscope_enable': 1,
    " "        \ 'scope': ['css','scss'],
    " "        \ 'mark': 'css',
    " "        \ 'word_pattern': '[\w\-]+',
    " "        \ 'complete_pattern': ':\s*',
    " "        \ 'on_complete': ['ncm2#on_complete#omni',
    " 'csscomplete#CompleteCSS'],
    " "        \ })

" For YAML files    
" brew install yamllint
" add this to: ~/.config/yamllint/config - sans comments
"extends: relaxed
"
"rules:
"  line-length: disable
"
"
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'

" .............................................................................
" lambdalisue/fern.vim
" .............................................................................

" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

" Custom settings and mappings.
let g:fern#disable_default_mappings = 1

noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> k <Plug>(fern-action-mark-toggle)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

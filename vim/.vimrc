" https://github.com/dibayendu/dotfiles/blob/master/vim/.vimrc
" https://github.com/joedicastro/dotfiles/tree/master/vim
" https://github.com/spf13/spf13-vim

" ===================================================================================
" Environment
" ===================================================================================
" {
    " Basics
    " {
        set nocompatible        " Must be first line
        if !(has('win16') || has('win32') || has('win64'))
            set shell=/bin/sh
        endif
    " }

    " Windows Compatible
    " {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if has('win32') || has('win64')
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }

    " Setup Bundle Support
    " {
        " The next three lines ensure that the ~/.vim/bundle/ system works
        filetype on
        filetype off
        set rtp+=~/.vim/bundle/vundle
        call vundle#rc()
    " }
" }

" ===================================================================================
" Basic Settings
" ===================================================================================
" {
    syntax on                   " syntax highlighing

    "Colors are defined in /usr/share/vim/vim73/colors/
        "color elflord
        "color torte
        color ron

    filetype on                 " try to detect filetypes
    filetype plugin indent on   " enable loading indent file for filetype

    set background=dark         " We are using dark background in vim
    set title                   " show title in console title bar
    " set hidden                  " hide the inactive buffers
    set wildmenu                " Menu completion in command mode on <Tab>
    set wildmode=full           " <Tab> cycles between all matching choices.
    
    set noerrorbells            " don't bell or blink
    set vb t_vb=                " Disable all bells.  I hate ringing/flashing.

    " Ignore these files when completing
        set wildignore+=.git,*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
        set wildignore+=eggs/**
        set wildignore+=*.egg-info/**
        set wildignore+=*.sw?                            " Vim swap files
        set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
        set wildignore+=*.luac                           " Lua byte code
        set wildignore+=*.jar                            " java archives
        set wildignore+=*.stats                          " Pylint stats

    " Disable the colorcolumn when switching modes.  Make sure this is the
    " " first autocmd for the filetype here
    "autocmd FileType * setlocal colorcolumn=0

    " relative numbers and absolute numbers
    " {
        " set number            " line numbers
        autocmd FocusLost * :set number
        autocmd InsertEnter * :set number
        autocmd InsertLeave * :set relativenumber
        autocmd CursorMoved * :set relativenumber
    " }

    " For multi-byte character support (CJK support, for example):
        "set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1

    " Insert completion
    " don't select first item, follow typing in autocomplete
        set completeopt=menu,menuone,longest,preview
        set pumheight=6             " Keep a small completion window
        " set completeopt=menuone,longest,preview

    " Moving Around/Editing
        " set fillchars+=vert:│       " better looking for windows separator "
        set cursorline              " have a line indicate the cursor location
        set ruler                   " show the cursor position all the time
        set nostartofline           " Avoid moving cursor to BOL when jumping around
        set virtualedit=block       " Let cursor move past the last char in <C-v> mode
        set scrolloff=5            " Keep 5 context lines above and below the cursor
        set backspace=indent,eol,start " Allow backspacing autoindent, EOL, and BOL
        set showmatch               " Briefly jump to a paren once it's balanced
        " set nowrap                  " don't wrap text
        " set linebreak               " don't wrap textin the middle of a word
        set autoindent              " always set autoindenting on
        set smartindent             " use smart indent if there is no indent file
        set tabstop=4               " <tab> inserts 4 spaces 
        set shiftwidth=4            " but an indent level is 2 spaces wide.
        set softtabstop=4           " <BS> over an autoindent deletes both spaces.
        set expandtab ts=4 sw=4 ai  " Use spaces, not tabs, for autoindent/tab key.
        set shiftround              " rounds indent to a multiple of shiftwidth
        set matchpairs+=<:>         " show matching <> (html mainly) as well
        set foldmethod=indent       " allow us to fold on indents
        set foldlevel=99            " don't fold by default
        set formatoptions=c,q,r,t   " This is a sequence of letters which describes how
                                    " automatic formatting is to be done.
                                    "
                                    " letter    meaning when present in 'formatoptions'
                                    " ------    ---------------------------------------
                                    " c         Auto-wrap comments using textwidth, inserting
                                    "           the current comment leader automatically.
                                    " q         Allow formatting of comments with "gq".
                                    " r         Automatically insert the current comment leader
                                    "           after hitting <Enter> in Insert mode. 
                                    " t         Auto-wrap text using textwidth (does not apply
                                    "           to comments)

    " close preview window automatically when we move around
        autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif

    " Reading/Writing
        " set noautowrite             " Never write a file unless I request it.
        " set noautowriteall          " NEVER.
        " set noautoread              " Don't automatically re-read changed files.
        " set modeline                " Allow vim options to be embedded in files;
        " set modelines=5             " they must be within the first or last 5 lines.
        set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.
        " set virtualedit=all             " to edit where there is no actual character

    " Messages, Info, Status
        " set go-=T                   " hide the toolbar
        " set go-=m                   " hide the menu
        " set go+=rRlLbh              " show all the scrollbars
        " set go-=rRlLbh              " hide all the scrollbars
        set ls=2                    " allways show status line
        set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
        set confirm                 " Y-N-C prompt if closing with unsaved changes.
        set showcmd                 " Show incomplete normal mode commands as I type.
        set showmode                " Show current mode at the bottom
        set report=0                " : commands always print changed line count.
        set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
        set ruler                   " Show some info, even without statuslines.
        set laststatus=2            " Always show statusline, even if only 1 window.
        set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

    " Show hidden chars
    " displays tabs with :set list & displays when a line runs off-screen
        set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
        " set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
        "set list

    " Searching and Patterns
        " set ignorecase              " Default to using case insensitive searches,
        " set smartcase               " unless uppercase letters are used in the regex.
        set smarttab                " Handle tabs more intelligently 
        set hlsearch                " Highlight searches by default.
    set incsearch               " Incrementally search while typing a /regex

    """" Display
        if has("gui_running")
            " Remove menu bar
            set guioptions-=m
            
            " Remove toolbar
            set guioptions-=T
        endif

    set lazyredraw              " only redraws if it is needed
    set ttyfast                 " better screen redraw
    set splitright              " always split right
    set splitbelow              " always split below

    if has ('x') && has ('gui') " On Linux use + register for copy-paste
        set clipboard=unnamedplus
    elseif has ('gui')          " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif

    " set clipboard=unnamed       "copies the yank lines in clipboard
    set nocompatible
    set copyindent              " copy the previous indentation on autoindenting
    scriptencoding utf-8
    set encoding=utf-8          " setup the encoding to UTF-8
    set t_Co=256                " set colour over terminals
    set ttymouse=xterm2         " Name of your terminal that supports mouse codes.
    set bs=indent,eol,start     " Allow backspacing over everything in insert mode
    set mouse=a                 " Vim now has mouse support
    set mousehide               " Hide the mouse cursor while typing "
    set history=1000            " keep 1000 lines of command line history
    " set undofile
    " set undoreload=1000
    set autoread
    set wildmode=list:full
    set wildmode=list:longest,full

    " resizing vim window for scrolling
        au VimEnter * if line('$') > &lines | set go+=r | else | set go-=r | endif
        au VimResized * if line('$') > &lines | set go+=r | else | set go-=r | endif

    " highlighting colour of tabs
        " hi TabLine ctermfg=white ctermbg=white cterm=NONE
        hi TabLineFill ctermfg=grey ctermbg=white cterm=NONE
        " hi TabLineSel ctermfg=black ctermbg=green cterm=NONE
        hi TabLineSel ctermfg=green ctermbg=black term=bold
        " hi TabLineSel term=bold cterm=bold
        " hi TabLineFill term=reverse cterm=reverse 
        " hi TabLine term=underline cterm=underline ctermfg=15 ctermbg=242

    " Backups
    " {
        " set backup
        " set noswapfile
        " set backupdir=$HOME/.vim/tmp/backup/
        " set undodir=$HOME/.vim/tmp/undo/
        " set directory=$HOME/.vim/tmp/swap/
        " set viminfo+=n$HOME/.vim/tmp/viminfo

        " " make this dirs if no exists previously
        " silent! call MakeDirIfNoExists(&undodir)
        " silent! call MakeDirIfNoExists(&backupdir)
        " silent! call MakeDirIfNoExists(&directory)
    " }
    
    " Ok, a vim for men, get off the cursor keys
    " {
        " nnoremap <up> <nop>
        " nnoremap <down> <nop>
        " nnoremap <left> <nop>
        " nnoremap <right> <nop>
        " inoremap <up> <nop>
        " inoremap <down> <nop>
        " inoremap <left> <nop>
        " inoremap <right> <nop>
    " }

    " Resize the divisions if the Vim window size changes
        " au VimResized * exe "normal! \<c-w>="

" }

" ===================================================================================
" Inbuilt plugins
" ===================================================================================
" {
    set omnifunc=syntaxcomplete#Complete
    " set completeopt-=preview
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType json set autoindent 
    autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c set omnifunc=ccomplete#Complete
    autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

    autocmd FileType cpp,c,ruby,python,java,php let g:easytags_include_members=1
    " the bottom two lines sets the spaces and tabs for specific file types
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noet

" }

" ===================================================================================
" External plugins
" ===================================================================================
" {
    " Align                 " http://www.vim.org/scripts/script.php?script_id=294
    " Pathogen              " https://github.com/tpope/vim-pathogen 
    " Command-T             " https://github.com/wincent/Command-T
    " FuzzyFinder           " https://github.com/vim-scripts/FuzzyFinder
    " L9                    " http://www.vim.org/scripts/script.php?script_id=3252
    " YouCompleteMe         " https://github.com/Valloric/YouCompleteMe
    " ack.vim               " https://github.com/mileszs/ack.vim 
    " conqueterm-vim        " https://code.google.com/p/conque/
    " ctrlp.vim             " https://github.com/kien/ctrlp.vim
    " gundo.vim             " https://github.com/sjl/gundo.vim
    " indentLine            " https://github.com/Yggdroot/indentLine
    " mru.vim               " https://github.com/vim-scripts/mru.vim
    " nerdtree              " https://github.com/scrooloose/nerdtree
    " phpcomplete.vim       " https://github.com/shawncplus/phpcomplete.vim
    " syntastic             " https://github.com/scrooloose/syntastic
    " taglist               " https://github.com/vim-scripts/taglist.vim
    " tComment              " https://github.com/tomtom/tcomment_vim
    " tlib_vim              " https://github.com/vim-scripts/tlib
    " vim-addon-mw-utils    " https://github.com/MarcWeber/vim-addon-mw-utils
    " vim-ariline           " https://github.com/bling/vim-airline
    " vim-buffer-explorer-plugin " http://www.vim.org/scripts/script.php?script_id=42
    " vim-fugitive          " https://github.com/tpope/vim-fugitive
    " vim-haml              " https://github.com/tpope/vim-haml
    " vim-javascript        " https://github.com/pangloss/vim-javascript
    " vim-rails             " https://github.com/tpope/vim-rails/tree/master/doc
    " vim-ruby              " https://github.com/vim-ruby/vim-ruby
    " vim-scriptease        " https://github.com/tpope/vim-scriptease
    " vim-sensible          " https://github.com/tpope/vim-sensible
    " vim-snipmate          " https://github.com/garbas/vim-snipmate
    " vim-snippets          " https://github.com/honza/vim-snippets
    " vim-surround          " https://github.com/tpope/vim-surround
    " vim-visual-star-search " https://github.com/bronson/vim-visual-star-search
    " xmledit               " https://github.com/sukima/xmledit/
    " vim-cucumber          " https://github.com/tpope/vim-cucumber
    " vim-endwise           " https://git@github.com:tpope/vim-endwise
    " html5.vim             " https://github.com/othree/html5.vim
    " vim-markdown          " https://github.com/plasticboy/vim-markdown
    " vim-ragtag            " https://github.com/tpope/vim-ragtag
    " vim-bundler           " https://github.com/tpope/vim-bundler
    " vim-buffergator       " https://github.com/jeetsukumaran/vim-buffergator
    " vim-coffee-script     " https://github.com/kchmck/vim-coffee-script
    " vim-jquery            " https://github.com/itspriddle/vim-jquery
    " vim-nerd-tree-tabs    " https://github.com/jistr/vim-nerdtree-tabs
    " tagbar                " https://github.com/majutsushi/tagbar
    " jedi-vim              " https://github.com/davidhalter/jedi-vim
    " vim-easymotion        " https://github.com/Lokaltog/vim-easymotion
    " vim-colors-solarized  " git://github.com/altercation/vim-colors-solarized.git    
    " neocomplcache.vim     " https://github.com/Shougo/neocomplcache.vim
    " neosnippet.vim        " https://github.com/Shougo/neosnippet.vim
    " vim-autoclose         " https://github.com/Townk/vim-autoclose
    " undotree              " https://github.com/mbbill/undotree
    " tabular               " https://github.com/godlygeek/tabular
    " vim-repeat            " https://github.com/tpope/vim-repeat
    " vim-dispatch          " https://github.com/tpope/vim-dispatch
    " vim-abolish           " https://github.com/tpope/vim-abolish
    " vim-multiple-cursors  " https://github.com/terryma/vim-multiple-cursors
    " PIV                   " https://github.com/spf13/PIV
    " vim-php-namespace     " https://github.com/arnaud-lb/vim-php-namespace
    " checksyntax_vim       " https://github.com/tomtom/checksyntax_vim
 " not installed   " python-mode           " https://github.com/klen/python-mode
    " vim-json              " https://github.com/elzr/vim-json
    " vim-less              " https://github.com/groenewege/vim-less
    " vim-jst               " https://github.com/briancollins/vim-jst
    " vim-css3-syntax       " https://github.com/hail2u/vim-css3-syntax
    " vim-ruby-refactoring  " https://github.com/ecomba/vim-ruby-refactoring
    " coveragepy.vim        " https://github.com/alfredodeza/coveragepy.vim
    " DirDiff.vim           " https://github.com/joedicastro/DirDiff.vim
    " emmet-vim             " https://github.com/mattn/emmet-vim
    " gitv                  " https://github.com/gregsexton/gitv
    " JSON.vim              " https://github.com/vim-scripts/JSON.vim
    " vim-tmux              " https://github.com/vimez/vim-tmux
    " neobundle.vim         " https://github.com/Shougo/neobundle.vim
" not installed    " neocomplete           " https://github.com/Shougo/neocomplete.vim cause it requires vim to compile with +lua
" not installed    " ultisnips             " https://github.com/SirVer/ultisnips
    " unite.vim             " https://github.com/Shougo/unite.vim
    " unite-outline         " https://github.com/Shougo/unite-outline
    " vim-characterize      " https://github.com/tpope/vim-characterize
    " vim-abolish           " https://github.com/tpope/vim-abolish
    " vim-repeat            " https://github.com/tpope/vim-repeat
    " vim-virtualenv        " https://github.com/jmcantrell/vim-virtualenv

    " PATHOGEN NEEDS TO BE LOADED FIRST
    " Pathogen
    " {
        " USING pathogen PACKAGE MANAGER
        " this command bundles all the vim plugins in the package manager "pathogem=n"
        " Load pathogen with docs for all plugins
        " uses bundle to manage plugins

        filetype off

        call pathogen#infect()
        execute pathogen#infect() 
        call pathogen#incubate()
        call pathogen#helptags()

        filetype on                 " try to detect filetypes
        filetype plugin indent on
        syntax on
    " }

    " PIV {
        let g:DisableAutoPHPFolding = 0
        let g:PIVAutoClose = 0
    " }

    " JSON.vim
    " {
        au! BufRead,BufNewFile *.json set filetype=json 
    " }

    " vim-rails
    " {
        autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
        autocmd FileType ruby,eruby let g:rubycomplete_rails=1
        autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
    " }

    " vim-multiple-cursors
    " {
        let g:multi_cursor_use_default_mapping=0
        let g:multi_cursor_exit_from_visual_mode=1
        let g:multi_cursor_exit_from_insert_mode=1
    " }

    " vim-autoclose
    " {
        let g:AutoClosePairs = "() [] {} \" \'"
        let g:AutoClosePairs_add = "<> |"
        let g:AutoCloseProtectedRegions = ["Comment", "String", "Character"]
    " }

    " YouCompleteMe plugin
    " {
        let g:ycm_confirm_extra_conf=''
        let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
        let g:ycm_complete_in_comments=0
        let g:ycm_complete_in_strings=0
        let g:ycm_collect_identifiers_from_comments_and_strings=0
        let g:ycm_min_num_of_chars_for_completion=1
        let g:ycm_register_as_syntastic_checker=1
        let g:ycm_filepath_completion_use_working_dir=1
        let g:ycm_cache_omnifunc=1
        let g:ycm_key_invoke_completion='<C-Space>'
        let g:ycm_autoclose_preview_window_after_completion=1
        " let g:ycm_autoclose_preview_window_after_insertion=1
        let g:ycm_add_preview_to_completeopt=1
        let g:ycm_collect_identifiers_from_tags_files=1
        let g:ycm_seed_identifiers_with_syntax=1
        let g:ycm_key_list_select_completion=['<TAB>', '<Down>']
        let g:ycm_key_list_previous_completion=['<S-TAB>', '<Up>']
        let g:ycm_semantic_triggers= {
          \   'c' : ['->', '.'],
          \   'objc' : ['->', '.'],
          \   'ocaml' : ['.', '#'],
          \   'cpp,objcpp' : ['->', '.', '::'],
          \   'perl' : ['->'],
          \   'php' : ['->', '::'],
          \   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
          \   'ruby' : ['.', '::'],
          \   'lua' : ['.', ':'],
          \   'erlang' : [':'],
          \ }
    " }

    " neosnippet.vim
    " {
        " Plugin key-mappings.
        imap <C-k>     <Plug>(neosnippet_expand_or_jump)
        smap <C-k>     <Plug>(neosnippet_expand_or_jump)
        xmap <C-k>     <Plug>(neosnippet_expand_target)

        " SuperTab like snippets behavior.
        " imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        "     \ "\<Plug>(neosnippet_expand_or_jump)"
        "     \: pumvisible() ? "\<C-n>" : "\<TAB>"
        " smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        "     \ "\<Plug>(neosnippet_expand_or_jump)"
        "     \: "\<TAB>"

        " For snippet_complete marker.
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif

        " Enable snipMate compatibility feature.
        let g:neosnippet#enable_snipmate_compatibility = 1
        let g:neosnippet#enable_preview = 1

        " Tell Neosnippet about the other snippets
        let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
    " }

    " newcomplcache
    " {
        " this plugin might have problem while moving inside markdown in insert mode
        let g:neocomplcache_enable_at_startup = 1
        " Use smartcase.
        let g:neocomplcache_enable_smart_case = 1
        " Set minimum syntax keyword length.
        let g:neocomplcache_min_syntax_length = 1
        let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
        " Define dictionary.
        let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
                \ }
        " Define keyword.
        if !exists('g:neocomplcache_keyword_patterns')
            let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

        " Plugin key-mappings.
        inoremap <expr><C-g>     neocomplcache#undo_completion()
        inoremap <expr><C-l>     neocomplcache#complete_common_string()
        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
        return neocomplcache#smart_close_popup() . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        endfunction
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        " inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        " inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><C-e>  neocomplcache#cancel_popup()
        
        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
            let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

        " For perlomni.vim setting.
        " https://github.com/c9s/perlomni.vim
        let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    " }

    " vim-colors-solarized
    " {
        let &t_Co=256
        let g:solarized_termcolors=256
        set background=dark
        colorscheme solarized
        if has('gui_running')
            set background=light
        else
            set background=dark
        endif
        syntax enable                   " syntax highlighing
        let g:solarized_termtrans=1
        let g:solarized_contrast="high"
        let g:solarized_visibility="high"
    " }

    " vim-easymotion
    " {
        let g:EasyMotion_leader_key='<Leader>'
    " }

    " jedi-vim
    " {
        let g:jedi#autocompletion_command="<C-Space>"
        let g:jedi#popup_select_first=0
    " }

    " tagbar
    " {
        let g:tagbar_left=0
        " let g:tagbar_width=30
        " let g:tagbar_autoclose=1
        " let g:tagbar_autofocus=1
        let g:tagbar_sort=0
        let g:tagbar_indent=1
        let g:tagbar_show_visibility=1
        let g:tagbar_iconchars=['▶', '▼']
        let g:tagbar_autoshowtag=0
        " uncomment the line below to open tagbar automatically
        " autocmd BufEnter * nested :call tagbar#autoopen(0)

        " autocmd VimEnter * nested :call tagbar#autoopen(1)
        " autocmd FileType * nested :call tagbar#autoopen(0)
    " }

    " vim-nerd-tree-tabs
    " {
        let g:nerdtree_tabs_open_on_console_startup=1
        let g:nerdtree_tabs_no_startup_for_diff=1
        let g:nerdtree_tabs_smart_startup_focus=2
        let g:nerdtree_tabs_open_on_new_tab=1
        let g:nerdtree_tabs_meaningful_tab_names=1
        let g:nerdtree_tabs_autoclose=1
        let g:nerdtree_tabs_synchronize_view=1
        let g:nerdtree_tabs_synchronize_focus=1
        let g:nerdtree_tabs_focus_on_files=1
    " }

    " vim-markdown
    " {
        let g:vim_markdown_folding_disabled=1
    " }

    " vim-coffee-script
    " {
        au BufWritePost *.coffee silent CoffeeMake!
    " }

    " ragtag
    " {
        let g:ragtag_global_maps=1
    " }

    " taglist
    " {
        " let Tlist_Auto_Highlight_Tag=0
        let Tlist_Auto_Open=0             " TListToggle is open when a file is open
        let Tlist_Use_Right_Window=1
        let Tlist_Exit_OnlyWindow=1
        " let Tlist_Show_One_File=1
        " let Tlist_Sort_Type="name"
        " let Tlist_Display_Prototype=1
        " let Tlist_GainFocus_On_ToggleOpen=1
        " let Tlist_Use_SingleClick=1
        " let Tlist_WinHeight=20
        " let Tlist_WinWidth=20
    " }

    " vim-ariline
    " {
        " let g:airline_powerline_fonts=1
        " let g:Powerline_symbols='fancy'
    " }

    " Command-t
    " {
        " let g:CommandTMaxHeight=10
    " }

    " indentLine plugin
    " {
        let g:indent_guides_enable_on_vim_startup=1
        let g:indentLine_color_term=239
        let g:indentLine_char='|'
    " }

    " syntastic vim
    " {
        let g:syntastic_disabled_filetypes=['html' , 'php']
        let g:syntastic_php_checkers=['php']
            " the line below checks for styling and other unnecessary syntax checkers
            " let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
        let g:syntastic_error_symbol='✗'
        let g:syntastic_warning_symbol='⚠'
        "let g:syntastic_enable_highlighting=0
        "let g:syntastic_auto_loc_list=1
    " }
    
    " NERDTree
    "{
        "ingoring python compiled files to show in tree
        let NERDTreeIgnore=['\.pyc$']
    "}

    " CtrlP
    " {
        let g:ctrlp_map='<c-p>'
        let g:ctrlp_cmd='CtrlP'
    " }

    " xmledit
    " {
        " let xml_tag_completion_map="<C-l>"
        " let xml_tag_syntax_prefixes='html\|xml\|xsl\|docbk'
        " let xml_no_auto_nesting=1
        " let xml_use_xhtml=1
    " }

" }

" ===================================================================================
" Shortcuts
" ===================================================================================
" {
    let mapleader=","

    " Easier horizontal scrolling
        map zl zL
        map zh zH

    " Toggle folding
        nnoremap \ za
        vnoremap \ za

    " Hide hidden characters
        nmap <Leader>eh :set list!<CR>

    " Spelling
    " {
        " turn on the spell checking and set the Spanish language
            nmap <Leader>ss :setlocal spell spelllang=es<CR>
        " turn on the spell checking and set the English language
            nmap <Leader>se :setlocal spell spelllang=en<CR>
        " turn off the spell checking
            nmap <Leader>so :setlocal nospell <CR>
        " jump to the next bad spell word
            nmap <Leader>sn ]s
        " suggest words
            nmap <Leader>sp z=
        " jump to the next bad spell word and suggests a correct one
            nmap <Leader>sc ]sz=
        " add word to the dictionary
            nmap <Leader>sa zg
    " }

    " Delete trailing whitespaces
        nmap <silent><Leader>et :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

    " pressing F2 after opening a file in vim, converts all tabs to number of spaces tabstop has
        map<F2> :retab <CR> :w <CR>

    " Toggle the search results highlighting
        map <silent><Leader>eq :set invhlsearch<CR>

    " mapping the commands
    " {
        command! Q q " Bind :Q to :q
        command! Qa qa " all files in buffer
        command! W w " Bind :W to :w
        command! Wa wa " all files in buffer
    " }

    " mapping vim keys with consistent keys across most applications
    " nmap <C-h> :nohl<cr> " no highlighting
    imap <C-l> :<Space>
    nmap <C-s> <esc><esc>:wa<CR>  " save all buffers
    imap <C-s> <esc><esc>:wa<CR>
    "nmap <C-w> <esc>:q<CR>   " quit current buffer , CAREFULL used to move between windows
    "imap <C-w> <esc>:q<CR>
    nmap <Leader>w <esc>:q<CR>   " quit current buffer , CAREFULL used to move between windows
    nmap <C-q> <esc>:q<CR>  " quit current buffer
    imap <C-q> <esc>:q<CR>
    nmap <C-t> <esc>:tabnew<CR>  " open a new tab
    nmap <C-n> :cn<CR>
    nmap <C-p> :cp<CR>

    " COMMENTED OUT MAPS
        nmap <C-S-]> <esc><esc>gt
        nmap <C-S-[> <esc><esc>gT
        nmap <C-1> <esc><esc>1gt
        nmap <C-2> <esc><esc>2gt
        nmap <C-3> <esc><esc>3gt
        nmap <C-4> <esc><esc>4gt
        nmap <C-5> <esc><esc>5gt
        nmap <C-6> <esc><esc>6gt
        nmap <C-7> <esc><esc>7gt
        nmap <C-8> <esc><esc>8gt
        nmap <C-9> <esc><esc>9gt
        nmap <C-0> <esc><esc>:tablast<CR>

    " These mappings make j and k move down and up by display lines, while gj and
    " gk would move down and up by real lines
    " {
        nnoremap k gk
        nnoremap gk k
        nnoremap j gj
        nnoremap gj j
    " }

    " mapping to move between split screens, default <C-w> + <C-[hjkl]>
    " if the controls below are enabled, Fuzzy-Finder commands need to be reamapped
        " map <C-h> :wincmd h<CR>
        " map <C-j> :wincmd j<CR>
        " map <C-k> :wincmd k<CR>
        " map <C-l> :wincmd l<CR>
        " nnoremap <C-h> <C-w>h
        " nnoremap <C-j> <C-w>j
        " nnoremap <C-k> <C-w>k
        " nnoremap <C-l> <C-w>l


    " CommandT keys
        " map <Leader>t :CommandT ~/projects/<CR>

    " :FufFile keys (Ctrlp plugin)
        map <Leader>f :FufFile ~/projects/<CR>

    " snipmate trigger is now space
    " {
        imap <C-j> <Plug>snipMateNextOrTrigger
        " imap <C-k> <Plug>snipMateBack
        " imap <C-l> <Plug>snipMateShow
        " imap <C-;> <Plug>snipMateVisual
    " }

    " YouCompleteMe
    " {
        nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
    " }
    
    " Gundo vim
    " {
        nnoremap <F6> :GundoToggle<CR>
    " }

" }

" ===================================================================================
" functions for VIM
" ===================================================================================
" {

   " RENAME CURRENT FILE (thanks Gary Bernhardt)
   " {
        function! RenameFile()
            let old_name=expand('%')
            let new_name=input('New file name: ', expand('%'), 'file')
            if new_name != '' && new_name != old_name
                exec ':saveas ' . new_name
                exec ':silent !rm ' . old_name
                redraw!
            endif
        endfunction
        " map <Leader>n :call RenameFile()<cr>
    " }
   
   " Merge a tab into a split in the previous window
   " {
        function! MergeTabs()
            if tabpagenr() == 1
                return
            endif
            let bufferName=bufname("%")
            if tabpagenr("$") == tabpagenr()
                close!
            else
                close!
                tabprev
            endif
            split
            execute "buffer " . bufferName
        endfunction
        " nmap <C-W>u :call MergeTabs()<CR>
   " }

    " Make a dir if no exists
    " {
        function! MakeDirIfNoExists(path)
            if !isdirectory(expand(a:path))
                call mkdir(expand(a:path), "p")
            endif
        endfunction
    " }

" }


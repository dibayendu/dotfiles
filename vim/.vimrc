" https://github.com/dibayendu/dotfiles/blob/master/vim/.vimrc

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
    set wildmenu                " Menu completion in command mode on <Tab>
    set wildmode=full           " <Tab> cycles between all matching choices.
    
    set noerrorbells            " don't bell or blink
    set vb t_vb=                " Disable all bells.  I hate ringing/flashing.

    " Ignore these files when completing
    set wildignore+=.git,*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
    set wildignore+=eggs/**
    set wildignore+=*.egg-info/**

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

    " Insert completion
    " don't select first item, follow typing in autocomplete
    set completeopt=menu,menuone,longest
    set pumheight=6             " Keep a small completion window
    " set completeopt=menuone,longest,preview

    " Moving Around/Editing
    set cursorline              " have a line indicate the cursor location
    set ruler                   " show the cursor position all the time
    set nostartofline           " Avoid moving cursor to BOL when jumping around
    set virtualedit=block       " Let cursor move past the last char in <C-v> mode
    set scrolloff=10            " Keep 10 context lines above and below the cursor
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
    " set foldmethod=indent       " allow us to fold on indents
    set foldlevel=99            " don't fold by default

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

    " Messages, Info, Status
    set ls=2                    " allways show status line
    set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
    set confirm                 " Y-N-C prompt if closing with unsaved changes.
    set showcmd                 " Show incomplete normal mode commands as I type.
    set report=0                " : commands always print changed line count.
    set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
    set ruler                   " Show some info, even without statuslines.
    set laststatus=2            " Always show statusline, even if only 1 window.
    set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

    " displays tabs with :set list & displays when a line runs off-screen
    set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
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

    set clipboard=unnamed       "copies the yank lines in clipboard
    set nocompatible
    set copyindent              " copy the previous indentation on autoindenting
    set encoding=utf-8
    set t_Co=256                " set colour over terminals
    set ttymouse=xterm2         " Name of your terminal that supports mouse codes.
    set bs=indent,eol,start     " Allow backspacing over everything in insert mode
    set mouse=a                 " Vim now has mouse support
    set history=500             " keep 500 lines of command line history
    set autoread
    set wildmode=list:full
    set wildmode=list:longest,full

" }

" ===================================================================================
" Inbuilt plugins
" ===================================================================================
" {
    set omnifunc=syntaxcomplete#Complete
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c set omnifunc=ccomplete#Complete
    autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
    autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
    autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
    autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

    autocmd FileType cpp,c,ruby,python,java,php let g:easytags_include_members = 1
    " the bottom two lines sets the spaces and tabs for specific file types
    " autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
    " autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noet

" }

" ===================================================================================
" External plugins
" ===================================================================================
" {
    " external vim plugins
    " {
        " USING pathogen PACKAGE MANAGER
        " this command bundles all the vim plugins in the package manager "pathogem=n"
        " Load pathogen with docs for all plugins
        " uses bundle to manage plugins
        execute pathogen#infect() 
        call pathogen#incubate()
        call pathogen#helptags()
    " }

" }

" ===================================================================================
" Shortcuts
" ===================================================================================
" {
    let mapleader = ","

    " pressing F2 after opening a file in vim, converts all tabs to number of spaces tabstop has
    map<F2> :retab <CR> :w <CR>

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
    nmap <C-s> <esc>:wa<CR>  " save all buffers
    imap <C-s> <esc>:wa<CR>
    "nmap <C-w> <esc>:q<CR>   " quit current buffer , CAREFULL used to move between windows
    "imap <C-w> <esc>:q<CR>
    nmap <Leader>w <esc>:q<CR>   " quit current buffer , CAREFULL used to move between windows
    nmap <C-q> <esc>:q<CR>  " quit current buffer
    imap <C-q> <esc>:q<CR>
    nmap <C-t> <esc>:tabnew<CR>  " open a new tab
    nmap <C-n> :cn<CR>
    nmap <C-p> :cp<CR>

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


    " mapping :CommandT keys
        map <Leader>t :CommandT ~/projects/<CR>

    " mapping :FufFile keys
        map <Leader>f :FufFile ~/projects/<CR>

    " YouCompleteMe plugin
    " {
        let g:ycm_confirm_extra_conf = ''
        let g:ycm_global_ycm_extra_conf = '.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
        let g:ycm_complete_in_comments = 0
        let g:ycm_complete_in_strings = 0
        let g:ycm_collect_identifiers_from_comments_and_strings = 0
        let g:ycm_min_num_of_chars_for_completion = 1
        let g:ycm_register_as_syntastic_checker = 1
        let g:ycm_cache_omnifunc = 1
        let g:ycm_key_invoke_completion = '<C-Space>'
    " }

    " snipmate trigger is now space
    " {
        imap <C-j> <Plug>snipMateNextOrTrigger
        imap <C-k> <Plug>snipMateBack
        imap <C-l> <Plug>snipMateShow
        imap <C-;> <Plug>snipMateVisual
    " }

    " the code below enables indent_guides plugin
    " {
        let g:indent_guides_enable_on_vim_startup=1
        let g:indentLine_color_term = 239
        let g:indentLine_char = '|'
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
    
    "NERDTree
    "{
        "ingoring python compiled files to show in tree
        let NERDTreeIgnore = ['\.pyc$']
    "}

    " resizing vim window for scrolling
        au VimEnter * if line('$') > &lines | set go+=r | else | set go-=r | endif
        au VimResized * if line('$') > &lines | set go+=r | else | set go-=r | endif

" }

" ===================================================================================
" functions for VIM
" ===================================================================================
" {

   " RENAME CURRENT FILE (thanks Gary Bernhardt)
   " {
        function! RenameFile()
            let old_name = expand('%')
            let new_name = input('New file name: ', expand('%'), 'file')
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
            let bufferName = bufname("%")
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

" }


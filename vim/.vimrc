" Syntax color will be on for most languages
syntax on

"Colors are defined in /usr/share/vim/vim73/colors/
color ron
"color elflord
"color torte


" ------------------------ enable inbuilt plugins in vim  ----------------------------------
" {
    filetype on
    filetype plugin on
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

    filetype indent on
" }
" ------------------------ END enable inbuilt plugins in vim  ----------------------------------


" ------------------------ enable vim settings  ----------------------------------
" {
    " set number      " line numbers
    autocmd FocusLost * :set number
    autocmd InsertEnter * :set number
    autocmd InsertLeave * :set relativenumber
    autocmd CursorMoved * :set relativenumber
    
    """ Insert completion
    " don't select first item, follow typing in autocomplete
    " set completeopt=menuone,longest,preview
    set completeopt=menu,menuone,longest
    set pumheight=6             " Keep a small completion window

    " set noerrorbells " don't bell
    " set linebreak " don't wrap textin the middle of a word
    " set foldmethod=indent " allow us to fold on indents
    set clipboard=unnamed  "copies the yank lines in clipboard
    set nocompatible
    set autoindent
    set copyindent    " copy the previous indentation on autoindenting
    set encoding=utf-8
    set smartindent
    set showmatch
    set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
    set title
    set hls
    set incsearch
    set t_Co=256    " set colour over terminals
    set ttymouse=xterm2 " Set this to the name of your terminal that supports mouse codes.
    set bs=indent,eol,start " Allow backspacing over everything in insert mode
    set mouse=a " Vim now has mouse support
    set history=500     " keep 500 lines of command line history
    set ruler       " show the cursor position all the time
    set autoread
    set wildmenu " Better? completion on command line
    set wildmode=list:full " What to do when I press 'wildchar'. Worth tweaking to see what feels right.
    set wildmode=list:longest,full
    set cursorline
    "set nowrap " does not wrap the text but with horizontal bars
    "set ic " ignore case while searching

    """" Reading/Writing
    " set noautowrite             " Never write a file unless I request it.
    " set noautowriteall          " NEVER.
    " set noautoread              " Don't automatically re-read changed files.
    " set modeline                " Allow vim options to be embedded in files;
    " set modelines=5             " they must be within the first or last 5 lines.
    " set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.
    
    """" Messages, Info, Status
    set ls=2                    " allways show status line
    set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
    set confirm                 " Y-N-C prompt if closing with unsaved changes.
    set showcmd                 " Show incomplete normal mode commands as I type.
    set report=0                " : commands always print changed line count.
    set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
    set ruler                   " Show some info, even without statuslines.
    set laststatus=2            " Always show statusline, even if only 1 window.
    set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

    " indenting codes with 4 space
    set tabstop=4 " tab = 4 spaces
    set shiftwidth=4
    set expandtab ts=4 sw=4 ai
    set backspace=indent,eol,start

    " pressing F2 after opening a file in vim, converts all tabs to number of spaces tabstop has
    map<F2> :retab <CR> :w <CR>

" }
" ------------------------ END enable vim settings  ----------------------------------


" ------------------------ mapping the commands ----------------------------------
" {
    command! Q q " Bind :Q to :q
    command! Qa qa " all files in buffer
    command! W w " Bind :W to :w
    command! Wa wa " all files in buffer
" }
" ------------------------ end mapping the commands ----------------------------------


" ------------------------ external vim plugins ----------------------------------
" {
    " USING pathogen PACKAGE MANAGER
    " this command bundles all the vim plugins in the package manager "pathogem=n"
    " Load pathogen with docs for all plugins
    " uses bundle to manage plugins
    filetype off
    execute pathogen#infect() 
    call pathogen#incubate()
    call pathogen#helptags()
" }
" ------------------------ END external vim plugins ----------------------------------


" ------------------------ mapping keys with vim ----------------------------------
" {
    let mapleader = ","

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
" ------------------------ END mapping keys with vim ----------------------------------


" ------------------------ functions for VIM ----------------------------------
" {

   " ------------------ RENAME CURRENT FILE (thanks Gary Bernhardt) ------------
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
   " ------------------ END RENAME CURRENT FILE (thanks Gary Bernhardt) ------------
   
   " ---------------- Merge a tab into a split in the previous window --------
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
   " ---------------- END Merge a tab into a split in the previous window --------

" }
" ------------------------ END functions for VIM ----------------------------------

if has("autocmd")
    autocmd FileType cpp,c,ruby,python,java,php let g:easytags_include_members = 1
    " the bottom two lines sets the spaces and tabs for specific file types
        " autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
        " autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noet
endif


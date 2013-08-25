/* ==================================================================================
    Command-T
================================================================================== */
{
    1.  <Leader>t               " Opens command-t in ~/projects/ directory
    
    2.  :CommandT               " Opens command-t in ~/ directory
    
    3.  :CommandT <directory>   " Opens command-t in ~/ directory

    4.  <Tab>                   " change focus to the prompt

    5.  <C-CR>                  " open the selected file in a new split window
        <C-s>                   " open the selected file in a new split window
        <C-v>                   " open the selected file in a new vertical split window
        <C-t>                   " open the selected file in a new tab

    6. <C-c>                    " close command-t
}

/* ==================================================================================
    Fuzzy-Finder
================================================================================== */
{
    1.  :FufFile                    " File mode (|fuf-file-mode|)
        :FufCoverageFile            " Coverage-File mode (|fuf-coveragefile-mode|)
        :FufDir                     " Directory mode (|fuf-dir-mode|)

    2.  <Leader>f                   " opens in ~/projects/

    3.  <esc> or :quit              " cancels fuzzy finder

    4.  <CR>  (|g:fuf_keyOpen|)        - opens in a previous window.
        <C-j> (|g:fuf_keyOpenSplit|)   - opens in a split window.
        <C-k> (|g:fuf_keyOpenVsplit|)  - opens in a vertical-split window.
        <C-l> (|g:fuf_keyOpenTabpage|) - opens in a new tab page.
}

/* ==================================================================================
   YouCompleteMe 
================================================================================== */
{
    1.  F5                          " recompiles file 
    2.  :YcmShowDetailedDiagnostic command
    3.  :YcmDebugInfo
    4.  <Tab>, <Up>, <Down> for selection
}

/* ==================================================================================
   ack.vim
================================================================================== */
{
    1.  :Ack [options] {pattern} [{directory}]
    2. :h Ack           " help ack vim
    3.  o               " to open (same as enter)
    4.  go              " to preview file (open but maintain focus on ack.vim results)
    5.  t               " to open in new tab
    6.  T               " to open in new tab silently
    7.  h               " to open in horizontal split
    8.  H               " to open in horizontal split silently
    9.  v               " to open in vertical split
    10. gv              " to open in vertical split silently
    11. q               " to close the quickfix window
}

/* ==================================================================================
   ConqueTerm 
================================================================================== */
{
    1.  :ConqueTermSplit <command>      " command can be bash or shell 
    2.  :ConqueTermVSplit <command>
    3.  :ConqueTermTab <command> 
    4.  :ConqueTerm <command>
}

/* ==================================================================================
   CtrlP
================================================================================== */
{
    1.  <C-P>                           " :CtrlP or :CtrlP [starting-directory]
    2.  :CtrlPBuffer or :CtrlPMRU
    3.  Run :CtrlPMixed to search in Files, Buffers and MRU files at the same time.
    4.  :help ctrlp-commands and :help ctrlp-extensions
    5.  <c-r> to switch to regexp mode.
    6.  <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split
}

/* ==================================================================================
   Gundo Vim
================================================================================== */
{
    1.  F6                          " :GundoToggle
}

/* ==================================================================================
   MRU
================================================================================== */
{
    1.  :MRU                            " '<Enter>' or 'v' or 'o' or 't'
    2.  'o' key to open the file name under the cursor in the MRU window new window
    3.  MRU window in read-only mode (view), press the 'v' key
    4.  open in tab 't'
}

/* ==================================================================================
   NerdTree
================================================================================== */
{
    1.  Press '?'                       " to see help functions
}

/* ==================================================================================
   Syntastic Vim
================================================================================== */
{
    1.  SyntasticCheck
    2.  SyntasticInfo
    3.  SyntasticToggleMode
}

/* ==================================================================================
   tComment
================================================================================== */
{
    In Normal mode:
        gc{motion}          ::  Toggle comments (for small comments within one line 
                                the &filetype_inline style will be used, if 
                                defined)
        gc<Count>c{motion}  :: Toggle comment text with count argument 
                        (see |tcomment#Comment()|)
        gcc                 :: Toggle comment for the current line
        gC{motion}          :: Comment region
        gCc                 :: Comment the current line

    In visual mode:

        gc                  :: Toggle comments
        gC                  :: Comment selected text
}

/* ==================================================================================
   Fugitive
================================================================================== */
{
    :Gwrite	            " :Git add % Stage the current file to the index

    :Gread              " :Git checkout % Revert current file to last checked in version

    :Gremove	        " :Git rm % Delete the current file and the corresponding Vim buffer

	:Gmove	            " :Git mv % Rename the current file and the corresponding Vim buffer

    :Gedit [revision]       |:edit| a |fugitive-revision|.

    :Gsplit [revision]      |:split| a |fugitive-revision|.

    :Gvsplit [revision]     |:vsplit| a |fugitive-revision|.

    :Gtabedit [revision]    |:tabedit| a |fugitive-revision|

    :Gpedit [revision]      |:pedit| a |fugitive-revision|

    :Gsdiff [revision]      Like |:Gdiff|, but split horizontally.

    :Gvdiff [revision]      Identical to |:Gdiff|.  For symmetry with |:Gsdiff|.

    :Gmove {destination}    

    :Gstatus                

    :Gcommit [args]         

    :Ggrep [args]           |:grep| with git-grep as 'grepprg'.

}

/* ==================================================================================
   Rails
================================================================================== */
{
    " Looks at rails.txt in the doc folder file
}

/* ==================================================================================
   Ruby
================================================================================== */
{
    " Looks at vim-ruby.txt in the doc folder file
}

/* ==================================================================================
   Scriptease
================================================================================== */
{
    " used to edit runtime files for debugging purposes.
    " Looks at scriptease.txt in the doc folder file
}

/* ==================================================================================
    Vim folding commands
================================================================================== */
{
    zi	switch folding on or off
    zv	expand folds to reveal cursor
    zj  move down to top of next fold
    zk  move up to bottom of previous fold
    zo  open current fold
    zO  recursively open current fold
    zc  close current fold
    zC  recursively close current fold
    za  toggle current fold
    zA  recursively open/close current fold
    zm  reduce `foldlevel` by one
    zM  close all folds
    zr  increase `foldlevel` by one
    zR  open all folds
}

/* ==================================================================================
    snipmate
================================================================================== */
{
    <C-j> <Plug>snipMateNextOrTrigger
    <C-k> <Plug>snipMateBack
    <C-l> <Plug>snipMateShow
    <C-;> <Plug>snipMateVisual


    Go through snippets folder to look for all the snippets
}

/* ==================================================================================
    surround
================================================================================== */
{
    1.  cs"'            " changes sentence surround " to '
    2.  cs'<q>          " change sentence surround ' to <q>
    4.  ds"             " removes the " in the whole sentence
    5.  ysiw] (iw is a text object) " changes " to ]
    6.  and add some space (use } instead of { for no space): cs]{
            e.g. { Hello }
    7.  yssb or yss)     " wrap the entire line in parentheses
    8.  ds{ds)           " Revert to the original text
    9.  ysaw"            " surround word with "
    10. ys$"             " surround till the end of the sentence with "
}

/* ==================================================================================
    visual-star-search
================================================================================== */
{
    This allows you to select some text using Vim's visual mode and then hit *
    and # to search for it elsewhere in the file.  For example, hit V, select
    a strange sequence of characters like "$! $!", and hit star.  You'll find
    all other runs of "$! $!" in the file.
}

/* ==================================================================================
    xmledit
================================================================================== */
{
    <LocalLeader>w
            Normal - Will clear the entire file of left over xml_jump_string garbage.
            * This will also happen automatically when you save the file. *

    <LocalLeader>x
            Visual - Place a custom XML tag to suround the selected text. You
            need to have selected text in visual mode before you can use this
            mapping. See |visual-mode| for details.

    <LocalLeader>.   or      <LocalLeader>>
            Insert - Place a literal '>' without parsing tag.

    <LocalLeader>5   or      <LocalLeader>%
            Normal or Visual - Jump to the begining or end tag.

    <LocalLeader>d
            Normal - Deletes the surrounding tags from the cursor. >
                <tag1>outter <tag2>inner text</tag2> text</tag1>
}

/* ==================================================================================
    xmledit
================================================================================== */
{
    :TlistToggle            " toggles code summary
}

/* ==================================================================================
    ragtag
================================================================================== */
{
    # html / xhtml tags auto completion

    <C-X>=        foo<%= ^ %>                               *ragtag-CTRL-X_=*
    <C-X>+        <%= foo^ %>                               *ragtag-CTRL-X_+*
    <C-X>-        foo<% ^ %>                                *ragtag-CTRL-X_-*
    <C-X>_        <% foo^ %>                                *ragtag-CTRL-X__*
    <C-X>'        foo<%# ^ %>                               *ragtag-CTRL-X_'*
                (mnemonic: ' is a comment in ASP VBS)
    <C-X>"        <%# foo^ %>                               *ragtag-CTRL-X_quote*
    <C-X><Space>  <foo>^</foo>                              *ragtag-CTRL-X_<Space>*
    <C-X><CR>     <foo>\n^\n</foo>                          *ragtag-CTRL-X_<CR>*
    <C-X>/        Last HTML tag closed                      *ragtag-CTRL-X_/*
    <C-X>!        <!DOCTYPE...>/<?xml ...?> (menu)          *ragtag-CTRL-X_!*
    <C-X>@        <link rel="stylesheet" ...>               *ragtag-CTRL-X_@*
                (mnemonic: @ is used for importing in a CSS file)
    <C-X>#        <meta http-equiv="Content-Type" ... />    *ragtag-CTRL-X_#*
    <C-X>$        <script src="/javascripts/^.js"></script> *ragtag-CTRL-X_$*
                (mnemonic: $ is valid in javascript identifiers)
}

/* ==================================================================================
    vim-bundler
================================================================================== */
{
    COMMANDS                                        *bundler-commands*

                                                    *bundler-:Bundle*
    :Bundle[!] [args]       Invoke `bundle` via |:make|.

                                                    *bundler-:Bopen*
    :Bopen[!] [gem]         With no argument, edits the Gemfile.  Otherwise,
                            effectively does a `bundle open` of a gem inside of
                            Vim, including an |:lcd| to the gem's root directory.
                            Add ! to discard the current buffer's changes.

                                                    *bundler-:Bedit*
    :Bedit[!] [gem]         Like |:Bopen|, but don't |:lcd| afterwards.

                                                    *bundler-:Bsplit*
    :Bsplit[!] [gem]        Like |:Bopen|, but horizontally split.  Add ! to
                            suppress the |:lcd|.

                                                    *bundler-:Bvsplit*
    :Bvsplit[!] [gem]       Like |:Bopen|, but vertically split.  Add ! to
                            suppress the |:lcd|.

                                                    *bundler-:Btabedit*
    :Btabedit[!] [gem]      Like |:Bopen|, but use a new tab.  Add ! to
                            suppress the |:lcd|.

                                                    *bundler-:Bpedit*
    :Bpedit[!] [gem]        Like |:Bopen|, but use a preview window.  Add ! to
                            suppress the |:lcd|.
}

/* ==================================================================================
    vim-bundler
================================================================================== */
{
    Use `<Leader>b` (typically: `\b`) to open a window listing all buffers. In this
    window, you can use normal movement keys to select a buffer and then:

    - <ENTER> to edit the selected buffer in the previous window
    - <C-V> to edit the selected buffer in a new vertical split
    - <C-S> to edit the selected buffer in a new horizontal split
    - <C-T> to edit the selected buffer in a new tab page
}

/* ==================================================================================
    vim-coffee-script
================================================================================== */
{
    :[silent] CoffeeMake[!] [COFFEE-OPTIONS]...
        By default, CoffeeMake shows all compiler output and jumps to the first line reported as an error by coffee:

    :CoffeeMake
        Compiler output can be hidden with silent:

    :silent CoffeeMake
        Line-jumping can be turned off by adding a bang:

    :CoffeeMake!
        Options given to CoffeeMake are passed along to coffee:

    :CoffeeMake --bare
        CoffeeMake can be manually loaded for a file with:

    :compiler coffee
}

/* ==================================================================================
    vim-nerdtree-tabs
================================================================================== */
{
    :NERDTreeTabsOpen switches NERDTree on for all tabs.

    :NERDTreeTabsClose switches NERDTree off for all tabs.

    :NERDTreeTabsToggle toggles NERDTree on/off for all tabs.

    :NERDTreeMirrorOpen acts as :NERDTreeMirror, but smarter: When opening, it first tries to use an existing tree (i.e. previously closed in this tab or perform a mirror of another tab's tree). If all this fails, a new tree is created. It is recommended that you use this command instead of :NERDTreeMirror.

    :NERDTreeMirrorToggle toggles NERDTree on/off in current tab, using the same behavior as :NERDTreeMirrorOpen.

    :NERDTreeSteppedOpen focuses the NERDTree, opening one first if none is present.

    :NERDTreeSteppedClose unfocuses the NERDTree, or closes/hides it if it was not focused.

}

/* ==================================================================================
    Tagbar
================================================================================== */
{
    :TagbarOpen [{flags}]                                            *:TagbarOpen*
            :TagbarOpen fj

    :TagbarClose                                                    *:TagbarClose*
        Close the Tagbar window if it is open.

    :TagbarToggle                                                  *:TagbarToggle*
    :Tagbar
        Open the Tagbar window if it is closed, or close it if it is open.

    :TagbarTogglePause                                        *:TagbarTogglePause*

    :TagbarSetFoldlevel[!] {number}                          *:TagbarSetFoldlevel*

    :TagbarShowTag                                                *:TagbarShowTag*

    :TagbarCurrentTag [{flags}]                                *:TagbarCurrentTag*
}

/* ==================================================================================
    vim-easymotion
================================================================================== */
{
    <Leader><Leader>t


    <Leader><Leader>w           " trigger the word motion w

    <Leader><Leader>fo, and all "o" characters are highlighted:
}

/* ==================================================================================
    undotree
================================================================================== */
{
    :UndotreeToggle

}

/* ==================================================================================
    tabularize
================================================================================== */
{
    :Tabularize /<parenthesis>

}

/* ==================================================================================
    vim-dispatch
================================================================================== */
{
    read documentation

}

/* ==================================================================================
    vim-abolish
================================================================================== */
{
    read documentation

}

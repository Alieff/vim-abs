# abs.vim
Simple ABS ([Abstract Behavioural Specification Language](https://abs-models.org/)) syntax highlighting for VIM.

# Installation 

1. Copy file `abs.vim` to vim syntax folder (usually `$HOME/.vim/after/syntax` (linux) or `$HOME/vimfiles/after/syntax` (windows))
2. Open your ABS file
3. Set file type to abs `set ft=abs`
    * If you want to automate it put this line into your vimrc
        ```
        augroup ABSAutoSourcing 
            autocmd! 
            au BufRead,BufNewFile *.abs set filetype=abs 
            au BufRead,BufNewFile *.abs syntax sync fromstart " for abs syntax highlighting
        augroup END
        ```

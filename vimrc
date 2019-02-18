
" ----------------------------------------------------------------------
" | General Settings                                                   |
" ----------------------------------------------------------------------

syntax on                      " Enable syntax highlighting.

set cursorline                 " Highlight the current line.

set nostartofline              " Kept the cursor on the same column.
set number                     " Show line number.

" ----------------------------------------------------------------------
" | Color Scheme                                                       |
" ----------------------------------------------------------------------

set t_Co=256                   " Enable full-color support.

set background=dark            " Use colors that look good
                               " on a dark background.

" Set custom configurations for when the
" Solarized theme is used from Vim's Terminal mode.
"
" https://github.com/altercation/vim-colors-solarized

if !has("gui_running")
    let g:solarized_contrast = "high"
    let g:solarized_termcolors = 256
    let g:solarized_termtrans = 1
    let g:solarized_visibility = "high"
endif

silent! colorscheme solarized  " Use custom color scheme.

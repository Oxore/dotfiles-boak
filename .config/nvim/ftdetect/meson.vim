" This file is a part of Mesonic project
" URL: https://github.com/igankevich/mesonic

autocmd BufRead,BufNewFile meson.build setfiletype meson
" overrides 'text' file type
autocmd BufRead,BufNewFile meson_options.txt set filetype=mesonopt

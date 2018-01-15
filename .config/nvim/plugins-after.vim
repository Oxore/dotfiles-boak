" local_vimrc options
call lh#local_vimrc#munge('whitelist', $HOME.'/build-pkgs')
call lh#local_vimrc#munge('whitelist', $HOME.'/Documents/prog')

" Neomake
call neomake#configure#automake('w')

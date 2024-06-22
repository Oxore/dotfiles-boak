function! CViewMixedSrcDisasm()
  " TODO: Disasm the function only that the cursor is inside of.
  let l:tmpdir = '/tmp/asmdump/'

  try
    let compile_commands = json_decode(readfile("compile_commands.json"))
  catch
    echo("Can't find compile_commands.json")
    return
  endtry

  for f in compile_commands
    let fname = get(f, 'file')
    let dname = get(f, 'directory')

    if fname =~ expand('%:t')
      let args = []
      let executable = get(f, "arguments")[0]
      let args_to_filter = get(f, "arguments")[1:]
      let oname = ''  " Output object file name
      let oarg  = ''  " The '-o' option
      for arg in args_to_filter
        if arg =~ '^-o'
          let oarg = arg[:1]
          if len(arg) > 2
            let oname = arg[2:]
          endif
        elseif !empty(oarg) && empty(oname)
          let oname = arg
        else
          call add(args, arg)
        endif
      endfor

      call add(args, '-I'.dname)

      " Get prefix, i.e. 'arm-none-eabi-' prefix from 'arm-none-eabi-gcc'
      let prefix = join(split(executable, '-')[:-2], '-')
      if !empty(prefix)
        let prefix = prefix.'-'
      endif

      if !empty(oname) && !empty(oarg)

        " Prepare temporary directory

        call system('rm -rf '   .l:tmpdir)
        call system('mkdir -p ' .l:tmpdir.'$(dirname '.oname.')')

        " Compile

        call system(executable.' '.join(args, ' ').' '.oarg.l:tmpdir.oname)

        " Prepare scratch window

        execute get(g:, 'disasm_window', 'vertical topleft new')
        setlocal buftype=nofile bufhidden=hide noswapfile syntax=c

        " Disasm

        execute ':%!'.prefix.'objdump -Mintel -dCS '.l:tmpdir.oname.' 2>/dev/null'
      endif

      break
    endif
  endfor

endfunction

function! CNeomakeFn()
  try
    let compile_commands = json_decode(readfile("compile_commands.json"))
  catch
    echo("Can't find compile_commands.json")
    return
  endtry

  for entry in compile_commands
    let l:fname = get(entry, 'file', '')
    let l:dname = get(entry, 'directory', '')
    if (l:fname[0] == '/')
      let l:fpath = trim(system('realpath ' . fname))
    else
      let l:fpath = trim(system('realpath ' . dname . '/' . fname))
    endif

    if simplify(fpath) =~ expand('%:p')
      let l:args = []
      let l:args_to_filter = []
      " FIXME Splitting by spaces may cause problems on filenames with spaces
      let l:args_to_filter = args_to_filter + split(get(entry, "command", ""), " ")
      let l:args_to_filter = args_to_filter + get(entry, "arguments", [])
      let l:executable = args_to_filter[0]
      let l:args_to_filter = args_to_filter[1:]
      let l:oarg = ""
      for arg in args_to_filter
        if (oarg == "-o")
          " Clear oarg
          let l:oarg = ""
          " And skip object file, because previous argument was '-o'
          continue
        endif

        if (arg == "-o")
          " Set oarg to '-o', so next argument will be skipped (the object file)
          let l:oarg = "-o"
          " And skip it
          continue
        elseif (arg =~ "^-o")
          " Skip object file sticked with '-o' flag like '-ofile.o'
          continue
        endif

        if (arg =~ fname)
          " Skip source file
          continue
        endif

        if trim(arg, "'") != ''
          call add(args, trim(arg, "'"))
        endif
      endfor

      call add(args, "-fsyntax-only")
      call add(args, "-fdiagnostics-color=never")

      let g:neomake_c_anycc_maker = {
            \ 'exe': executable,
            \ 'cwd': dname,
            \ 'args': args,
            \ 'errorformat':
              \ '%-G%f:%s:,' .
              \ '%f:%l:%c: %trror: %m,' .
              \ '%f:%l:%c: %tarning: %m,' .
              \ '%I%f:%l:%c: note: %m,' .
              \ '%f:%l:%c: %m,'.
              \ '%f:%l: %trror: %m,'.
              \ '%f:%l: %tarning: %m,'.
              \ '%I%f:%l: note: %m,'.
              \ '%f:%l: %m'
            \ }
      let g:neomake_cpp_anycc_maker = g:neomake_c_anycc_maker
      break
    endif
  endfor

  if exists("g:neomake_c_anycc_maker")
    Neomake
  endif
endfunction

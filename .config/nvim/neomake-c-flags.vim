function! CNeomakeFn()
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
      for arg in args_to_filter
        if (arg !~ ".o$") && (arg !~ "^\-[c|o]$") && (arg !~ fname)
          call add(args, arg)
        endif
      endfor

      call add(args, "-fsyntax-only")
      call add(args, "-I".dname)

      let g:neomake_c_anygcc_maker = {
            \ 'exe': executable, 
            \ 'args': args,
            \ 'errorformat': '%f:%l:%c: %m', }
      break
    endif
  endfor

  Neomake
endfunction


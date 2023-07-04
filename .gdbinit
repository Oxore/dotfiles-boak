#set disassembly-flavor intel
set print pretty on

define asm
  x/10i $pc
end

define asmstep
  si
  x/10i $pc
end

define asmnext
  ni
  x/10i $pc
end

define connect
  if $argc >= 1
    target extended-remote localhost:$arg0
  else
    target extended-remote localhost:3333
  end
end

define mrh
  monitor reset halt
end

define mr
  monitor reset
end

define memprof
  d br
  b mm_malloc.c:188
  set pagination off
  while (1)
    print size
    c
  end
end

define log
  set logging enabled on
  set trace-commands on
end

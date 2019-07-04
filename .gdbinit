#set disassembly-flavor intel
set print pretty on

define asmstep
    si
    x/10i $pc
end

define connect
    target extended-remote localhost:3333
end

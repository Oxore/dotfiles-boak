set disassembly-flavor intel

define mystep
    si
    x/10i $pc
end

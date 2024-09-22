.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
input_integer_format byte "%d",0
output_msg byte "ENTER NUMBER:",0
output_msg_format byte "%d > %d",0
number1 sdword ?
number2 sdword ?

.code
main proc
    
    push eax
    push ebx
    push ecx
    push edx
    push ebp
    INVOKE scanf, ADDR input_integer_format, ADDR number1
    pop ebp
    pop edx
    pop ecx
    pop ebx
    pop eax

    push eax
    push ebx
    push ecx
    push edx
    push ebp
    INVOKE scanf, ADDR input_integer_format, ADDR number2
    pop ebp
    pop edx
    pop ecx
    pop ebx
    pop eax


    mov eax, number1
    mov ebx, number2
    cmp eax, ebx

    jge BIGGER
    jl SMALLER

BIGGER:
    push eax
    push ebx
    push ecx
    push edx
    push ebp
    INVOKE printf, ADDR output_msg_format, number1, number2
    pop ebp
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp EXIT_

SMALLER:
    push eax
    push ebx
    push ecx
    push edx
    push ebp
    INVOKE printf, ADDR output_msg_format, number2, number1
    pop ebp
    pop edx
    pop ecx
    pop ebx
    pop eax

EXIT_:
    ret
main endp
end
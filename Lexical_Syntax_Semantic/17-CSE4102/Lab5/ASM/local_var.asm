.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
output_msg_format byte "%s",0

.code
main proc
    push ebp
    mov ebp, esp
    sub ebp, 100

    mov eax, 10
    mov dwork ptr [ebp-0], eax
    mov eax, 20
    mov dwork ptr [ebp-4], eax

    mov eax, [ebp-0]
    mov ebx, [ebp-4]

    


    pop ebp
EXIT_:
    ret
main endp
end
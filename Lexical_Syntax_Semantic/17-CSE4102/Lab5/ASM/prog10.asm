; start -1
.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
input_integer_format byte "%d",0
output_integer_msg_format byte "%d", 0Ah, 0
number sdword ?

.code
main proc
    push ebp
    mov ebp, esp
    sub ebp, 100
    mov ebx, ebp
    add ebx, 4

    ; ld_int 20 (load int 20)
    mov eax, 20
    mov dword ptr [ebp-0], eax 
    ; 32 bit size
    mov dword ptr [ebp-4], 30 

    mov eax, [ebp-0]
    mov dword ptr [ebx], eax
    add ebx, 4

    sub ebx, 4
    mov eax, [ebx]
    sub ebx, 4
    mov edx, [ebx]
    add edx, eax
    mov dword ptr [ebx], edx
    add ebx, 4


    mov eax, 2
    mov dword ptr [ebx], eax
    add ebx, 4

    sub ebx, 4
    mov eax, [ebx]
    sub ebx, 4
    mov edx, [ebx]
    add edx, eax
    mov dword ptr [ebx], edx
    add ebx, 4

    mov eax, [ebx-4]
    mov dword ptr [ebp-8], eax

    add ebp, 100
    mov esp, ebp

    ret
main endp
end
.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
output_integer_msg_format byte "%d", 0Ah, 0
output_string_msg_format byte "%s", 0Ah, 0
input_integer_format byte "%d",0

number sdword ?

.code

main proc
    push ebp
    mov ebp, esp
    sub ebp, 100

    mov dword ptr [ebp-0], 10
    mov dword ptr [ebp-4], 20

    mov eax, [ebp-0]
    mov ebx, [ebp-4]
    add eax, ebx
    mov dword ptr [ebp-8], eax
    
    push eax
    push ebx
    push ecx
    push edx
    push ebp
    mov eax, [ebp-8]
    INVOKE printf, ADDR output_integer_msg_format, eax
    pop ebp
    pop edx
    pop ecx
    pop ebx
    pop eax

    add ebp, 100
    mov esp, ebp
    pop ebp
	ret
main endp
end
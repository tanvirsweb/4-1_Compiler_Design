;start -1
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
	mov ebx, ebp
	add ebx, 4

;ld_int 10
	mov eax, 10
	mov dword ptr [ebx], eax
	add ebx, 4


;store 0
	mov eax, [ebx-4]
	mov dword ptr [ebp-0], eax

;scan_int_value 1
	push eax
	push ebx
	push ecx
	push edx
	push [ebp-8]
	push [ebp-4]
	push [ebp-0]
	push [ebp+4]
	push ebp
	INVOKE scanf, ADDR input_integer_format, ADDR number
	pop ebp
	pop [ebp+4]
	pop [ebp-0]
	pop [ebp-4]
	pop [ebp-8]
	mov eax, number
	mov dword ptr [ebp-4], eax
	pop edx
	pop ecx
	pop ebx
	pop eax

;ld_var 0
	mov eax, [ebp-0]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_var 1
	mov eax, [ebp-4]
	mov dword ptr [ebx], eax
	add ebx, 4


;sub -1
	sub ebx, 4
	mov eax, [ebx]
	sub ebx, 4
	mov edx, [ebx]
	sub edx, eax
	mov dword ptr [ebx], edx
	add ebx, 4


;ld_int 10
	mov eax, 10
	mov dword ptr [ebx], eax
	add ebx, 4


;sub -1
	sub ebx, 4
	mov eax, [ebx]
	sub ebx, 4
	mov edx, [ebx]
	sub edx, eax
	mov dword ptr [ebx], edx
	add ebx, 4


;ld_int 20
	mov eax, 20
	mov dword ptr [ebx], eax
	add ebx, 4


;add -1
	sub ebx, 4
	mov eax, [ebx]
	sub ebx, 4
	mov edx, [ebx]
	add edx, eax
	mov dword ptr [ebx], edx
	add ebx, 4


;store 2
	mov eax, [ebx-4]
	mov dword ptr [ebp-8], eax

;print_int_value 2
	push eax
	push ebx
	push ecx
	push edx
	push [ebp-8]
	push [ebp-4]
	push [ebp-0]
	push [ebp+4]
	push [ebp+8]
	push [ebp+12]
	push [ebp+16]
	push ebp
	mov eax, [ebp-8]
	INVOKE printf, ADDR output_integer_msg_format, eax
	pop ebp
	pop [ebp+16]
	pop [ebp+12]
	pop [ebp+8]
	pop [ebp+4]
	pop [ebp-0]
	pop [ebp-4]
	pop [ebp-8]
	pop edx
	pop ecx
	pop ebx
	pop eax

;halt -1
	add ebp, 100
	mov esp, ebp
	pop ebp
	ret
main endp
end
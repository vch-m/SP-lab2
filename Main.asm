.586
.model flat, stdcall

include C:\masm32\include\kernel32.inc
include C:\masm32\include\user32.inc

includelib C:\masm32\lib\kernel32.lib
includelib C:\masm32\lib\user32.lib


.data

Text1 db "ћалашк≥н ¬€чеслав",0

Text0 db "Vendor=xxxxxxxxxxxx", 13, 10,
		 "MaxValue=xxxxxxxx", 0

Text80 db "MaxExtVal=xxxxxxxx", 0

Text db "EAX=xxxxxxxx", 13, 10,
		"EBX=xxxxxxxx", 13, 10,
		"ECX=xxxxxxxx", 13, 10,
		"EDX=xxxxxxxx", 0 

Caption1 db "Ћабораторна робота є2", 0

Caption00 db "CPUID 00h", 0
Caption01 db "CPUID 01h", 0
Caption02 db "CPUID 02h", 0

CaptionExt db "CPUID EXT", 0
Caption81 db "CPUID 80..01h", 0
Caption82 db "CPUID 80..02h", 0
Caption83 db "CPUID 80..03h", 0
Caption84 db "CPUID 80..04h", 0
Caption85 db "CPUID 80..05h", 0
Caption88 db "CPUID 80..08h", 0




.code

DwordToStrHex proc 
	push ebp
	mov ebp, esp
	mov ebx, [ebp+8]	;другий параметр

	mov edx, [ebp+12]	 ;перший параметр
	xor eax, eax
	mov edi, 7
@next:
	mov al, dl
	and al, 0Fh		;вид≥л€Їмо одну ш≥стнадц€ткову цифру
	add ax, 48		;так можна т≥льки дл€ цифр 0-9
	cmp ax, 58
	jl @store
	add ax, 7	 ;дл€ цифр A, B, C, D, E, F
@store:
	mov [ebx+edi], al
	shr edx, 4
	dec edi
	cmp edi, 0
	jge @next
	pop ebp
	ret 8
DwordToStrHex endp

main:


	invoke MessageBoxA, 0, ADDR Text1, ADDR Caption1, 0	

	mov eax, 0
	cpuid

	mov dword ptr[Text0+7], ebx
	mov dword ptr[Text0+11], edx
	mov dword ptr[Text0+15], ecx

	push eax
	push offset [Text0+30]
	call DwordToStrHex
	invoke MessageBoxA, 0, ADDR Text0, ADDR Caption00, 0	

	mov eax, 1	
	cpuid

	push eax
	push offset[Text+4]
	call DwordToStrHex

	push ebx
	push offset[Text+18]
	call DwordToStrHex

	push ecx
	push offset[Text+32]
	call DwordToStrHex

	push edx
	push offset[Text+46]
	call DwordToStrHex
	invoke MessageBoxA, 0, ADDR Text, ADDR Caption01, 0	

	mov eax, 2	
	cpuid

	push eax
	push offset[Text+4]
	call DwordToStrHex

	push ebx
	push offset[Text+18]
	call DwordToStrHex

	push ecx
	push offset[Text+32]
	call DwordToStrHex

	push edx
	push offset[Text+46]
	call DwordToStrHex
	invoke MessageBoxA, 0, ADDR Text, ADDR Caption02, 0

;Extended Function CPUID Information

	mov eax, 80000000h
	cpuid

	push eax
	push offset[Text80+10]
	call DwordToStrHex

	invoke MessageBoxA, 0, ADDR Text80, ADDR CaptionExt, 0

	mov eax, 80000001h	
	cpuid

	push eax
	push offset[Text+4]
	call DwordToStrHex

	push ebx
	push offset[Text+18]
	call DwordToStrHex

	push ecx
	push offset[Text+32]
	call DwordToStrHex

	push edx
	push offset[Text+46]
	call DwordToStrHex
	invoke MessageBoxA, 0, ADDR Text, ADDR Caption81, 0

	mov eax, 80000002h	
	cpuid

	push eax
	push offset[Text+4]
	call DwordToStrHex

	push ebx
	push offset[Text+18]
	call DwordToStrHex

	push ecx
	push offset[Text+32]
	call DwordToStrHex

	push edx
	push offset[Text+46]
	call DwordToStrHex
	invoke MessageBoxA, 0, ADDR Text, ADDR Caption82, 0

	mov eax, 80000003h	
	cpuid

	push eax
	push offset[Text+4]
	call DwordToStrHex

	push ebx
	push offset[Text+18]
	call DwordToStrHex

	push ecx
	push offset[Text+32]
	call DwordToStrHex

	push edx
	push offset[Text+46]
	call DwordToStrHex
	invoke MessageBoxA, 0, ADDR Text, ADDR Caption83, 0


	mov eax, 80000004h	
	cpuid

	push eax
	push offset[Text+4]
	call DwordToStrHex

	push ebx
	push offset[Text+18]
	call DwordToStrHex

	push ecx
	push offset[Text+32]
	call DwordToStrHex

	push edx
	push offset[Text+46]
	call DwordToStrHex
	invoke MessageBoxA, 0, ADDR Text, ADDR Caption84, 0


	mov eax, 80000005h	
	cpuid

	push eax
	push offset[Text+4]
	call DwordToStrHex

	push ebx
	push offset[Text+18]
	call DwordToStrHex

	push ecx
	push offset[Text+32]
	call DwordToStrHex

	push edx
	push offset[Text+46]
	call DwordToStrHex
	invoke MessageBoxA, 0, ADDR Text, ADDR Caption85, 0


	mov eax, 80000008h	
	cpuid

	push eax
	push offset[Text+4]
	call DwordToStrHex

	push ebx
	push offset[Text+18]
	call DwordToStrHex

	push ecx
	push offset[Text+32]
	call DwordToStrHex

	push edx
	push offset[Text+46]
	call DwordToStrHex
	invoke MessageBoxA, 0, ADDR Text, ADDR Caption88, 0

	invoke ExitProcess, 0
end main

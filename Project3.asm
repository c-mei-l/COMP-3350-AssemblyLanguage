;Courtney Lee
;cml0082
;Courtney_Lee.asm
;I consulted the textbook for some syntax questions

; This program reads values from input array
; and puts them into an output array, shifted by the shift value.
; The shift should wrap to the front of the array if it's out of bounds.

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD


.data
    shift dword 2
    input byte 1,3,5,7,9,11,12
    output byte lengthof input dup(?)
.code
	main proc

		mov eax, 0                   ;Clear eax register
		mov ebx, lengthof input      ;Make output index the length of the input
		mov ecx, shift               ;(this loop wil place the 'non-wraped' values)
		sub ebx, shift               ;Start writing from input at shift
		mov esi, 0                   ;Start reading at 0
	l1:
		mov al, input[ebx]           ;Move the value from input to al
		mov output[esi], al          ;Move the value from al into output
		inc esi                      ;Increment the input index
		inc ebx                      ;Increment the output index

	loop l1

		mov esi, 0                  ;Start writing at index 0
		mov ebx, shift              ;This loop will iterate shift times
		mov ecx, lengthof input     ;Start reading at index length - shift.

	l2:
		mov al, input[esi]          ;Move the values from input into al
		mov output[ebx], al         ;Move the value from al into output
		inc esi                     ;Increment the input index
		inc ebx                     ;Increment the output index

	loop l2

	mov esi, 0                      ;Start writing at index 0
	mov ecx, lengthof input         ;Start reading at index length - shift
	l3:
		mov al, output[esi]         ;Write input into output
		inc esi                     ;Increment input index
	loop l3


INVOKE ExitProcess,0
main ENDP
END main

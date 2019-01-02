    AREA text, CODE, READONLY
    //test
	export mov_asm
mov_asm 

	PUSH{R4-R12}
	MOV  R4,#0 
	VMOV.f32 S3, R3
	
	
LOOP1
	ADDS R4, #1
	CMP	R4, R2
	BGT OVER 
	MOV R10, #0
	VMOV.f32 S5, R10  ;R5 holds the temporary value 
	MOV R9, #2
	UDIV R6, R3, R9
	MOV R8, R4
	ADD R8, R8, R3
	SUB R8, R8, R6
	SUB R8, R8, #1
	SUBS R6, R4, R6
	
LOOP2
	CMP R6, #0
	BLT LOOP3
	CMP R6, R2
	BGT LOOP3
	MOV R10, R6, LSL #2
	VLDR S7, [R0{,R10}]  ; we want to left shift by 4 to get the next element in the array 
	VDIV.f32 S7, S7, S3
	VADD.f32 S5, S5, S7
	ADDS R6, R6, #1
	CMP R6, R8
	BGT LOOP4
	B LOOP2
	
	
LOOP3
	ADDS R6, R6, #1
	CMP R6, R8
	BGT LOOP4
	B LOOP2
	
LOOP4
	MOV R10, R4, LSL #2
	VSTR.f32 S5, R1
	B LOOP1

OVER
	POP {R4-R5}
	BX LR
	END 

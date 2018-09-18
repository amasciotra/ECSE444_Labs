    AREA text, CODE, READONLY
		
	export dot_asm
dot_asm

    PUSH {R4-R12}
	MOV R6, #0
	VMOV.f32  S4, R6        ;S4 will be the final dot product 

LOOP 
	SUBS R2, R2, #1         ;loop counter that is decrementing from N to 0 
	BLT DONE                ;if we have reached 0, the loop is over 
	ADD R4, R0, R2, LSL #2  ;base address for array a 
	ADD R5, R1, R2, LSL #2  ;base address for array b 
	VLDR.f32 S2, [R4]       ;load element from array a 
	VLDR.f32 S3, [R5]       ;load element from array b 
	VMLA.f32 S4, S2, S3     ;Multiply the two elements
	B LOOP                        

DONE
	VSTR.f32 S4, [R3]
	POP {R4-R12}
	BX LR
	END
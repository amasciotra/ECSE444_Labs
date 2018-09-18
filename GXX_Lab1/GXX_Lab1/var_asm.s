    AREA text, CODE, READONLY
		
	export var_asm
		
var_asm

    PUSH {R4-R12}
	MOV R6, #0
	VMOV.f32  S4, R6        ;S4 will be the final dot product 
	MOV  R5, R1

LOOP 
	SUBS R5, R5, #1         ;loop counter that is decrementing from N to 0 
	BLT MEAN              ;if we have reached 0, the loop is over 
	ADD R4, R0, R5, LSL #2  ;base address for array a 
	VLDR.f32 S2, [R4]       ;load element from array a 
	VADD.f32 S4, S2   
	B LOOP

MEAN 
	VMOV.f32 S6, R1
	VDIV.f32 S4, S4, S6

DONE
	VSTR.f32 S4, [R2]
	POP {R4-R12}
	BX LR
	END
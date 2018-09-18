	AREA test, CODE, READONLY
	
	export asm_var                 ; label must be exported if it is to be used as a function in C
asm_var

	PUSH {R4, R5, R6}

	VLDR.f32 S0, [R0]
	MOV R5, #0
	VMOV.f32 S2, R5							;temp sum for mean setting to zero 
	MOV R6, #0
	
loop
	ADD R6, R6, #1					;counter
	CMP R1, R6
	BLT done								;exit condition
	ADD R4, R0, R6, LSL #2 	;index for next item in both arrays
	VADD.f32 S2, S0, S2		
	VLDR.f32 S0, [R4]
	B loop
	
done
	VSTR.f32 S2, [R2]
	POP{R4, R5, R6}
	BX LR
	
	END
	
	AREA test, CODE, READONLY
	
	export asm_dotproduct                 ; label must be exported if it is to be used as a function in C
asm_dotproduct

	PUSH {R4, R5, R6}

	VLDR.f32 S0, [R0]
	VLDR.f32 S1, [R1]
	MOV R5, #0
	VMOV.f32 S2, R5							;temp sum setting to zero
	MOV R6, #0
	
loop
	ADD R6, R6, #1					;counter
	CMP R2, R6
	BLT done								;exit condition
	ADD R4, R0, R6, LSL #2 					;index for next item in both arrays
	ADD R5, R1, R6, LSL #2
	VMLA.f32 S2, S0, S1						;mul S0 * S1 then add S2 and store S2
	VLDR.f32 S0, [R4]
	VLDR.f32 S1, [R5]
	B loop
	
done
	VSTR.f32 S2, [R3]
	POP{R4, R5, R6}
	BX LR
	
	END
	
	
	
	
	

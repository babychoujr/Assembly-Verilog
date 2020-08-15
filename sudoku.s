.text 
start:
	li sp 0x10000
	la s0 inputcnt
	lw s0 0(s0)
	la a0 inputs

input_loop:
	jal solve

	addi a0 a0 16
	addi s0 s0 -1
	bnez s0 input_loop

	la s0 inputcnt
	lw s0 0(s0)
	la s1 inputs
	la s2 answers
loop_answers:
	li s3 16
	addi s4 zero 0

	loop_answer:
		lb t2 0(s1)
		lb t3 0(s2)
		beq t2 t3 skip_different

		addi s4 s4 1

		skip_different:
		addi s1 s1 1
		addi s2 s2 1
		addi s3 s3 -1
		bnez s3 loop_answer

	li t4 0x10000
	sw s4 0(t4)

	addi s0 s0 -1
	bnez s0 loop_answers
	hcf

#########################################
####### Modify this part! #############>>

solve:
	## taking all the memory on the sp
	addi sp sp -8
	sw a0 4(sp)  
	sw ra 0(sp)  

	# the index starting at 0
	li t0 0
	li t1 0
	li a4 0
	#lb t3 0(a0)

next_loop:

	mv t3 a0
	#holds the largest value
	li t2 16
	
	
	add t3 t3 t0
	lb a2 0(t3)

	
	li t4 1

	bge t0 t2 indexBig
		
	bge a2 t4 nextSolve


	li t5 1
	li t6 5
	li a1 0
for_loop:
	bge t5 t6 solve_end_for
	
	add a0 a0 t0
	sw t5 0(a0)
	lb a3 0(a0)

	sub a0 a0 t0
	
	jal check
check_return:
	beq a4 a1 increment
	beq t1 a1 increment	
  	jal solve_end_for

increment:
	addi t5 t5 1
	
	jal for_loop		

	
	##restoring all the memorry on the sp	
restore:
	lw ra 0(sp)
	lw a0 4(sp)
	addi sp sp 8
	ret

#returns true
indexBig: 
	li t1 1	
	ret

nextSolve:
	addi t0 t0 1
	jal next_loop

solve_end_for:
	add a0 a0 t0
	sw t1 0(a0)
	jal restore	

check:
	li a5 0
	li a6 0
	li a7 0 

	srli a5 t0 2

	andi a6 t0 3
	
	li s5 0
	li s6 0
	
	srli s5 t0 3
	slli s5 t0 3

	srli s6 a6 1
	slli s6 a6 1

	add a7 s5 s6

	li s5 0 
	li s6 4

check_loop:
	bge s5 s6 end_check
	
	li s7 0
	li s8 0
	li s9 0 
	

	mv t3 a0

	li s10 0

	#finds the rowval
	slli s7 a5 2
	add s7 s7 s5
	#indexing the address
	add t3 t3 s7
	lb s7 0(t3)
	sub t3 t3 s7
	
	#finds the colval
	slli s8 s5 2
	add s8 s8 a6

	add t3 t3 s8
	lb s8 0(t3)
	sub t3 t3 s8

	srli s9 s5 1
	slli s9 s9 2
	
	#mod 2
	andi s10 s5 1
	
	add s9 s9 a7
	add s9 s9 s10

	#mask
	li s10 0
	li s11 0
	
	slli s7 s7 1
	and s7 s11 s7
	bne s7 s10 row_wrong

	#update mask
	or s11 s11 s7 

	addi s8 s8 8
	slli s8 s8 1
	and s8 s11 s8
	bne s8 s10 col_wrong
	
	#update mask
	or s11 s11 s8

	addi s9 s9 16
	slli s9 s9 1
	and s9 s11 s9
	bne s9 s10 block_wrong
	
	addi s5 s5 1
	jal check_loop

row_wrong:
	li a4 0
	jal check_return
	
col_wrong:
	li a4 0
	jal check_return

block_wrong:
	li a4 0 
	jal check_return

end_check:
	li a4 1
	jal check_return

##<<	
### Do not modify beyond this point! ##<<
#########################################


.data
inputcnt:
.word 3
inputs: 
.byte 0 4 3 0 0 0 4 2 0 2 0 0 3 0 0 0
.byte 0 0 3 0 0 4 0 2 0 0 2 0 0 2 0 3
.byte 0 3 0 4 0 0 2 0 4 0 3 0 0 0 0 2

answers:
.byte 2 4 3 1 1 3 4 2 4 2 1 3 3 1 2 4 
.byte 2 1 3 4 3 4 1 2 4 3 2 1 1 2 4 3 
.byte 2 3 1 4 1 4 2 3 4 2 3 1 3 1 4 2 


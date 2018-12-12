.data 
input: .asciiz "Enter the number of disks: "
output: .asciiz "Number of moves: "
invalid_input : .asciiz "Invalid input: \n Plaese enter valid number of disks\n" 
.text 
global_main:
la $a0, input
li  $v0, 4
syscall
li $v0 ,5
syscall
move $a1 , $v0
li $a2,2
loop:
li $a3,2
mult $a3 ,$a2
mflo $a2
sub $a1 ,$a1,1
bgt $a1,1 ,loop
sub $a1 ,$a2,1
jal print 
bge $a1,2,loop
beq $a1 ,1, print 
la , $a0 , invalid_input
li, $v0, 4
syscall
jal global_main
li $v0, 10
syscall
print:
la $a0, output
li  $v0, 4
syscall
move $a0 , $a1
li , $v0,1
syscall

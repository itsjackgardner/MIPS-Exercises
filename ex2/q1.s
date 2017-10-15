# COMP1521 Practice Prac Exam #1
# int lowerfy(char *src, char *dest)

   .text
   .globl lowerfy

# params: src=$a0, dest=$a1
lowerfy:
# prologue
   addi $sp, $sp, -4
   sw   $fp, ($sp)
   la   $fp, ($sp)
   addi $sp, $sp, -4
   sw   $ra, ($sp)
   addi $sp, $sp, -4
   sw   $s0, ($sp)
   addi $sp, $sp, -4
   sw   $s1, ($sp)
   # if you need to save more $s? registers
   # add the code to save them here

# function body
# locals: ...

   li   $t0, 0          # n
   lb   $s0, 'A'
   lb   $s1, 'Z'
loop:
   lb   $t1, ($a0)
   beqz $t1, end
   blt  $t1, $s0, continue
   bgt  $t1, $s1, continue
   addi $t1, $t1, -32
<<<<<<< HEAD
   addi $t0, $t0, 1
=======
>>>>>>> ed2c96173fb2c15196f48d4282ebe13b2ffc5782
continue:
   sb   $t1, ($a1)
   addi $a0, $a0, 1
   addi $a1, $a1, 1
   j    loop

end:
   sb   $zero, ($a1)
   move $v0, $t0
# epilogue
   # if you saved more than two $s? registers
   # add the code to restore them here
   lw   $s1, ($sp)
   addi $sp, $sp, 4
   lw   $s0, ($sp)
   addi $sp, $sp, 4
   lw   $ra, ($sp)
   addi $sp, $sp, 4
   lw   $fp, ($sp)
   addi $sp, $sp, 4
   j    $ra

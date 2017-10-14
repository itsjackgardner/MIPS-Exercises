# COMP1521 Practice Prac Exam #1
# int rmOdd(int *src, int n, int*dest)

   .text
   .globl rmOdd

# params: src=$a0, n=$a1, dest=$a2
rmOdd:
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

   li   $t0, 0
   li   $t1, 0
   li   $s0, 2
loop:
   beq  $t0, $a1, end
   lw   $t2, ($a0)
   rem  $t3, $t2, $s0
   bnez $t3, continue
   sw   $t2, ($a2)
   addi $t1, $t1, 1
   addi $a2, $a2, 4
continue:
   addi $t0, $t0, 1
   addi $a0, $a0, 4
   j    loop

end:
   move $v0, $t1
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

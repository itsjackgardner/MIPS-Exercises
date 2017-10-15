# COMP1521 Practice Prac Exam #1
# (int dp, int n) dotProd(int *a1, int n1, int *a2, int n2)

   .text
   .globl dotProd

# params: a1=$a0, n1=$a1, a2=$a2, n2=$a3
dotProd:
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
# locals:

   li   $t0, 0  # i
   li   $t1, 0  # sum
   blt  $a1, $a3, else
   move $s1, $a1
   j    loop
   nop
else:
   move $s1, $a2

loop:
   beq  $t0, $s1, end
   lw   $t2, ($a0)
   lw   $t3, ($a2)
   mul  $t2, $t2, $t3
   add  $t1, $t1, $t2
   addi $a0, $a0, 4
   addi $a2, $a2, 4
   j    loop
   nop

end:
   move $v0, $t1
   move $v1, $s1
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

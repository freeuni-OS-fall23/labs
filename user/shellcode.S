#include "syscall.h"

.globl start
   // int fd_a0 = open("flag.txt", O_RDONLY);
   la a0, flag_filename
   li a1, 0
   li a7, 15
   ecall // -> a0

  //read(fd_a0, $sp, 128);
   mv a1, sp
   li a2, 128
   li a7, 5
   ecall

  //write(1, $sp, 128);
   li a0, 1
   mv a1, sp
   li a2, 128
   li a7, 16
   ecall


   // read()


   
   

flag_filename:
   .string "flag.txt\0"

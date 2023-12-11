#include "syscall.h"

.globl start
        # int fd_a0 = open("flag.txt", O_RDONLY)
        la a0, flag_name
        li a1, 0
        li a7, SYS_open
        ecall

        # read(fd_a0, $sp, 128);
        mv a1, sp
        li a2, 128
        li a7, SYS_read
        ecall

        # write(1, $sp, 128);
        li a0, 1
        mv a1, sp
        li a2, 128
        li a7, SYS_write
        ecall

flag_name:
  .string "flag.txt\0"

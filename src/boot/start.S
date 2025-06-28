// src/boot/start.S
.section .text
.global _start


_start:
	bl kernel_main
1: b 1b  //infinite loop

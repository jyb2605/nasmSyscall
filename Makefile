all:
	nasm -f elf syscall.s
	ld -m elf_i386 syscall.o -o syscall

clean:
	rm -rf syscall.o syscall

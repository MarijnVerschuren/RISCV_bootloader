qemu-system-riscv32 -nographic -m 512 -device loader,addr=0x80000000,cpu-num=0,file=build_debug/RISCV_bootloader -s -S &
riscv32-elf-gdb -ex "target extended-remote :1234" build_debug/RISCV_bootloader
pkill -SIGKILL -f qemu-system-riscv32
# si -> single instruction
# i r -> info registers



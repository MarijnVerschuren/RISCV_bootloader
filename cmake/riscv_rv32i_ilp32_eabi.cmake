set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR riscv)

#set(CMAKE_C_COMPILER_WORKS 1)

set(CMAKE_C_COMPILER    riscv_rv32i_ilp32_eabi_gcc)
set(CMAKE_CXX_COMPILER  riscv_rv32i_ilp32_eabi_cpp)
set(CMAKE_C_COMPILER_ID GNU)
set(CMAKE_CXX_COMPILER_ID GNU)
set(CMAKE_C_COMPILER_FORCED TRUE)
set(CMAKE_CXX_COMPILER_FORCED TRUE)

set(CMAKE_AS            /opt/riscv/bin/riscv_rv32i_ilp32_eabi_as)
set(CMAKE_AR            /opt/riscv/bin/riscv_rv32i_ilp32_eabi_ar)
set(CMAKE_OBJCOPY       /opt/riscv/bin/riscv_rv32i_ilp32_eabi_objcopy)
set(CMAKE_OBJDUMP       /opt/riscv/bin/riscv_rv32i_ilp32_eabi_objdump)
set(CMAKE_SIZE          /opt/riscv/bin/riscv_rv32i_ilp32_eabi_size)
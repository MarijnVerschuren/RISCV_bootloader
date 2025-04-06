cmake_minimum_required(VERSION 3.0)

# project name
project(RISCV_bootloader C ASM)

# toolchain
set(CMAKE_TOOLCHAIN_FILE "cmake/riscv-rv32i_ilp32_eabi.cmake")

# select linker script
set(LINKER_SCRIPT "lnk/CH592.ld")

# define CPU OPTIONS
set(CPU_OPTIONS -march=rv32i -mabi=ilp32)

# optimizations (-O0 -O1 -O2 -O3 -Os -Ofast -Og -flto)
set(CMAKE_C_FLAGS_DEBUG "-Og -g -DDEBUG")
set(CMAKE_CXX_FLAGS_DEBUG "-Og -g")
set(CMAKE_C_FLAGS_RELEASE "-Os -flto")
set(CMAKE_CXX_FLAGS_RELEASE "-Os -flto")

add_compile_options(
        ${CPU_OPTIONS}
        $<$<COMPILE_LANGUAGE:C>:-std=c11>
        -fstrict-volatile-bitfields
        -ffunction-sections
#        -Werror
#        -Wall
#        -Wextra
        -Wcast-align
        -Wconversion
        -Wsign-conversion
        -Wshadow
        -Wlogical-op
        -Wsuggest-final-types
        -Wsuggest-final-methods
        -pedantic
)

include_directories(
        "inc/"
)

link_directories(
        ${CMAKE_SOURCE_DIR}
)

# list of modules to build final firmware
add_executable(${PROJECT_NAME}
        src/vector.s
        src/startup.s
		src/main.c
)

target_link_libraries(${PROJECT_NAME}
        ${CPU_OPTIONS}
        -T${LINKER_SCRIPT}
        -nostartfiles
		-ffreestanding
        -nostdlib
)

set_property(TARGET ${PROJECT_NAME} PROPERTY LINK_DEPENDS ${CMAKE_SOURCE_DIR}/${LINKER_SCRIPT})

include("cmake/flash.cmake")

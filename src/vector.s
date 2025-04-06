.global IVT
.global default_handler


# interrupt vector table
.section .vector, "ax", %progbits
.type IVT, %object
.option norvc
IVT:
j reset_handler
.word NMI_handler
.word EXC_handler
.word 0
.word kernel_mode_handler
.word 0
.word 0
.word user_mode_handler
.word debug_handler
.word sys_tick_handler
# TODO: more interrupts
.size IVT, .-IVT



# default handler
.section .text.default_handler, "ax", %progbits
.option rvc
default_handler:
	j default_handler
.size default_handler, .-default_handler


# weak definitions
.weakref NMI_handler,			default_handler
.weakref EXC_handler,			default_handler
.weakref kernel_mode_handler,	default_handler
.weakref user_mode_handler,		default_handler
.weakref debug_handler,			default_handler
.weakref sys_tick_handler,		default_handler

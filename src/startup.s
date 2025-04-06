.global reset_handler

.extern main



.section .text.reset_handler
.type reset_handler, %function
reset_handler:
    la x2, _stack_end
    jal main
    ebreak
    j .
.size reset_handler, .-reset_handler

SECTIONS {
	. = ORIGIN(FLASH);

	.vector ALIGN(4) : {
		_IVT_start = .;
		KEEP(*(.vector))
		. = ALIGN(4);
		_ITV_end = .;
	} > FLASH

	.text ALIGN(4) : {
		_text_start = .;
		KEEP(*(.text))
		KEEP(*(.text*))
		. = ALIGN(4);
		_text_end = .;
	} > FLASH

	.rodata ALIGN(4) : {
		KEEP(*(.rodata))
		KEEP(*(.rodata*))
		. = ALIGN(4);
	} > FLASH
}
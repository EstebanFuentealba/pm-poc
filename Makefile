TARGET = helloworld

C_SOURCES := src/isr.c src/main.c src/print.c src/font_6x8.c
ASM_SOURCES := src/startup.asm

include /opt/c88-pokemini/pm.mk

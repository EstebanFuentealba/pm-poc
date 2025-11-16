TARGET = helloworld

C_SOURCES := src/isr.c src/main.c src/print.c src/font_6x8.c
ASM_SOURCES := src/startup.asm

# Detectar si estamos en GitHub Actions o Docker
ifeq ($(GITHUB_ACTIONS),true)
    PM_BASE := $(HOME)/c88-pokemini
else
    PM_BASE := /opt/c88-pokemini
endif

include $(PM_BASE)/pm.mk

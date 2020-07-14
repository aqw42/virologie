OS := $(shell uname)

####### MACOS #######
ifeq ($(OS),Darwin)
	DIR = ./macos
	NASM = nasm -f macho64
	LINKER = clang -arch x86_64
endif

####### LINUX #######
ifeq ($(OS),Linux)
	DIR = ./linux
	NASM = nasm -f elf64
	LINKER = gcc
endif

all: Colleen Grace Sully

clean:
	rm -rf */*.o Colleen Grace Sully Sully_*.asm Grace_kid.asm a.out

Colleen: $(DIR)/Colleen.o
	$(LINKER) $(DIR)/Colleen.o -o Colleen

Grace: $(DIR)/Grace.o
	$(LINKER) $(DIR)/Grace.o -o Grace

Sully: $(DIR)/Sully.o
	$(LINKER) $(DIR)/Sully.o -o Sully

$(DIR)/%.o: $(DIR)/%.asm
	$(NASM) $<

.SILENT:

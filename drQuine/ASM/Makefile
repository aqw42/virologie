OS := $(shell uname)

####### MACOS #######
ifeq ($(OS),Darwin)
	DIR = ./macos
	NASM = echo
	LINKER = echo
endif

####### LINUX #######
ifeq ($(OS),Debian)
	DIR = ./linux
	NASM = nasm -f elf64
	LINKER = gcc -no-pie -nostartfiles 
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

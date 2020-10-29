#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <strings.h>
#include <string.h>
#include <stdbool.h>
#include <elf.h>

#define ERROR(s) write(2, "Error : "s"\n", strlen("Error : "s"\n"))
#define EXE_FILENAME "woodie"
#define BUFF_SIZE 4096

struct	packer
{
	int		key;
	size_t	length;
};

bool 	packer(char *file, size_t length);

/* 
 * \brief Verify that the file is an executable in format elf64
 * 
 * \arg content of the binary
 * \arg length of the content
 * 
 * \ret true is okay
 */
bool    is_valid_elf64(char *file, size_t length);

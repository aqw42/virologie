#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <stdbool.h>

#include "haflib.h"

#define ERROR(s) write(2, "Error : "s"\n", strlen("Error : "s"\n"))
#define EXE_FILENAME "woodie"

struct	packer_s
{
	int  key;
	char file[1];
};

bool packer(char *file);


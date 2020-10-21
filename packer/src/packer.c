#include "packer.h"

int	open_exe()
{
	int fd;

	fd = open(EXE_FILENAME, O_WRONLY | O_CREAT, S_IXUSR | S_IXGRP);
	if (fd < 0)
		return -1;
	return fd;
}

bool	packer(char *file)
{
	int    fd = open_exe();
	size_t i  = 0;

	if (fd == -1)
		return false;
	while (file[i])
	{
		char c = file[i] + 1;
		write(fd, &c, 1);
		i++;
	}
	close(fd);
	return true;
}

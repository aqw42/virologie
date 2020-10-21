#include "packer.h"

void usage()
{
	write(1, "./packer filename", 18);
}

char *read_file(char *filename)
{
	int   fd  = 0;
	char *ret = NULL;
	char *tmp = NULL;
	char  buffer[256];

	fd = open(filename, O_RDWR);
	if (fd < 0)
		return NULL;
	bzero(buffer, BUFF_SIZE + 1);
	while (read(fd, buffer, BUFF_SIZE) != 0)
	{
		tmp = ret;
		if (!(ret = ft_strjoin(ret, buffer)))
			return NULL;
		free(tmp);
		if (ft_memchr(buffer, '\0', BUFF_SIZE) != NULL)
			break ;
		bzero(buffer, BUFF_SIZE + 1);
	}
	return ret;
}

int main(int argc, char **argv)
{
	int  fd;
	char *file = NULL;

	if (argc != 2 || *(argv[1]) == '\0')
	{
		usage();
		return EXIT_FAILURE;
	}
	if ((fd = open(argv[1], O_RDWR)) < 0)
	{
		ERROR("File opening");
		return EXIT_FAILURE;
	}
	if ((file = get_the_file(fd)) == NULL)
	{
		close(fd);
		ERROR("File reading");
		return EXIT_FAILURE;
	}	
	if (packer(file) == false)
	{
		close(fd);
		free(file);
		ERROR("packer");
		return EXIT_FAILURE;
	}
	close(fd);
	free(file);
	return EXIT_SUCCESS;
}

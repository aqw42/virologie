#include "packer.h"

/* 
 * \brief Display usage  
 */
void usage()
{
	write(1, "./packer filename", 18);
}

/* 
 * \brief Read a binary file content  
 * 
 * \arg [in]  name of the file to read
 * \arg [out] length read in bytes
 * 
 * \return pointer to content. Need to be freed !
 */
char *read_file(char *filename, size_t *length_arg)
{
	int   	fd  = 0;
	char 	*ret = NULL;
	char	*tmp = NULL;
	char  	buffer[BUFF_SIZE];
	size_t	length = 0;

	fd = open(filename, O_RDWR);
	if (fd < 0)
		return NULL;
	bzero(buffer, BUFF_SIZE);
	while (read(fd, buffer, BUFF_SIZE) > 0)
	{
		length += BUFF_SIZE;
		tmp = realloc(ret, length);
		if (tmp == NULL)
		{
			free(ret);
			return NULL;
		}
		ret = tmp;
		memcpy(&(ret[length - BUFF_SIZE]), buffer, BUFF_SIZE);
		bzero(buffer, BUFF_SIZE);
	}
	*length_arg = length;
	return ret;
}

int main(int argc, char **argv)
{
	char 	*file = NULL;
	size_t	length = 0;

	if (argc != 2 || *(argv[1]) == '\0')
	{
		usage();
		return EXIT_FAILURE;
	}
	if ((file = read_file(argv[1], &length)) == NULL)
	{
		ERROR("File reading");
		return EXIT_FAILURE;
	}
	if (!is_valid_elf64(file, length))
	{
		free(file);
		ERROR("Wrong binary format ! Are you sure it's an Elf64 binary file ?");
		return false;
	}
	if (packer(file, length) == false)
	{
		free(file);
		unlink(EXE_FILENAME);
		ERROR("Packing failed");
		return EXIT_FAILURE;
	}
	free(file);
	return EXIT_SUCCESS;
}

#include "packer.h"

int	open_exe()
{
	int exe_fd;

	exe_fd = open(EXE_FILENAME, O_WRONLY | O_CREAT, S_IRWXU | S_IRWXG);
	if (exe_fd < 0)
		return -1;
	return exe_fd;
}

/*
 * \brief crypt binary file ocntent and write it in the executable
 * 
 * \arg [in] file descriptor of the file we want to write to
 * \arg [out] content to crypt
 * 
 * \return false in case of failure
 */ 
static bool write_crypted_file_in_exe(int exe_fd, char *file, size_t length)
{
	size_t i  = 0;

	while (i <= length)
	{
		file[i] = file[i] + 1;
		i++;
	}
	if (write(exe_fd, file, length) != (ssize_t)length)
		return false;
	return true;
}

static bool write_unpacker_in_exe(int exe_fd)
{
	struct packer header;

	(void)header;
	(void)exe_fd;

	return true;
}

bool	packer(char *file, size_t length)
{
	int    exe_fd = open_exe();

	if (exe_fd == -1)
	{
		ERROR("Opening exe file, maybe already existing " EXE_FILENAME);
		return false;
	}
	if (!write_unpacker_in_exe(exe_fd))
	{
		close(exe_fd);
		return false;
	}
	if (!write_crypted_file_in_exe(exe_fd, file, length))
	{
		close(exe_fd);
		ERROR("Writing crypted file");
		return false;
	}
	close(exe_fd);
	return true;
}

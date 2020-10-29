#include "packer.h"

bool    is_valid_elf64(char *file, size_t length)
{
    Elf64_Ehdr header = {0};
 
    if (length < sizeof(Elf64_Ehdr))
        return false;

    memcpy(&header, file, sizeof(Elf64_Ehdr));
    if (header.e_ident[EI_MAG0] != ELFMAG0 ||
        header.e_ident[EI_MAG1] != ELFMAG1 ||
        header.e_ident[EI_MAG2] != ELFMAG2 ||
        header.e_ident[EI_MAG3] != ELFMAG3 ||
        header.e_ident[EI_CLASS] != ELFCLASS64 ||
        header.e_ident[EI_VERSION] != EV_CURRENT ||
        header.e_type != ET_EXEC)
        return false;
    return true;
}

/*
bool    add_header_section(char *file, size_t length)
{
    
}*/
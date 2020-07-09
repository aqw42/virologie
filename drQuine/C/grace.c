#include <stdio.h>
#include <fcntl.h>

//q
int	main(void)
{	
	int a = 0;
	char *s = "#include <stdio.h>%c#include <fcntl.h>%c%c//q%cint\tmain(void)%c{%c\t//q%c\tint a = 0;%c\tchar *s = %c%s%c;%c\ta = open(%c./grace_kid.c%c, O_RDWR | O_CREAT | S_IRWXU);%c\tdprintf(a, s, 10, 10, 10, 10, 10, 10, 10, 10, 34, s, 34, 10, 34, 34, 10, 10);%c}";
	a = open("./grace_kid.c", O_RDWR | O_CREAT | S_IRWXU);
	dprintf(a, s, 10, 10, 10, 10, 10, 10, 10, 10, 34, s, 34, 10, 34, 34, 10, 10);
}

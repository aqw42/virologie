#include <stdio.h>

void func(){
}
//q
int	main(void)
{
	//q
	char *s = "#include <stdio.h>%c%cvoid func(){%c}%c//q%cint	main(void)%c{%c	//q%c	char *s = %c%s%c;%c	printf(s, 10, 10, 10, 10, 10, 10, 10, 10, 34, s, 34, 10, 10);%c}";
	printf(s, 10, 10, 10, 10, 10, 10, 10, 10, 34, s, 34, 10, 10);
}
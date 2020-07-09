#include <stdio.h>
#include <fcntl.h>
//defines
#define LAUNCH int main(){int a = 0; char *s = CODE; PRINT}
#define PRINT  a = open("./grace_kid.c", O_RDWR | O_CREAT, 0777); dprintf(a, s, 10, 10, 10, 10, 34, 34, 10, 34, s, 34, 10, 10);
#define CODE "#include <stdio.h>%c#include <fcntl.h>%c//defines%c#define LAUNCH int main(){int a = 0; char *s = CODE; PRINT}%c#define PRINT  a = open(%c./grace_kid.c%c, O_RDWR | O_CREAT, 0777); dprintf(a, s, 10, 10, 10, 10, 34, 34, 10, 34, s, 34, 10, 10);%c#define CODE %c%s%c%cLAUNCH%c"
LAUNCH

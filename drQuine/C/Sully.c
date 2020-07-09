#include <stdio.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>

#define LAUNCH int main(){ INIT if (x) {PRINT COMPILE}}
#define INIT int fd = 0; int x = 5; char command[124]; char *s = CODE;
#define PRINT snprintf(command, 124, "%s%d%s", "Sully_", x, ".c"); fd = open(command, O_RDWR | O_CREAT, 0777); dprintf(fd, s, s, 10, 34, 37, x - 1);
#define COMPILE snprintf(command, 124, "%s%d%s", "gcc Sully_", x, ".c; ./a.out"); system(command);
#define CODE "#include <stdio.h>%2$c#include <fcntl.h>%2$c#include <string.h>%2$c#include <stdlib.h>%2$c%2$c#define LAUNCH int main(){ INIT if (x) {PRINT COMPILE}}%2$c#define INIT int fd = 0; int x = %5$d; char command[124]; char *s = CODE;%2$c#define PRINT snprintf(command, 124, %3$c%4$cs%4$cd%4$cs%3$c, %3$cSully_%3$c, x, %3$c.c%3$c); fd = open(command, O_RDWR | O_CREAT, 0777); dprintf(fd, s, s, 10, 34, 37, x - 1);%2$c#define COMPILE snprintf(command, 124, %3$c%4$cs%4$cd%4$cs%3$c, %3$cgcc Sully_%3$c, x, %3$c.c; ./a.out%3$c); system(command);%2$c#define CODE %3$c%1$s%3$c%2$cLAUNCH"
LAUNCH

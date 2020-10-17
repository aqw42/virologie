#include <stdio.h>

int ft_strlen(char *str);
int ft_strlen2(char *str);

int main(int av, char **ac)
{
    int a = ft_strlen("prout");
    int b = ft_strlen2("prout");

    printf("%d %d\n", a, b);
    return (0);
}
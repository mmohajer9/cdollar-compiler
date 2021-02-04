#include <stdio.h>

int main(int argc, char const *argv[])
{   
    int a = -(2 + 2 * 2);


    if(a++)
        printf("a is %d : if" , a);
    else
        printf("a is %d : else" , a);


    return 0;
}

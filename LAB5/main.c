#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

void INThandler (int sig)
{
    fork();
}

int main()
{
    signal(SIGINT, INThandler);
    int counter = 0;
    while (1)
    {
        printf("Counter is: %d", counter);
        printf("\n");
        counter++;
        sleep(2);
    }
    return 0;
}

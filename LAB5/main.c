#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

void INThandler (int sig)
{
    pid_t pid;
    pid = fork();
    
    if(pid != 0){
        exit(0);
    }
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

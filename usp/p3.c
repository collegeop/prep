#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <dirent.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <time.h>
int main(int argc, char* argv[]){
    struct dirent* dirp;
    DIR* dp;
    struct stat mystat;
    dp = opendir(".");
    while ((dirp = readdir(dp))!=NULL)
    {
        printf("Name: %s\n",dirp->d_name);
        lstat(dirp->d_name,&mystat);
        printf("UID :%d\n",mystat.st_uid);
        printf("GID :%d\n",mystat.st_gid);
        printf("Access Time :%s\n",ctime(&mystat.st_atime));
        printf("Modification Time :%s\n\n\n",ctime(&mystat.st_atime));
    }
    
}
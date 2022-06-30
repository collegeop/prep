#include <stdio.h>
#include <string.h>
int main()
{
    FILE *fp;
    char line[100];
    fp = fopen("text1.txt", "r");
    if (!fp)
    {
        printf("File cant be opened\n");
        return 0;
    }
    printf("File opened correctly!\n");

    for (int lineno = 1; fgets(line, sizeof(line), fp); lineno++)
    {
        int found = 0, flag = 0;
        for (int i = 0; i < strlen(line); i++)
            if (line[i] == '"')
            {
                flag = !flag;
                found = 1;
            }

        if (found)
        {
            if (flag)
                printf("\n Unterminated string in line %d. String Has to be closed", lineno);
            else
                printf("\n String usage in line %d is validated!", lineno);
        }
    }
    return 0;
}

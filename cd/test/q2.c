#include <stdio.h>
#include <string.h>
int main()
{
	FILE *fp;
	char line[100];
	int isOpen = 0, openlineno;
	
	fp = fopen("text2.txt", "r");
	if (!fp)
	{
		printf("File cant be opened\n");
		return 0;
	}
	printf("File opened correctly!\n");

	for (int lineno = 1; fgets(line, sizeof(line), fp); lineno++)
	{
		if (isOpen)
			printf("\n%s", line);
		if (strstr(line, "/*") && !isOpen)
		{
			isOpen = 1;
			openlineno = lineno;
			printf("\n%s", line);
		}
		if (strstr(line, "*/") && isOpen)
			printf("\nComment is displayed above!\nComment opened in line no %d and closed in line no %d", openlineno, lineno);
	}
	if (isOpen)
		printf("\nUnterminated comment in begin in line no %d. It Has to be closed", openlineno);
	return 0;
}

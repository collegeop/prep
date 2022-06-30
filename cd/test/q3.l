%{
#include <stdio.h>
int c = 1;
%}

%option noyywrap 

%%
\n { c++; }
\"[a-zA-Z0-9]*\" {
    ECHO;
    printf(" Valid String in line number %d\n ", c);
} 
\"[a-zA-Z0-9]* {
    ECHO; 
    printf(" InValid String in line number %d\n ",c);
}
. ;
%%
int main()
{
    yyin = fopen("text3.txt", "r");
    yylex();
    fclose(yyin);
    return 0;
}

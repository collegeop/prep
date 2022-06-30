%{
#include<stdio.h>
int c=1; 
%}

%option noyywrap 
number [0-9]+(\.[0-9])?[0-9]*
invalid [0-9]+(".")[0-9]*((".")[0-9]*)+

%%
\n { c++; }
{number} {
    printf("\nValid number in line number %d : ",c);
    ECHO;
    printf("\n");
}
{number}[a-zA-Z0-9_]+ {
    printf("\nInvalid number in line number %d: Number followed with alphabets is invalid",c);
    ECHO;
    printf("\n");
}
{invalid} {
    printf("\nInvalid number in line number %d: Number with more than one decimal point sis invalid",c);
    ECHO;
    printf("\n");
}
. ; 
%%
int main()
{ 
    yyin = fopen("text5.txt","r"); 
    yylex();
    fclose(yyin);
    return 0;
}


%{
#include<stdio.h> 
int c=1;
%}

%option noyywrap 
%s DECLARE  
identifier [a-zA-Z_][a-zA-Z0-9_]* 
number [0-9]+(\.[0-9])?[0-9]* 
string \"[a-zA-Z0-9]+\"

%%
\n {c++;}
"int "|"float " {BEGIN DECLARE;ECHO;}
<DECLARE>{identifier}(={number})?, {ECHO;}
<DECLARE>{identifier}(={number})?; {
    BEGIN 0;
    ECHO;
    printf("\nValid declaration\n");
}
<DECLARE>{identifier}("="{string}) {
    printf("\n Invalid variable declaration in line no %d; string can't be assigned to integer or float variable:",c);
    ECHO;
    printf("\n");
}
<DECLARE>[,]+ {
    printf("\n Invalid usage of more than one comma in declaration in line no %d",c);
    BEGIN DECLARE;
    ECHO;
    printf("\n");
}
. ; 
%%

int main()
{ 
    yyin = fopen("text6.txt","r"); 
    yylex();
    fclose(yyin);
    return 0;
}

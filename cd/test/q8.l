%{
#include<stdio.h> 
int c=1, flag=0;
%}

%option noyywrap 
%s COMMENT

%%
\n {c++;}
"/*" {
    BEGIN COMMENT;
    printf("Comment begins in line no : %d.....\n", c);
    ECHO;
    flag=1;
}
<COMMENT>"*/" {
    BEGIN 0;
    ECHO;
    flag=0;
    printf("\nComment ends in line no : %d.....\n\n", c);
}
<COMMENT>. {ECHO;}
. ; 
%%

int main()
{ 
    yyin=fopen("text8.txt","r"); 
    yylex(); 
    fclose(yyin); 
    if(flag)
        printf("\nComment is not closed till the end of file!");
    return 0;
}

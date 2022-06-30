%{
#include<stdio.h> 
int c=1;  
%}

%option noyywrap 
operator [-+*/]
identifier [a-zA-Z_][a-zA-Z0-9_]*
number [0-9]+(\.[0-9])?[0-9]*
expression ({identifier}|{number}){operator}({identifier}|{number})

%%
\n { c++; }
^#.+ ;
^(int\s|float\s|char\s).+ ;
(void|int)\smain\(\) ;
{identifier}=({expression}+;) { 
    printf("Valid expression in line no : %d\t",c);
    ECHO;
    printf("\n");
}
{identifier}=({number};|{identifier};) { 
    printf("Valid expression in line no : %d\t",c);
    ECHO;
    printf("\n");
}
({number}|([0-9]*[a-zA-Z0-9-]+))={expression}+ { 
    printf("Invalid expression in line no : %d; Lvalue should satisfy the identifier rules\t",c);
    ECHO;
    printf("\n");
}
{identifier}=; { 
    printf("Invalid expression in line no : %d; R-value required; Expression is needed at right hand side of assignment operation\t",c);
    ECHO;
    printf("\n");
}
{operator}{operator}+ {
    printf("Invalid expression in line no: %d; More than one operator can't be used in expression consequetively",c);
    ECHO;
    printf("\n");
}
. ;
%%

int main() {
    yyin=fopen("text4.txt","r"); 
    yylex(); 
    fclose(yyin);
    return 0;
}

%{
#include<stdio.h> 
int c=1, bc=0, fc=0;
%}

%option noyywrap 
%s IF B1 B2
%%

\n { c++; }
"if" {
    BEGIN IF;
    ECHO;
}
<IF>\s {ECHO;}
<IF>\( {
    BEGIN B1;
    bc++;
    ECHO;
}
<B1>\( {
    bc++;
    ECHO;
}
<B1>\) {
    bc--;
    ECHO;
}
<B1>\{ {
    ECHO;
    if(bc==0)
    {
        BEGIN B2;
        fc++;
    }
    else{
        printf("\nInvalid if statement, not all closed\n");
        BEGIN 0;
        bc=0;
        fc=0;
    }
}
<B1>. {ECHO;}
<B2>\} {
    ECHO;
    fc--;
    if(fc==0){
        printf("\nValid\n");
        BEGIN 0;
    }
}
<B2>\{ {
    ECHO;
    fc++;
}
<B2>. {ECHO;}
. ; 
%%  
int main() {
    yyin=fopen("text7.txt","r"); 
    yylex();
    fclose(yyin);
    return 0;
}

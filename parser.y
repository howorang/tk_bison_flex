/*RPN Parser*/
%{
#include "global.h"
#include <stdlib.h>
%}

%define parse.error verbose
%token DIV
%token NUM
%token ID
%token MOD
%token NONE
%token DONE


%%
prog:
    expr ';'
    | prog expr ';'

expr:
    term
    | term '+' term  {emit($2, NONE);}
    | term '-' term  {emit($2, NONE);}

term:
    factor
     | factor '*' factor {emit($2, NONE);}
     | factor '/' factor {emit($2, NONE);}
     | factor DIV factor {emit($2, NONE);}
     | factor MOD factor {emit($2, NONE);}
factor:
     '(' expr ')' {$$ = $2;}
     | NUM
     {
        $$ = $1;
        emit(NUM, $$);
     }
     | ID
     {
        $$ = $1;
        emit(ID, $$);
     }


%%
yyerror(char *s)
{
error(s);
printf("tokenval %d", yylval);
}
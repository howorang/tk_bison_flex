/*RPN Lexer*/
%{
#include "global.h"
#include <stdlib.h>
int tokenval;
int lineno = 0;
%}

%option noyywrap

NUM   [0-9]
ID    [A-Z]+
NEWLINE "\n"
WHITE "\t"," "

%%
{NUM}+          {
                    tokenval = atoi(yytext);
                    return NUM;
                }
{ID}            {
                    int p;
                    p = lookup (yytext);
                    if (p == 0)
                    {
                        p = insert (yytext, ID);
                    }
                    tokenval = p;
                    return symtable[p].token;
                }
<<EOF>>         {
                    return DONE;
                }
.               {
                    tokenval = NONE;
                    return yytext[0];
                }
{NEWLINE}       {
                    lineno++;
                }
{WHITE}         {}
%%
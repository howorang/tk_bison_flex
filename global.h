#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include "parser.tab.h"

#define BSIZE 128
#define EOS '\0'
extern int lineno;
extern int yylex (void);
struct entry
{
  char *lexptr;
  int token;
};
extern struct entry symtable[];
int insert (char s[], int tok);
void error (const char *m) ;
int lookup (char s[]) ;
void init () ;
void emit (int t, int tval) ;
extern FILE *yyin, *yyout;
extern int yyparse (void);
extern int yylval;

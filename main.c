#include "global.h"
int
main (int argc, char** argv)
{
  ++argv, --argc;
  yyin = fopen(argv[0], "r");
  init ();
  parse ();
  exit (0);
}



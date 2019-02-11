compiler : emitter.o error.o init.o lex.yy.o parser.tab.o symbol.o main.o
	g++ -o compiler emitter.o error.o init.o lex.yy.o parser.tab.o symbol.o main.o
emitter.o: emitter.c global.h parser.tab.h
	g++ -c emitter.c global.h parser.tab.h
error.o: error.c global.h parser.tab.h
	g++ -c error.c global.h parser.tab.h
init.o: init.c global.h parser.tab.h
	g++ -c init.c global.h parser.tab.h
lex.yy.o: lex.yy.c global.h parser.tab.h
	g++ -c lex.yy.c global.h parser.tab.h
parser.tab.o: parser.tab.h parser.tab.c global.h
	g++ -c parser.tab.h parser.tab.c global.h
symbol.o: symbol.c global.h parser.tab.h
	g++ -c symbol.c global.h parser.tab.h
main.o: main.c global.h parser.tab.h
	g++ -c main.c global.h parser.tab.h
lex.yy.c : lexer.lex global.h
	flex -o lex.yy.c lexer.lex
parser.tab.c : parser.y global.h
	bison -o parser.tab.c parser.y -d -t
parser.tab.h : parser.y global.h
	bison -o parser.tab.c parser.y -d -t


final: parser.tab.c lex.yy.c
	clear
	gcc -g lex.yy.c parser.tab.c -o run -lm

parser.tab.c: src/parser.y
	clear
	bison -dv -t src/parser.y

lex.yy.c: src/scanner.l
	clear
	flex src/scanner.l

clean: 
	clear
	rm -rf *.o run *.output
	rm -rf y.tab.*
	rm -rf lex.yy.c
	rm -rf scanner.tab.*
	rm -rf parser.tab.*

# target:dependecies
# 	action

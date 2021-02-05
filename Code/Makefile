final: parser.tab.cpp lex.yy.cpp
	clear
	g++ -std=c++17 -g ./dist/lex.yy.cpp ./dist/parser.tab.cpp ./src/symboltable/symbol.cpp -o ./dist/run -lm

parser.tab.cpp: src/parser.ypp
	clear
	bison -dv -t src/parser.ypp -o ./dist/parser.tab.cpp

lex.yy.cpp: src/scanner.l
	clear
	flex -o ./dist/lex.yy.cpp src/scanner.l


test: dist/run
	clear
	./dist/run ./tests/test.in

clean: 
	clear
	rm -rf *.o run *.output
	rm -rf y.tab.*
	rm -rf lex.yy.*
	rm -rf scanner.tab.*
	rm -rf parser.tab.*
	rm -rf ./dist/*

# target:dependecies
# 	action

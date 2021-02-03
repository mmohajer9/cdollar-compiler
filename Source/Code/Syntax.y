%{
#include <stdio.h>
#include <stdlib.h>
%}


%union{
	int Iint;
	char Ichar;
	char* Istring;
}

%token VOID IF RETURN INT ELSE MAIN FOR BREAK CHAR WHILE CONTINUE ELSEIF
%token SPACE NewLine
%token SO_Plus SO_Minus SO_Multiply SO_Divide SO_Less SO_LessEq SO_Eq SO_NotEq SO_Great
%token SO_GreateEq SO_Or SO_And SO_LogOr SO_LogAnd SO_Xor SO_Not
%token ST_ParenLEFT ST_ParenRIGHT ST_CurBroLEFT ST_CurBroRIGHT ST_BroLEFT ST_BroRIGHT ST_Dollar ST_Comma
%token <Ichar> LChar UChar
%token <Istring> Lword Uword
%token <Iint>	INT



%%

%%


int main(int argc, char *argv[])
{
    yyin = fopen(argv[1], "r");

    if(!yyparse())
		printf("\nParsing complete\n");
	else
	{
		printf("\nParsing failed\n");
		exit(0);
	}
	
	fclose(yyin);
    return 0;
}
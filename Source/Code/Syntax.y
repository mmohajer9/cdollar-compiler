%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(char *s);

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
%token Variable
%token <Ichar> LChar UChar
%token <Istring> Lword Uword
%token <Iint>	Num



%%

PROGRAM :   FUNCTION MAIN_Prog 

FUNCTION:   INT   WhiteSpace Variable WhiteSpace ST_ParenLEFT ARGUMENTS ST_ParenRIGHT WhiteSpace ST_CurBroLEFT  PROG  RETURN NUM ST_Dollar ST_CurBroRIGHT   
			|VOID WhiteSpace Variable WhiteSpace ST_ParenLEFT ARGUMENTS ST_ParenRIGHT WhiteSpace ST_CurBroLEFT  PROG  ST_CurBroRIGHT
			|FUNCTION
			|;
			
MAIN_Prog:	INT   WhiteSpace MAIN WhiteSpace ST_ParenLEFT ARGUMENTS ST_ParenRIGHT WhiteSpace ST_CurBroLEFT  PROG  RETURN NUM ST_Dollar ST_CurBroRIGHT   
			|VOID WhiteSpace MAIN WhiteSpace ST_ParenLEFT ARGUMENTS ST_ParenRIGHT WhiteSpace ST_CurBroLEFT  PROG  ST_CurBroRIGHT; 

			
IF_STATE:	IF WhiteSpace ST_ParenLEFT  CONDITION ST_ParenRIGHT ST_CurBroLEFT  PROG  ST_CurBroRIGHT WhiteSpace ELIF_STATE
ELIF_STATE:	ELSEIF WhiteSpace ST_ParenLEFT CONDITION ST_ParenRIGHT ST_CurBroLEFT  PROG  ST_CurBroRIGHT WhiteSpace ELIF_STATE | ELSE_STATE;
ELSE_STATE: ELSE WhiteSpace ST_ParenLEFT CONDITION ST_ParenRIGHT ST_CurBroLEFT  PROG  ST_CurBroRIGHT ELIF_STATE |; 



CONDITION:	WhiteSpace Variable WhiteSpace CHECK_CONDITION WhiteSpace Variable WhiteSpace
			|WhiteSpace ST_ParenLEFT  CONDITION ST_ParenRIGHT WhiteSpace MULTI_CONDITION;
MULTI_CONDITION: SO_And CONDITION|SO_LogOr CONDITION |SO_LogAnd CONDITION |SO_Xor CONDITION | SO_Not CONDITION |;			
CHECK_CONDITION: SO_Less | SO_LessEq | SO_Eq | SO_NotEq | SO_Great | SO_GreateEq 
				
				
				
ARGUMENTS:	ARGUMENTS1|;	
ARGUMENTS1:	TYPE WhiteSpace Variable WhiteSpace ARGUMENTS2;
ARGUMENTS2:	ST_Comma WhiteSpace ARGUMENTS1 |; 
 
ASSIGN:		WhiteSpace TYPE WhiteSpace Variable WhiteSpace SO_Eq EXP ST_Dollar
			
WhiteSpace:	SPACE WhiteSpace | ;
TYPE:	    INT|CHAR

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

void yyerror(char *s) {
	printf("Syntex Error in line number : %d : %s %s\n", yylineno, s, yytext );
}
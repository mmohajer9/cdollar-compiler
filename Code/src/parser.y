%{
	#include <stdio.h> 
	#include <stdlib.h>
	#include <ctype.h>
	#include <math.h>
	#include <string.h>

	int yyparse();
	void yyerror(const char *s);

	extern FILE* yyin;
	extern int yylex();
	
%}

%define parse.error verbose

%union{

	int intVal;
	char charVal;
	char* stringVal;

}



%token KW_VOID KW_IF KW_RETURN KW_INT KW_ELSE KW_MAIN KW_FOR KW_BREAK KW_CHAR KW_WHILE KW_CONTINUE KW_ELSEIF

%token WHITESPACE NEW_LINE OTHER

%token OP_ASSIGN OP_PLUS OP_MINUS OP_MULTIPLY OP_DIVIDE 
%token OP_LESS OP_LESS_EQUAL OP_EQUAL OP_NOT_EQUAL OP_GREATER OP_GREATER_EQUAL 
%token OP_BITWISE_OR OP_BITWISE_AND OP_BITWISE_XOR 
%token OP_LOGICAL_OR OP_LOGICAL_AND OP_LOGICAL_NOT 
%token ST_LPAR ST_RPAR ST_LCURL ST_RCURL ST_LBR ST_RBR 
%token ST_DOLLAR ST_COMMA

%token <charVal> LCHAR UCHAR
%token <stringVal> VARIABLE
%token <intVal>	NUMBER

%start program


%%


program   :   functions main

functions :   function functions | 

function  :   KW_INT WHITESPACE VARIABLE WHITESPACE ST_LPAR ARGUMENTS ST_RPAR WHITESPACE ST_LCURL  stmts  KW_RETURN KW_INT ST_DOLLAR ST_RCURL
			  |
			  KW_VOID WHITESPACE VARIABLE WHITESPACE ST_LPAR ARGUMENTS ST_RPAR WHITESPACE ST_LCURL  stmts  KW_RETURN ST_RCURL
			  |
			  KW_VOID WHITESPACE VARIABLE WHITESPACE ST_LPAR ARGUMENTS ST_RPAR WHITESPACE ST_LCURL  stmts  ST_RCURL
			  
main:		  KW_INT WHITESPACE KW_MAIN WHITESPACE ST_LPAR ARGUMENTS ST_RPAR WHITESPACE ST_LCURL  stmts  KW_RETURN KW_INT ST_DOLLAR ST_RCURL   
			  |
			  KW_VOID WHITESPACE KW_MAIN WHITESPACE ST_LPAR ARGUMENTS ST_RPAR WHITESPACE ST_LCURL  stmts  KW_RETURN ST_RCURL
			  |
			  KW_VOID WHITESPACE KW_MAIN WHITESPACE ST_LPAR ARGUMENTS ST_RPAR WHITESPACE ST_LCURL  stmts  ST_RCURL; 

			

stmts: 		  stmts ifstmt | ..... | 

ifstmt: 	  matched | unmatched

matched: 	  KW_IF WHITESPACE ST_LPAR WHITESPACE expression WHITESPACE ST_RPAR WHITESPACE ST_LCURL stmts ST_RCURL WHITESPACE KW_ELSE WHITESPACE ST_LCURL stmts ST_RCURL
			  |
			  KW_IF WHITESPACE ST_LPAR WHITESPACE expression WHITESPACE ST_RPAR WHITESPACE ST_LCURL stmts ST_RCURL WHITESPACE elseif

elseif:        KW_ELSEIF WHITESPACE ST_LPAR WHITESPACE expression WHITESPACE ST_RPAR WHITESPACE ST_LCURL stmts ST_RCURL WHITESPACE elseif
			  |
			  else

else:         KW_ELSE WHITESPACE ST_LPAR WHITESPACE expression WHITESPACE ST_RPAR WHITESPACE ST_LCURL stmts ST_RCURL

unmatched:    KW_IF WHITESPACE ST_LPAR WHITESPACE expression WHITESPACE ST_RPAR WHITESPACE ST_LCURL stmts ST_RCURL






expression:	WHITESPACE VARIABLE WHITESPACE CHECK_expression WHITESPACE VARIABLE WHITESPACE
			|WHITESPACE ST_LPAR  expression ST_RPAR WHITESPACE MULTI_expression;
MULTI_expression: SO_And expression|SO_LogOr expression |SO_LogAnd expression |SO_Xor expression | SO_Not expression |;			
CHECK_expression: SO_Less | SO_LessEq | SO_Eq | SO_NotEq | SO_Great | SO_GreateEq 
				
				
ARGUMENTS:	ARGUMENTS1|;	
ARGUMENTS1:	TYPE WHITESPACE VARIABLE WHITESPACE ARGUMENTS2;
ARGUMENTS2:	ST_Comma WHITESPACE ARGUMENTS1 |; 
 
ASSIGN:		WHITESPACE TYPE WHITESPACE VARIABLE WHITESPACE SO_Eq EXP ST_Dollar
			
TYPE:	    INT|CHAR

%%








int main(int argc, char *argv[])
{
    yyin = fopen(argv[1], "r");

	// it will be called in the expression of if
    if(!yyparse())
		printf("\nParsing Complete\n");
	else
	{
		fprintf(stderr,"\nParsing Failed\n");
		exit(0);
	}
	
	// closing the opened file
	fclose(yyin);
    return 0;
}

void yyerror(const char *s) {
	fprintf(stderr,"Syntex Error in line number : %d : %s %s\n", yylineno, s, yytext);
}
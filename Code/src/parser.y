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
	extern int yylineno;
	extern char* yytext;
	
%}

%define parse.error verbose

%union{

	int intVal;
	char charVal;
	char* stringVal;

}



%token KW_VOID KW_IF KW_RETURN KW_INT KW_ELSE KW_MAIN KW_FOR KW_BREAK KW_CHAR KW_WHILE KW_CONTINUE KW_ELSEIF

%token NEW_LINE OTHER

%token OP_ASSIGN OP_PLUS OP_MINUS OP_MULTIPLY OP_DIVIDE 
%token OP_LESS OP_LESS_EQUAL OP_EQUAL OP_NOT_EQUAL OP_GREATER OP_GREATER_EQUAL 
%token OP_BITWISE_OR OP_BITWISE_AND OP_BITWISE_XOR 
%token OP_LOGICAL_OR OP_LOGICAL_AND OP_LOGICAL_NOT 
%token ST_LPAR ST_RPAR ST_LCURL ST_RCURL ST_LBR ST_RBR 
%token ST_DOLLAR ST_COMMA ST_SEMICOLON

%token <charVal> LCHAR UCHAR
%token <stringVal> IDENTIFIER
%token <intVal>	NUMBER

%start program


%left OP_LOGICAL_OR OP_LOGICAL_AND
%left OP_BITWISE_OR OP_BITWISE_XOR OP_BITWISE_AND
%left OP_EQUAL OP_NOT_EQUAL
%left OP_GREATER OP_GREATER_EQUAL
%left OP_LESS OP_LESS_EQUAL
%left OP_PLUS OP_MINUS
%left OP_MULTIPLY OP_DIVIDE
%left OP_LOGICAL_NOT


%%

program   :   		functions main

functions :   		functions function | 

main:		  		KW_INT KW_MAIN ST_LPAR arguments ST_RPAR ST_LCURL stmts ST_RCURL   
			  		|
			  		KW_VOID KW_MAIN ST_LPAR arguments ST_RPAR ST_LCURL stmts ST_RCURL

function  :   		KW_INT IDENTIFIER ST_LPAR arguments ST_RPAR ST_LCURL stmts ST_RCURL
			  		|
			  		KW_VOID IDENTIFIER ST_LPAR arguments ST_RPAR ST_LCURL stmts ST_RCURL		

stmts: 		  		stmt stmts | 
stmt:		  		stmt_declare | stmt_assignment | stmt_if | stmt_return | stmt_while

type:		  		KW_INT | KW_CHAR
stmt_declare: 		type IDENTIFIER ids
ids:		  		ST_DOLLAR | ST_COMMA IDENTIFIER ids | OP_ASSIGN expression ids

stmt_assignment:	IDENTIFIER OP_ASSIGN expression ST_DOLLAR

stmt_return:  		KW_RETURN expression ST_DOLLAR


stmt_if: 	  		matched | unmatched
matched: 	  		KW_IF ST_LPAR expression ST_RPAR ST_LCURL stmts ST_RCURL elseif
elseif:       		KW_ELSEIF ST_LPAR expression ST_RPAR ST_LCURL stmts ST_RCURL elseif | else	
else:         		KW_ELSE ST_LCURL stmts ST_RCURL
unmatched:    		KW_IF ST_LPAR expression ST_RPAR ST_LCURL stmts ST_RCURL

stmt_while:			KW_WHILE ST_LPAR expression ST_RPAR ST_LCURL loop_stmts ST_RCURL
loop_stmts:			loop_stmts stmts | loop_stmts KW_BREAK ST_DOLLAR | loop_stmts KW_CONTINUE ST_DOLLAR | 



/* for:				KW_FOR ST_LPAR stmt_declare  */

expression: 		expression OP_PLUS expression |
					expression OP_MINUS expression |
					expression OP_MULTIPLY expression |
					expression OP_DIVIDE expression |
					expression OP_LESS expression |
					expression OP_LESS_EQUAL expression |
					expression OP_EQUAL expression |
					expression OP_NOT_EQUAL expression |
					expression OP_GREATER expression |
					expression OP_GREATER_EQUAL expression |
					expression OP_LOGICAL_OR expression |
					expression OP_LOGICAL_AND expression |
					expression OP_BITWISE_OR expression |
					expression OP_BITWISE_AND expression |
					expression OP_BITWISE_XOR expression |

					OP_LOGICAL_NOT expression | 
					OP_MINUS expression |

					ST_LPAR expression ST_RPAR |
					IDENTIFIER | NUMBER


arguments:			args_part1 |
args_part1:			type IDENTIFIER args_part2
args_part2:			ST_COMMA args_part1 |
		

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
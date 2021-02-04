%{ 

	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	
	#include "scanner.tab.h"

	void yyerror_scanner(const int n);

	int yylex();

%}

%option noyywrap

%% 
"void"			{return KW_VOID;}
"if"			{return KW_IF;}	
"return"		{return KW_RETURN;}
"int"			{return KW_INT;}
"else"			{return KW_ELSE;}
"main"			{return KW_MAIN;}
"for"			{return KW_FOR;}
"break"			{return KW_BREAK;}
"char"			{return KW_CHAR;}
"while"			{return KW_WHILE;}
"continue"		{return KW_CONTINUE;}
"elseif"		{return KW_ELSEIF;}

"'"[a-z]"'" 		{	yylval.Ichar = strdup(yytext);
						return LCHAR;
					}
"'"[A-Z]"'" 		{	yylval.Ichar = strdup(yytext);
						return UCHAR;
					}


("_"|[a-zA-Z])("_"|[a-zA-Z]|[0-9])* {return VARIABLE}


[a-z]+ 			{	yylval.Istring = strdup(yytext);
					return Lword;
				}
				
[A-Z]+ 			{	yylval.Istring = strdup(yytext);
					return UWord;
				}
				
[0-9]+ 			{   yylval.Iint = strdup(yytext);
					return NUMBER;
				}

"="			{return OP_ASSIGN;}

"+"			{return OP_PLUS;}
"-"			{return OP_MINUS;}
"*"			{return OP_MULTIPLY;}
"/"			{return OP_DIVIDE;}
"<"			{return OP_LESS;}
"<="		{return OP_LESS_EQUAL;}

"=="		{return OP_EQUAL;}			
"!="		{return OP_NOT_EQUAL;}
">"			{return OP_GREATER;}
">="		{return OP_GREATER_EQUAL;}

"|"			{return OP_OR_BITWISE;}
"&"			{return OP_AND_BITWISE;}
"^"			{return OP_XOR_BITWISE;}

"||"		{return OP_LOGICAL_OR;}
"&&"		{return OP_LOGICAL_AND;}
"!"			{return OP_LOGICAL_NOT;}

"("			{return ST_LPAR;}
")"			{return ST_RPAR;}

"{"			{return ST_LCURL;}
"}"			{return ST_RCURL;}

"["			{return ST_LBR;}
"]"			{return ST_RBR;}
"$"			{return ST_DOLLAR;}
","			{return ST_COMMA;}



"#*".*"*#"	{;}     		
"#".*    	{;}

" "|"\t"	{return SPACE;}
"\n"		{	
				yylineno = yylineno + 1;
				return NEW_LINE;
			}

.			{
				yyerror_lex(yylineno);
				return OTHER;
			}

%% 


void yyerror_scanner(const int n)
{
	fprintf(stderr , "Unexpected Character at Line: %d\n" , n)
}
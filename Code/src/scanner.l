%{ 
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>

	#include "parser.tab.h"

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

"'"[a-z]"'" 		{	
						yylval.charVal = yytext[1];
						return LCHAR;
					}
"'"[A-Z]"'" 		{	
						yylval.charVal = yytext[1];
						return UCHAR;
					}
[0-9]+ 				{   
						yylval.intVal = strdup(yytext);
						return NUMBER;
					}

("_"|[a-zA-Z])("_"|[a-zA-Z]|[0-9])* {
										yylval.stringVal = strdup(yytext);
										return IDENTIFIER;
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

"|"			{return OP_BITWISE_OR;}
"&"			{return OP_BITWISE_AND;}
"^"			{return OP_BITWISE_XOR;}

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
";"			{return ST_SEMICOLON;}


"#*".*"*#"	{;}     		
"#".*    	{;}

[ \t]+		{;}
"\n"		{	
				yylineno = yylineno + 1;
				return NEW_LINE;
			}

.			{
				yyerror_scanner(yylineno);
				return OTHER;
			}

%% 



void yyerror_scanner(const int n)
{
	fprintf(stderr , "Unexpected Character at Line: %d\n" , n)
}
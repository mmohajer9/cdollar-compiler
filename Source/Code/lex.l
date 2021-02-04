%{ 

#include <stdio.h>
#include <stdlib.h>
#include <string.h> 

void yyerror (char *s);
int yylex();

%}


%% 


"void"			{return VOID;}
"if"			{return IF;}	
"return"		{return RETURN;}
"int"			{return INT;}
"else"			{return ELSE;}
"main"			{return MAIN;}
"for"			{return FOR;}
"break"			{return BREAK;}
"char"			{return CHAR;}
"while"			{return WHILE;}
"continue"		{return CONTINUE;}
"elseif"		{return ELSEIF;}

"'"[a-z]"'" 		{	yylval.Ichar = strdup(yytext);
						return LChar;
					}
"'"[A-Z]"'" 		{	yylval.Ichar = strdup(yytext);
						return UChar;
					}


("_"|[a-zA-Z])("_"|[a-zA-Z]|[0-9])* {return Variable}


[a-z]+ 			{	yylval.Istring = strdup(yytext);
					return LWord;
				}
				
[A-Z]+ 			{	yylval.Istring = strdup(yytext);
					return UWord;
				}
				
[0-9]+ 			{   yylval.Iint = strdup(yytext);
					return Num;
				}

"+"			{return SO_Plus;}
"-"			{return SO_Minus;}
"*"			{return SO_Multiply;}
"/"			{return SO_Divide;}
"<"			{return SO_Less;}
"<="			{return SO_LessEq;}
"=="			{return SO_Eq;}			
"!="			{return SO_NotEq;}
">"			{return SO_Great;}
">="			{return SO_GreateEq;}
"|"			{return SO_Or;}
"&"			{return SO_And;}
"||"			{return SO_LogOr;}
"&&"			{return SO_LogAnd;}
"^"			{return SO_Xor;}
"!"			{return SO_Not;}

"("			{return ST_ParenLEFT;}
")"			{return ST_ParenRIGHT;}
"{"			{return ST_CurBroLEFT;}
"}"			{return ST_CurBroRIGHT;}
"["			{return ST_BroLEFT;}
"]"			{return ST_BroRIGHT;}
"$"			{return ST_Dollar;}
","			{return ST_Comma;}



"#".*    		{} 
"#*".*"*#"		{}     		
" "|"\t"	    {return SPACE;}
"\n"			{	yylineno = yylineno + 1;
					return NewLine
				}

%% 
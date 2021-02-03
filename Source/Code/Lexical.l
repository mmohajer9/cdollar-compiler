%{ 
#include<stdio.h> 
#include<string.h> 

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

"'"[a-z]"'" 		{return LChar;}
"'"[A-Z]"'" 		{return UChar;}


("_"|[a-zA-Z])("_"|[a-zA-Z]|[0-9])* {return Variable}


[a-z]+ 			{return LWord;}
[A-Z]+ 			{return UWord;}
[0-9]+ 			{return Num;}

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



"#"    			{flag_single_line =1;} 
"#*"     		{flag_multi_line = 1;}
"*#"     		{count_next = 1;}
" "|"\t"|"\n"	{return SPACE;}

%% 
  

int yywrap(){} 
int main(){ 
 

 FILE *fp; 
 char filename[50]; 

 printf("Enter the filename: \n"); 
 scanf("%s",filename); 
 
 fp = fopen(filename,"r"); 
 yyin = fp; 
 yylex(); 

 return 0; 

} 

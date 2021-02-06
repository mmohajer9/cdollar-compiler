#ifndef UTIL_H
#define UTIL_H

#include <iostream>
#include <bits/stdc++.h>
#include <fstream>
#include <typeinfo>	
#include <stdio.h> 
#include <stdlib.h>
#include <string>
#include <string.h>

#include "../../dist/parser.tab.hpp"

using namespace std;

extern FILE* yyin;
extern int yylex();
extern int yylineno;
extern char* yytext;

int yyparse();
void yyerror(const char *s);

void showstack(stack <int> s);
int calculate(int token , int leftVal , int rightVal);

string find_free_register(int *array, int size , int mode);
void clear_registers(int* array, int size);


#endif


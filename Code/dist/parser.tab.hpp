/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_DIST_PARSER_TAB_HPP_INCLUDED
# define YY_YY_DIST_PARSER_TAB_HPP_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    KW_VOID = 258,
    KW_IF = 259,
    KW_RETURN = 260,
    KW_INT = 261,
    KW_ELSE = 262,
    KW_MAIN = 263,
    KW_FOR = 264,
    KW_BREAK = 265,
    KW_CHAR = 266,
    KW_WHILE = 267,
    KW_CONTINUE = 268,
    KW_ELSEIF = 269,
    NEW_LINE = 270,
    OTHER = 271,
    OP_ASSIGN = 272,
    OP_PLUS = 273,
    OP_MINUS = 274,
    OP_MULTIPLY = 275,
    OP_DIVIDE = 276,
    OP_LESS = 277,
    OP_LESS_EQUAL = 278,
    OP_EQUAL = 279,
    OP_NOT_EQUAL = 280,
    OP_GREATER = 281,
    OP_GREATER_EQUAL = 282,
    OP_BITWISE_OR = 283,
    OP_BITWISE_AND = 284,
    OP_BITWISE_XOR = 285,
    OP_LOGICAL_OR = 286,
    OP_LOGICAL_AND = 287,
    OP_LOGICAL_NOT = 288,
    ST_LPAR = 289,
    ST_RPAR = 290,
    ST_LCURL = 291,
    ST_RCURL = 292,
    ST_LBR = 293,
    ST_RBR = 294,
    ST_DOLLAR = 295,
    ST_COMMA = 296,
    ST_SEMICOLON = 297,
    LCHAR = 298,
    UCHAR = 299,
    NCHAR = 300,
    IDENTIFIER = 301,
    NUMBER = 302
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 45 "src/parser.ypp" /* yacc.c:1909  */


	int intVal;
	char charVal;
	char* stringVal;


#line 110 "./dist/parser.tab.hpp" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_DIST_PARSER_TAB_HPP_INCLUDED  */

/* A Bison parser, made by GNU Bison 3.7.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_DIST_PARSER_TAB_HPP_INCLUDED
# define YY_YY_DIST_PARSER_TAB_HPP_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    KW_VOID = 258,                 /* KW_VOID  */
    KW_IF = 259,                   /* KW_IF  */
    KW_RETURN = 260,               /* KW_RETURN  */
    KW_INT = 261,                  /* KW_INT  */
    KW_ELSE = 262,                 /* KW_ELSE  */
    KW_MAIN = 263,                 /* KW_MAIN  */
    KW_FOR = 264,                  /* KW_FOR  */
    KW_BREAK = 265,                /* KW_BREAK  */
    KW_CHAR = 266,                 /* KW_CHAR  */
    KW_WHILE = 267,                /* KW_WHILE  */
    KW_CONTINUE = 268,             /* KW_CONTINUE  */
    KW_ELSEIF = 269,               /* KW_ELSEIF  */
    NEW_LINE = 270,                /* NEW_LINE  */
    OTHER = 271,                   /* OTHER  */
    OP_ASSIGN = 272,               /* OP_ASSIGN  */
    OP_PLUS = 273,                 /* OP_PLUS  */
    OP_MINUS = 274,                /* OP_MINUS  */
    OP_MULTIPLY = 275,             /* OP_MULTIPLY  */
    OP_DIVIDE = 276,               /* OP_DIVIDE  */
    OP_LESS = 277,                 /* OP_LESS  */
    OP_LESS_EQUAL = 278,           /* OP_LESS_EQUAL  */
    OP_EQUAL = 279,                /* OP_EQUAL  */
    OP_NOT_EQUAL = 280,            /* OP_NOT_EQUAL  */
    OP_GREATER = 281,              /* OP_GREATER  */
    OP_GREATER_EQUAL = 282,        /* OP_GREATER_EQUAL  */
    OP_BITWISE_OR = 283,           /* OP_BITWISE_OR  */
    OP_BITWISE_AND = 284,          /* OP_BITWISE_AND  */
    OP_BITWISE_XOR = 285,          /* OP_BITWISE_XOR  */
    OP_LOGICAL_OR = 286,           /* OP_LOGICAL_OR  */
    OP_LOGICAL_AND = 287,          /* OP_LOGICAL_AND  */
    OP_LOGICAL_NOT = 288,          /* OP_LOGICAL_NOT  */
    ST_LPAR = 289,                 /* ST_LPAR  */
    ST_RPAR = 290,                 /* ST_RPAR  */
    ST_LCURL = 291,                /* ST_LCURL  */
    ST_RCURL = 292,                /* ST_RCURL  */
    ST_LBR = 293,                  /* ST_LBR  */
    ST_RBR = 294,                  /* ST_RBR  */
    ST_DOLLAR = 295,               /* ST_DOLLAR  */
    ST_COMMA = 296,                /* ST_COMMA  */
    ST_SEMICOLON = 297,            /* ST_SEMICOLON  */
    LCHAR = 298,                   /* LCHAR  */
    UCHAR = 299,                   /* UCHAR  */
    IDENTIFIER = 300,              /* IDENTIFIER  */
    NUMBER = 301                   /* NUMBER  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 36 "src/parser.ypp"


	int intVal;
	char charVal;
	char* stringVal;


#line 118 "./dist/parser.tab.hpp"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_DIST_PARSER_TAB_HPP_INCLUDED  */

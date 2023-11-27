/* A Bison parser, made by GNU Bison 2.4.1.  */
/* Skeleton implementation for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
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
/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */
/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */
/* Identify Bison output.  */
#define YYBISON 1
/* Bison version.  */
#define YYBISON_VERSION "2.4.1"
/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"
/* Pure parsers.  */
#define YYPURE 0
/* Push parsers.  */
#define YYPUSH 0
/* Pull parsers.  */
#define YYPULL 1
/* Using locations.  */
#define YYLSP_NEEDED 0
/* Copy the first part of user declarations.  */
/* Line 189 of yacc.c  */
#line 1 "y.y"

    #include <stdio.h>
    void yyerror(char *msg);
    int yylex(void);
#include <stdio.h>
#include <stdlib.h>
#include "output.h"

extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);



/* Line 189 of yacc.c  */
#line 80 "y.tab.c"
#line 87 "y.tab.c"

/* Enabling traces.  */
#ifndef YYDEBUG
@@ -103,39 +110,76 @@
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     IDENTIFICADOR = 258,
     ASIGNACION = 259,
     NUMERO = 260,
     COMPARACION = 261,
     PUNTOCOMA = 262,
     PARABRE = 263,
     PARCIERRA = 264,
     LLAVEABRE = 265,
     LLAVECIERRA = 266,
     INCREMENTO = 267,
     DECREMENTO = 268,
     FOR = 269
     FOR = 258,
     WHILE = 259,
     DO = 260,
     SWITCH = 261,
     CASE = 262,
     BREAK = 263,
     DEFAULT = 264,
     RETURN = 265,
     AND = 266,
     OR = 267,
     IDENTIFICADOR = 268,
     NUMERO = 269,
     COMPARACION = 270,
     PARABRE = 271,
     PARCIERRA = 272,
     LLAVEABRE = 273,
     LLAVECIERRA = 274,
     PUNTOCOMA = 275,
     INCREMENTO = 276,
     DECREMENTO = 277,
     IF = 278,
     ASIGNACION = 279,
     ELSE = 280,
     UMINUS = 281
   };
#endif
/* Tokens.  */
#define IDENTIFICADOR 258
#define ASIGNACION 259
#define NUMERO 260
#define COMPARACION 261
#define PUNTOCOMA 262
#define PARABRE 263
#define PARCIERRA 264
#define LLAVEABRE 265
#define LLAVECIERRA 266
#define INCREMENTO 267
#define DECREMENTO 268
#define FOR 269
#define FOR 258
#define WHILE 259
#define DO 260
#define SWITCH 261
#define CASE 262
#define BREAK 263
#define DEFAULT 264
#define RETURN 265
#define AND 266
#define OR 267
#define IDENTIFICADOR 268
#define NUMERO 269
#define COMPARACION 270
#define PARABRE 271
#define PARCIERRA 272
#define LLAVEABRE 273
#define LLAVECIERRA 274
#define PUNTOCOMA 275
#define INCREMENTO 276
#define DECREMENTO 277
#define IF 278
#define ASIGNACION 279
#define ELSE 280
#define UMINUS 281




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
typedef union YYSTYPE
{

/* Line 214 of yacc.c  */
#line 14 "y.y"

    int num;
    char* id;



/* Line 214 of yacc.c  */
#line 182 "y.tab.c"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
@@ -146,7 +190,7 @@ typedef int YYSTYPE;


/* Line 264 of yacc.c  */
#line 150 "y.tab.c"
#line 194 "y.tab.c"

#ifdef short
# undef short
@@ -359,22 +403,22 @@ union yyalloc
#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  4
#define YYFINAL  30
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   17
#define YYLAST   172

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  15
#define YYNTOKENS  31
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  7
#define YYNNTS  12
/* YYNRULES -- Number of rules.  */
#define YYNRULES  8
#define YYNRULES  31
/* YYNRULES -- Number of states.  */
#define YYNSTATES  24
#define YYNSTATES  87

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   269
#define YYMAXUTOK   281

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)
@@ -386,7 +430,7 @@ static const yytype_uint8 yytranslate[] =
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,    28,    26,     2,    27,     2,    29,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
@@ -408,30 +452,48 @@ static const yytype_uint8 yytranslate[] =
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    30
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint8 yyprhs[] =
{
       0,     0,     3,    10,    16,    20,    24,    27,    29
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    26,    28,    33,    41,    53,    61,    71,    82,
      90,    91,    97,   102,   106,   110,   114,   118,   121,   123,
     125,   127
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      16,     0,    -1,    14,     8,    17,     9,    10,    11,    -1,
      18,     7,    19,     7,    20,    -1,     3,     4,     5,    -1,
       3,     6,     5,    -1,     3,    21,    -1,    13,    -1,    12,
      32,     0,    -1,    33,    -1,    34,    -1,    33,    34,    -1,
      35,    -1,    36,    -1,    37,    -1,    39,    -1,    38,    -1,
      40,    -1,    10,    42,    20,    -1,    20,    -1,    13,    24,
      42,    20,    -1,    23,    16,    42,    17,    18,    33,    19,
      -1,    23,    16,    42,    17,    18,    33,    19,    25,    18,
      33,    19,    -1,     4,    16,    42,    17,    18,    33,    19,
      -1,     5,    18,    33,    19,     4,    16,    42,    17,    20,
      -1,     3,    16,    35,    42,    20,    35,    17,    18,    33,
      19,    -1,     6,    16,    42,    17,    18,    41,    19,    -1,
      -1,    41,     7,    14,    20,    33,    -1,    41,     9,    20,
      33,    -1,    42,    26,    42,    -1,    42,    27,    42,    -1,
      42,    28,    42,    -1,    42,    29,    42,    -1,    27,    42,
      -1,    14,    -1,    13,    -1,    15,    -1,    16,    42,    17,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    22,    22,    24,    25,    26,    27,    28,    28
       0,    37,    37,    41,    42,    46,    47,    48,    49,    50,
      51,    52,    53,    57,    61,    62,    66,    70,    74,    78,
      81,    83,    84,    87,    88,    89,    90,    91,    92,    93,
      94,    95
};
#endif

@@ -440,10 +502,14 @@ static const yytype_uint8 yyrline[] =
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "IDENTIFICADOR", "ASIGNACION", "NUMERO",
  "COMPARACION", "PUNTOCOMA", "PARABRE", "PARCIERRA", "LLAVEABRE",
  "LLAVECIERRA", "INCREMENTO", "DECREMENTO", "FOR", "$accept", "INICIO",
  "INTERIOR", "PRIMERO", "SEGUNDO", "TERCERO", "OPERACION", 0
  "$end", "error", "$undefined", "FOR", "WHILE", "DO", "SWITCH", "CASE",
  "BREAK", "DEFAULT", "RETURN", "AND", "OR", "IDENTIFICADOR", "NUMERO",
  "COMPARACION", "PARABRE", "PARCIERRA", "LLAVEABRE", "LLAVECIERRA",
  "PUNTOCOMA", "INCREMENTO", "DECREMENTO", "IF", "ASIGNACION", "ELSE",
  "'+'", "'-'", "'*'", "'/'", "UMINUS", "$accept", "program",
  "statement_list", "statement", "assignment_statement", "if_statement",
  "while_statement", "do_while_statement", "for_statement",
  "switch_statement", "case_list", "expression", 0
};
#endif

@@ -453,52 +519,74 @@ static const char *const yytname[] =
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,    43,    45,    42,    47,
     281
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    15,    16,    17,    18,    19,    20,    21,    21
       0,    31,    32,    33,    33,    34,    34,    34,    34,    34,
      34,    34,    34,    35,    36,    36,    37,    38,    39,    40,
      41,    41,    41,    42,    42,    42,    42,    42,    42,    42,
      42,    42
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     6,     5,     3,     3,     2,     1,     1
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     3,     1,     4,     7,    11,     7,     9,    10,     7,
       0,     5,     4,     3,     3,     3,     3,     2,     1,     1,
       1,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,     0,     1,     0,     0,     0,     0,     0,
       0,     4,     0,     0,     0,     2,     0,     0,     5,     0,
       3,     8,     7,     6
       0,     0,     0,     0,     0,     0,     0,    12,     0,     0,
       2,     3,     5,     6,     7,     9,     8,    10,     0,     0,
       0,     0,    29,    28,    30,     0,     0,     0,     0,     0,
       1,     4,     0,     0,     0,     0,     0,    27,    11,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    31,
      23,    24,    25,    26,    13,     0,     0,     0,     0,    20,
       0,     0,     0,     0,     0,     0,     0,    16,     0,     0,
       0,    19,    14,     0,     0,     0,     0,     0,     0,    17,
       0,    22,     0,    18,    21,     0,    15
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     2,     6,     7,    14,    20,    23
      -1,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      64,    27
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -13
static const yytype_int8 yypact[] =
#define YYPACT_NINF -21
static const yytype_int16 yypact[] =
{
     -11,    -6,     4,     2,   -13,     3,    -3,     1,     5,    -1,
       8,   -13,     6,     7,     9,   -13,    10,    11,   -13,   -12,
     -13,   -13,   -13,   -13
     128,   -13,    -6,    -5,     1,     6,    11,   -21,    20,    37,
     128,   -21,   -21,   -21,   -21,   -21,   -21,   -21,    26,     6,
     128,     6,   -21,   -21,   -21,     6,     6,     3,     6,     6,
     -21,   -21,     6,    17,    73,   118,   126,   -21,   -21,     6,
       6,     6,     6,    38,   132,   143,    24,    43,    30,   -21,
     -20,   -20,   -21,   -21,   -21,    32,    26,   128,    35,   -21,
     128,    36,    84,     6,    -3,    95,    41,   -21,   139,    42,
      40,   -21,    44,   128,    50,    52,   128,    55,   106,   -21,
     128,   128,   128,   -21,   128,   117,   -21
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -13,   -13,   -13,   -13,   -13,   -13,   -13
     -21,   -21,   -19,   -10,   -16,   -21,   -21,   -21,   -21,   -21,
     -21,   -14
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
@@ -508,23 +596,61 @@ static const yytype_int8 yypgoto[] =
#define YYTABLE_NINF -1
static const yytype_uint8 yytable[] =
{
      21,    22,     3,     1,     4,     5,     9,     8,    10,    12,
      11,    13,     0,    16,    19,    18,    17,    15
      31,    34,    32,    18,    69,    33,    70,    35,    41,    42,
      19,    36,    37,    20,    43,    44,    71,    21,    45,    22,
      23,    24,    25,    38,    31,    50,    51,    52,    53,    39,
      40,    41,    42,    26,    46,    28,    29,    30,    62,     6,
      61,    65,    57,    39,    40,    41,    42,    58,    59,    68,
      60,    63,    31,    66,    78,    31,    75,    81,    54,    73,
      76,    84,     0,    85,    39,    40,    41,    42,    31,    77,
      79,    31,    80,    82,    31,    31,     1,     2,     3,     4,
       0,     0,     0,     5,     0,     0,     6,     1,     2,     3,
       4,     0,    47,     7,     5,     0,     8,     6,     1,     2,
       3,     4,     0,    67,     7,     5,     0,     8,     6,     1,
       2,     3,     4,     0,    72,     7,     5,     0,     8,     6,
       1,     2,     3,     4,     0,    83,     7,     5,     0,     8,
       6,     1,     2,     3,     4,    48,    86,     7,     5,     0,
       8,     6,     0,    49,    39,    40,    41,    42,     7,    55,
       0,     8,    39,    40,    41,    42,    74,     0,    39,    40,
      41,    42,     0,    56,     0,    39,    40,    41,    42,    39,
      40,    41,    42
};

static const yytype_int8 yycheck[] =
{
      12,    13,     8,    14,     0,     3,     9,     4,     7,    10,
       5,     3,    -1,     6,     3,     5,     7,    11
      10,    20,    18,    16,     7,    19,     9,    21,    28,    29,
      16,    25,    26,    18,    28,    29,    19,    16,    32,    13,
      14,    15,    16,    20,    34,    39,    40,    41,    42,    26,
      27,    28,    29,    27,    17,    24,    16,     0,    57,    13,
      56,    60,    18,    26,    27,    28,    29,     4,    18,    63,
      18,    16,    62,    17,    73,    65,    14,    76,    20,    18,
      20,    80,    -1,    82,    26,    27,    28,    29,    78,    25,
      20,    81,    20,    18,    84,    85,     3,     4,     5,     6,
      -1,    -1,    -1,    10,    -1,    -1,    13,     3,     4,     5,
       6,    -1,    19,    20,    10,    -1,    23,    13,     3,     4,
       5,     6,    -1,    19,    20,    10,    -1,    23,    13,     3,
       4,     5,     6,    -1,    19,    20,    10,    -1,    23,    13,
       3,     4,     5,     6,    -1,    19,    20,    10,    -1,    23,
      13,     3,     4,     5,     6,    17,    19,    20,    10,    -1,
      23,    13,    -1,    17,    26,    27,    28,    29,    20,    17,
      -1,    23,    26,    27,    28,    29,    17,    -1,    26,    27,
      28,    29,    -1,    20,    -1,    26,    27,    28,    29,    26,
      27,    28,    29
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    14,    16,     8,     0,     3,    17,    18,     4,     9,
       7,     5,    10,     3,    19,    11,     6,     7,     5,     3,
      20,    12,    13,    21
       0,     3,     4,     5,     6,    10,    13,    20,    23,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    16,    16,
      18,    16,    13,    14,    15,    16,    27,    42,    24,    16,
       0,    34,    35,    42,    33,    42,    42,    42,    20,    26,
      27,    28,    29,    42,    42,    42,    17,    19,    17,    17,
      42,    42,    42,    42,    20,    17,    20,    18,     4,    18,
      18,    35,    33,    16,    41,    33,    17,    19,    42,     7,
       9,    19,    19,    18,    17,    14,    20,    25,    33,    20,
      20,    33,    18,    19,    33,    33,    19
};

#define yyerrok		(yyerrstatus = 0)
@@ -1335,17 +1461,73 @@ yyparse ()
  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
        case 23:

/* Line 1455 of yacc.c  */
#line 87 "y.y"
    { (yyval.num) = (yyvsp[(1) - (3)].num) + (yyvsp[(3) - (3)].num); }
    break;

  case 24:

/* Line 1455 of yacc.c  */
#line 88 "y.y"
    { (yyval.num) = (yyvsp[(1) - (3)].num) - (yyvsp[(3) - (3)].num); }
    break;

  case 25:

/* Line 1455 of yacc.c  */
#line 89 "y.y"
    { (yyval.num) = (yyvsp[(1) - (3)].num) * (yyvsp[(3) - (3)].num); }
    break;

  case 26:

/* Line 1455 of yacc.c  */
#line 90 "y.y"
    { (yyval.num) = (yyvsp[(1) - (3)].num) / (yyvsp[(3) - (3)].num); }
    break;

  case 27:

/* Line 1455 of yacc.c  */
#line 91 "y.y"
    { (yyval.num) = -(yyvsp[(2) - (2)].num); }
    break;

  case 28:

/* Line 1455 of yacc.c  */
#line 92 "y.y"
    { (yyval.num) = (yyvsp[(1) - (1)].num); }
    break;

  case 29:

/* Line 1455 of yacc.c  */
#line 93 "y.y"
    { (yyval.num) = atoi((yyvsp[(1) - (1)].id)); }
    break;

  case 30:

/* Line 1455 of yacc.c  */
#line 94 "y.y"
    { (yyval.num) = (yyvsp[(1) - (1)].num); }
    break;

  case 31:

/* Line 1455 of yacc.c  */
#line 23 "y.y"
    {printf("Sintaxis Correcta\n");}
#line 95 "y.y"
    { (yyval.num) = (yyvsp[(2) - (3)].num); }
    break;



/* Line 1455 of yacc.c  */
#line 1349 "y.tab.c"
#line 1531 "y.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);
@@ -1557,13 +1739,32 @@ yyparse ()


/* Line 1675 of yacc.c  */
#line 29 "y.y"
#line 97 "y.y"

#include "output.h"

void yyerror(char *msg){printf("\t Error Sintactico");
void yyerror(const char* s) {
    fprintf(stderr, "%s\n", s);
}

void main(){
int main() {
    yyin = fopen("entrada.txt", "r");
    if (!yyin) {
        perror("Error al abrir el archivo de entrada");
        return 1;
    }

    salida = fopen("salida.txt", "w");
    if (!salida) {
        perror("Error al abrir el archivo de salida");
        fclose(yyin);
        return 1;
    }

    yyparse();

    fclose(yyin);
    fclose(salida);
    return 0;
}

@@ -1,30 +1,41 @@
%{
    #include "y.tab.h"
    #include "output.h"
    #include <stdio.h>
    FILE *output_file;
    FILE *salida;
%}


numero [0-9]
letra [A-Za-z]
comparacion <|>|<=|>=

%%

"for"           {fprintf(salida, "for (0, 0)\n"); return FOR;}
"if"            {fprintf(salida, "if (0, 1)\n"); return IF;}
"else"          {fprintf(salida, "else (0, 2)\n"); return ELSE;}
"while"         {fprintf(salida, "while (0, 3)\n"); return WHILE;}
"do"            {fprintf(salida, "do (0, 4)\n"); return DO;}
"switch"        {fprintf(salida, "switch (0, 5)\n"); return SWITCH;}
"case"          {fprintf(salida, "case (0, 6)\n"); return CASE;}
"break"         {fprintf(salida, "break (0, 7)\n"); return BREAK;}
"default"       {fprintf(salida, "default (0, 8)\n"); return DEFAULT;}
"return"        {fprintf(salida, "return (0, 9)\n"); return RETURN;}
"&&"            {fprintf(salida, "&& (1, 10)\n"); return AND;}
"||"            {fprintf(salida, "|| (1, 11)\n"); return OR;}
"++"            {fprintf(salida, "++ (1, 12)\n"); return INCREMENTO;}
"--"            {fprintf(salida, "-- (1, 13)\n"); return DECREMENTO;}
"("             {fprintf(salida, "( (2, 14)\n"); return PARABRE;}
")"             {fprintf(salida, ") (2, 15)\n"); return PARCIERRA;}
"{"             {fprintf(salida, "{ (2, 16)\n"); return LLAVEABRE;}
"}"             {fprintf(salida, "} (2, 17)\n"); return LLAVECIERRA;}
";"             {fprintf(salida, "; (2, 18)\n"); return PUNTOCOMA;}

{numero}+       {fprintf(salida, "%s (3, 19)\n", yytext); return NUMERO;}
{letra}+(_|{letra}|{numero})* {fprintf(salida, "%s (3, 20)\n", yytext); return IDENTIFICADOR;}
{comparacion}   {fprintf(salida, "%s (3, 21)\n", yytext); return COMPARACION;}

%%
"for"           {fprintf(output_file, "for (0, 0)\n");return FOR;}
{letra}+(_|{letra}|{numero})* {return IDENTIFICADOR;}
"="             {fprintf(output_file, "= (1, 0)\n");return ASIGNACION;}
{numero}*       {fprintf(output_file, "{numero} (3, IF)\n");return NUMERO;}
{comparacion}    {return COMPARACION;}
"++"            {return INCREMENTO;}
"--"                {return DECREMENTO;}
"("             {return PARABRE;}
")"             {return PARCIERRA;}
"{"              {return LLAVEABRE;}
"}"             {return LLAVECIERRA;}
";"             {return PUNTOCOMA;}
.               {printf("Error lexico Caracter no valido '%s' \n");}
.               {fprintf(salida, "Error léxico: Caracter no válido '%s'\n", yytext);}

%%

  254 changes: 177 additions & 77 deletions254  
lex.yy.c
@@ -262,51 +262,55 @@
#define YY_AT_BOL() (yy_current_buffer->yy_at_bol)
typedef unsigned char YY_CHAR;
FILE *yyin = (FILE *) 0, *yyout = (FILE *) 0;
typedef int yy_state_type;
extern char *yytext;
#define yytext_ptr yytext
static yy_state_type yy_get_previous_state YY_PROTO(( void ));
static yy_state_type yy_try_NUL_trans YY_PROTO(( yy_state_type current_state ));
static int yy_get_next_buffer YY_PROTO(( void ));
static void yy_fatal_error YY_PROTO(( yyconst char msg[] ));
/* Done after the current pattern has been matched and before the
 * corresponding action - sets up yytext.
 */
#define YY_DO_BEFORE_ACTION \
	yytext_ptr = yy_bp; \
	yyleng = (int) (yy_cp - yy_bp); \
	yy_hold_char = *yy_cp; \
	*yy_cp = '\0'; \
	yy_c_buf_p = yy_cp;

#define YY_NUM_RULES 14
#define YY_END_OF_BUFFER 15
static yyconst short int yy_accept[28] =
#define YY_NUM_RULES 24
#define YY_END_OF_BUFFER 25
static yyconst short int yy_accept[71] =
    {   0,
        4,    4,   15,   13,   14,    8,    9,   13,   13,    4,
       12,    5,    3,    5,    2,    2,   10,   11,    6,    7,
        4,    5,    2,    2,    2,    1,    0
        0,    0,   25,   23,   24,   23,   15,   16,   23,   23,
       20,   19,   22,   22,   21,   21,   21,   21,   21,   21,
       21,   21,   21,   21,   17,   23,   18,   11,   13,   14,
       20,   22,   21,   21,   21,   21,   21,    5,   21,   21,
        2,   21,   21,   21,   12,   21,   21,   21,   21,    1,
       21,   21,   21,   21,    7,   21,    3,   21,   21,   21,
        8,   21,   21,   21,    4,   21,   10,    6,    9,    0
    } ;

static yyconst int yy_ec[256] =
    {   0,
        1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
        1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
        1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
        1,    1,    1,    1,    1,    1,    1,    1,    1,    3,
        4,    1,    5,    1,    6,    1,    1,    7,    7,    7,
        7,    7,    7,    7,    7,    7,    7,    1,    8,    9,
       10,   11,    1,    1,   12,   12,   12,   12,   12,   12,
       12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
       12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
        1,    1,    1,    1,   13,    1,   12,   12,   12,   12,

       12,   14,   12,   12,   12,   12,   12,   12,   12,   12,
       15,   12,   12,   16,   12,   12,   12,   12,   12,   12,
       12,   12,   17,    1,   18,    1,    1,    1,    1,    1,
        1,    1,    1,    1,    1,    1,    1,    3,    1,    4,
        5,    1,    6,    1,    7,    1,    1,    8,    8,    8,
        8,    8,    8,    8,    8,    8,    8,    1,    9,   10,
       11,   12,    1,    1,   13,   13,   13,   13,   13,   13,
       13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
       13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
        1,    1,    1,    1,   14,    1,   15,   16,   17,   18,

       19,   20,   13,   21,   22,   13,   23,   24,   13,   25,
       26,   13,   13,   27,   28,   29,   30,   13,   31,   13,
       13,   13,   32,   33,   34,    1,    1,    1,    1,    1,
        1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
        1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
        1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
@@ -323,44 +327,88 @@ static yyconst int yy_ec[256] =
        1,    1,    1,    1,    1
    } ;

static yyconst int yy_meta[19] =
static yyconst int yy_meta[35] =
    {   0,
        1,    1,    1,    1,    1,    1,    2,    1,    1,    1,
        1,    2,    2,    2,    2,    2,    1,    1
        1,    1,    1,    1,    1,    1,    1,    2,    1,    1,
        1,    1,    2,    2,    2,    2,    2,    2,    2,    2,
        2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
        2,    1,    1,    1
    } ;

static yyconst short int yy_base[30] =
static yyconst short int yy_base[73] =
    {   0,
        0,    0,   37,   38,   38,   38,   38,   31,   29,   26,
       38,   21,   38,   20,   12,   19,   38,   38,   38,   38,
       22,   38,    0,   12,    5,   15,   38,   22,   21
        0,    0,  157,  166,  166,  112,  166,  166,   85,   83,
       81,  166,   70,   59,   27,   28,   29,   31,   32,   28,
       32,   34,   40,   42,  166,   31,  166,  166,  166,  166,
       41,  166,    0,   43,   46,   48,   58,   54,   60,   56,
       66,   68,   74,   76,  166,   84,   82,   90,   85,   87,
       88,   93,  101,   98,  104,  107,  109,  112,  115,  110,
      121,  124,  126,  123,  127,  135,  136,  137,  139,  166,
       46,   36
    } ;

static yyconst short int yy_def[30] =
static yyconst short int yy_def[73] =
    {   0,
       27,    1,   27,   27,   27,   27,   27,   27,   27,   27,
       27,   27,   27,   27,   28,   28,   27,   27,   27,   27,
       27,   27,   29,   16,   16,   28,    0,   27,   27
       70,    1,   70,   70,   70,   70,   70,   70,   70,   70,
       70,   70,   70,   70,   71,   71,   71,   71,   71,   18,
       18,   18,   18,   18,   70,   70,   70,   70,   70,   70,
       70,   70,   72,   18,   18,   18,   18,   18,   18,   18,
       18,   18,   18,   18,   70,   18,   18,   18,   18,   18,
       18,   18,   18,   18,   18,   18,   18,   18,   18,   18,
       18,   18,   18,   18,   18,   18,   18,   18,   18,    0,
       70,   70
    } ;

static yyconst short int yy_nxt[57] =
static yyconst short int yy_nxt[201] =
    {   0,
        4,    5,    6,    7,    8,    9,   10,   11,   12,   13,
       14,   15,    4,   16,   15,   15,   17,   18,   23,   24,
       26,   23,   23,   24,   23,   23,   24,   23,   21,   22,
       22,   23,   21,   25,   20,   19,   27,    3,   27,   27,
       27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
       27,   27,   27,   27,   27,   27
        4,   14,   15,    4,   15,   16,   17,   18,   19,   20,
       15,   21,   15,   15,   15,   15,   22,   23,   15,   15,
       24,   25,   26,   27,   33,   33,   33,   33,   33,   33,
       33,   33,   33,   36,   33,   33,   34,   34,   31,   37,
       34,   41,   42,   40,   35,   39,   38,   34,   34,   34,
       34,   34,   44,   45,   46,   34,   34,   34,   34,   32,
       43,   34,   34,   34,   34,   47,   34,   48,   34,   34,
       32,   34,   50,   34,   34,   34,   34,   49,   31,   30,
       29,   34,   34,   34,   34,   52,   51,   53,   54,   34,

       55,   34,   34,   57,   56,   34,   34,   34,   34,   34,
       34,   34,   34,   34,   28,   34,   34,   58,   34,   34,
       61,   59,   34,   34,   60,   34,   34,   34,   65,   34,
       34,   64,   34,   34,   34,   34,   62,   34,   63,   34,
       34,   34,   34,   68,   34,   34,   34,   66,   34,   34,
       67,   34,   34,   34,   34,   34,   70,   34,   70,   70,
       34,   34,   34,   69,   34,    3,   70,   70,   70,   70,
       70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
       70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
       70,   70,   70,   70,   70,   70,   70,   70,   70,   70

    } ;

static yyconst short int yy_chk[57] =
static yyconst short int yy_chk[201] =
    {   0,
        1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
        1,    1,    1,    1,    1,    1,    1,    1,   15,   25,
       25,   26,   29,   28,   15,   16,   24,   26,   21,   14,
       12,   16,   10,   16,    9,    8,    3,   27,   27,   27,
       27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
       27,   27,   27,   27,   27,   27
        1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
        1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
        1,    1,    1,    1,   15,   16,   17,   72,   18,   19,
       15,   16,   17,   17,   18,   19,   20,   71,   31,   18,
       21,   21,   22,   20,   16,   19,   18,   21,   23,   22,
       24,   34,   24,   26,   35,   23,   36,   24,   34,   14,
       23,   35,   38,   36,   40,   36,   37,   37,   39,   38,
       13,   40,   40,   37,   41,   39,   42,   39,   11,   10,
        9,   41,   43,   42,   44,   43,   42,   44,   46,   43,

       47,   44,   46,   49,   48,   50,   51,   47,   48,   46,
       49,   52,   50,   51,    6,   48,   54,   51,   52,   53,
       54,   52,   55,   54,   53,   56,   53,   57,   60,   55,
       58,   59,   56,   59,   57,   60,   56,   58,   58,   61,
       59,   64,   62,   64,   63,   65,   61,   62,   64,   62,
       63,   63,   65,   66,   67,   68,    3,   69,    0,    0,
       66,   67,   68,   66,   69,   70,   70,   70,   70,   70,
       70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
       70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
       70,   70,   70,   70,   70,   70,   70,   70,   70,   70

    } ;

static yy_state_type yy_last_accepting_state;
@@ -378,9 +426,10 @@ char *yytext;
#define INITIAL 0
#line 2 "lex.l"
    #include "y.tab.h"
    #include "output.h"
    #include <stdio.h>
    FILE *output_file;
#line 384 "lex.yy.c"
    FILE *salida;
#line 433 "lex.yy.c"

/* Macros after this point can all be overridden by user definitions in
 * section 1.
@@ -531,9 +580,10 @@ YY_DECL
	register char *yy_cp, *yy_bp;
	register int yy_act;

#line 14 "lex.l"
#line 12 "lex.l"


#line 537 "lex.yy.c"
#line 587 "lex.yy.c"

	if ( yy_init )
		{
@@ -584,13 +634,13 @@ YY_DECL
			while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
				{
				yy_current_state = (int) yy_def[yy_current_state];
				if ( yy_current_state >= 28 )
				if ( yy_current_state >= 71 )
					yy_c = yy_meta[(unsigned int) yy_c];
				}
			yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int) yy_c];
			++yy_cp;
			}
		while ( yy_base[yy_current_state] != 38 );
		while ( yy_base[yy_current_state] != 166 );

yy_find_action:
		yy_act = yy_accept[yy_current_state];
@@ -618,75 +668,125 @@ YY_DECL

case 1:
YY_RULE_SETUP
#line 15 "lex.l"
{fprintf(output_file, "for (0, 0)\n");return FOR;}
#line 14 "lex.l"
{fprintf(salida, "for (0, 0)\n"); return FOR;}
	YY_BREAK
case 2:
YY_RULE_SETUP
#line 16 "lex.l"
{return IDENTIFICADOR;}
#line 15 "lex.l"
{fprintf(salida, "if (0, 1)\n"); return IF;}
	YY_BREAK
case 3:
YY_RULE_SETUP
#line 17 "lex.l"
{fprintf(output_file, "= (1, 0)\n");return ASIGNACION;}
#line 16 "lex.l"
{fprintf(salida, "else (0, 2)\n"); return ELSE;}
	YY_BREAK
case 4:
YY_RULE_SETUP
#line 18 "lex.l"
{fprintf(output_file, "{numero} (3, IF)\n");return NUMERO;}
#line 17 "lex.l"
{fprintf(salida, "while (0, 3)\n"); return WHILE;}
	YY_BREAK
case 5:
YY_RULE_SETUP
#line 19 "lex.l"
{return COMPARACION;}
#line 18 "lex.l"
{fprintf(salida, "do (0, 4)\n"); return DO;}
	YY_BREAK
case 6:
YY_RULE_SETUP
#line 20 "lex.l"
{return INCREMENTO;}
#line 19 "lex.l"
{fprintf(salida, "switch (0, 5)\n"); return SWITCH;}
	YY_BREAK
case 7:
YY_RULE_SETUP
#line 21 "lex.l"
{return DECREMENTO;}
#line 20 "lex.l"
{fprintf(salida, "case (0, 6)\n"); return CASE;}
	YY_BREAK
case 8:
YY_RULE_SETUP
#line 22 "lex.l"
{return PARABRE;}
#line 21 "lex.l"
{fprintf(salida, "break (0, 7)\n"); return BREAK;}
	YY_BREAK
case 9:
YY_RULE_SETUP
#line 23 "lex.l"
{return PARCIERRA;}
#line 22 "lex.l"
{fprintf(salida, "default (0, 8)\n"); return DEFAULT;}
	YY_BREAK
case 10:
YY_RULE_SETUP
#line 24 "lex.l"
{return LLAVEABRE;}
#line 23 "lex.l"
{fprintf(salida, "return (0, 9)\n"); return RETURN;}
	YY_BREAK
case 11:
YY_RULE_SETUP
#line 25 "lex.l"
{return LLAVECIERRA;}
#line 24 "lex.l"
{fprintf(salida, "&& (1, 10)\n"); return AND;}
	YY_BREAK
case 12:
YY_RULE_SETUP
#line 26 "lex.l"
{return PUNTOCOMA;}
#line 25 "lex.l"
{fprintf(salida, "|| (1, 11)\n"); return OR;}
	YY_BREAK
case 13:
YY_RULE_SETUP
#line 27 "lex.l"
{printf("Error lexico Caracter no valido '%s' \n");}
#line 26 "lex.l"
{fprintf(salida, "++ (1, 12)\n"); return INCREMENTO;}
	YY_BREAK
case 14:
YY_RULE_SETUP
#line 27 "lex.l"
{fprintf(salida, "-- (1, 13)\n"); return DECREMENTO;}
	YY_BREAK
case 15:
YY_RULE_SETUP
#line 28 "lex.l"
{fprintf(salida, "( (2, 14)\n"); return PARABRE;}
	YY_BREAK
case 16:
YY_RULE_SETUP
#line 29 "lex.l"
{fprintf(salida, ") (2, 15)\n"); return PARCIERRA;}
	YY_BREAK
case 17:
YY_RULE_SETUP
#line 30 "lex.l"
{fprintf(salida, "{ (2, 16)\n"); return LLAVEABRE;}
	YY_BREAK
case 18:
YY_RULE_SETUP
#line 31 "lex.l"
{fprintf(salida, "} (2, 17)\n"); return LLAVECIERRA;}
	YY_BREAK
case 19:
YY_RULE_SETUP
#line 32 "lex.l"
{fprintf(salida, "; (2, 18)\n"); return PUNTOCOMA;}
	YY_BREAK
case 20:
YY_RULE_SETUP
#line 34 "lex.l"
{fprintf(salida, "%s (3, 19)\n", yytext); return NUMERO;}
	YY_BREAK
case 21:
YY_RULE_SETUP
#line 35 "lex.l"
{fprintf(salida, "%s (3, 20)\n", yytext); return IDENTIFICADOR;}
	YY_BREAK
case 22:
YY_RULE_SETUP
#line 36 "lex.l"
{fprintf(salida, "%s (3, 21)\n", yytext); return COMPARACION;}
	YY_BREAK
case 23:
YY_RULE_SETUP
#line 38 "lex.l"
{fprintf(salida, "Error léxico: Caracter no válido '%s'\n", yytext);}
	YY_BREAK
case 24:
YY_RULE_SETUP
#line 40 "lex.l"
ECHO;
	YY_BREAK
#line 690 "lex.yy.c"
#line 790 "lex.yy.c"
case YY_STATE_EOF(INITIAL):
	yyterminate();

@@ -978,7 +1078,7 @@ static yy_state_type yy_get_previous_state()
		while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
			{
			yy_current_state = (int) yy_def[yy_current_state];
			if ( yy_current_state >= 28 )
			if ( yy_current_state >= 71 )
				yy_c = yy_meta[(unsigned int) yy_c];
			}
		yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int) yy_c];
@@ -1013,11 +1113,11 @@ yy_state_type yy_current_state;
	while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
		{
		yy_current_state = (int) yy_def[yy_current_state];
		if ( yy_current_state >= 28 )
		if ( yy_current_state >= 71 )
			yy_c = yy_meta[(unsigned int) yy_c];
		}
	yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int) yy_c];
	yy_is_jam = (yy_current_state == 27);
	yy_is_jam = (yy_current_state == 70);

	return yy_is_jam ? 0 : yy_current_state;
	}
@@ -1572,7 +1672,7 @@ int main()
	return 0;
	}
#endif
#line 29 "lex.l"
#line 40 "lex.l"


int yywrap() {
    

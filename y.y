@@ -1,36 +1,123 @@
%{
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

%}

%token IDENTIFICADOR
%union {
    int num;
    char* id;
}

%token <num> FOR WHILE DO SWITCH CASE BREAK DEFAULT RETURN AND OR
%token <id> IDENTIFICADOR
%token <num> NUMERO
%token <num> COMPARACION
%token PARABRE PARCIERRA LLAVEABRE LLAVECIERRA PUNTOCOMA
%token INCREMENTO DECREMENTO
%token IF
%token ASIGNACION
%token NUMERO
%token COMPARACION
%token PUNTOCOMA
%token PARABRE
%token PARCIERRA
%token LLAVEABRE
%token LLAVECIERRA
%token INCREMENTO
%token DECREMENTO
%token FOR
%start INICIO
%token ELSE
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%type <num> expression

%%
INICIO: FOR PARABRE INTERIOR PARCIERRA LLAVEABRE LLAVECIERRA
{printf("Sintaxis Correcta\n");};
INTERIOR: PRIMERO  PUNTOCOMA SEGUNDO PUNTOCOMA TERCERO;
PRIMERO: IDENTIFICADOR ASIGNACION NUMERO;
SEGUNDO: IDENTIFICADOR COMPARACION NUMERO;
TERCERO: IDENTIFICADOR OPERACION;
OPERACION: DECREMENTO|INCREMENTO;

program:
    statement_list
    ;

statement_list:
    statement
    | statement_list statement
    ;

statement:
    assignment_statement
    | if_statement
    | while_statement
    | for_statement
    | do_while_statement
    | switch_statement
    | RETURN expression PUNTOCOMA
    | PUNTOCOMA
    ;

assignment_statement:
    IDENTIFICADOR ASIGNACION expression PUNTOCOMA
    ;

if_statement:
    IF PARABRE expression PARCIERRA LLAVEABRE statement_list LLAVECIERRA
    | IF PARABRE expression PARCIERRA LLAVEABRE statement_list LLAVECIERRA ELSE LLAVEABRE statement_list LLAVECIERRA
    ;

while_statement:
    WHILE PARABRE expression PARCIERRA LLAVEABRE statement_list LLAVECIERRA
    ;

do_while_statement:
    DO LLAVEABRE statement_list LLAVECIERRA WHILE PARABRE expression PARCIERRA PUNTOCOMA
    ;

for_statement:
    FOR PARABRE assignment_statement expression PUNTOCOMA assignment_statement PARCIERRA LLAVEABRE statement_list LLAVECIERRA
    ;

switch_statement:
    SWITCH PARABRE expression PARCIERRA LLAVEABRE case_list LLAVECIERRA
    ;

case_list:
    /* empty */
    | case_list CASE NUMERO PUNTOCOMA statement_list
    | case_list DEFAULT PUNTOCOMA statement_list
    ;

expression: expression '+' expression { $$ = $1 + $3; }
          | expression '-' expression { $$ = $1 - $3; }
          | expression '*' expression { $$ = $1 * $3; }
          | expression '/' expression { $$ = $1 / $3; }
          | '-' expression %prec UMINUS   { $$ = -$2; }
          | NUMERO { $$ = $1; }
          | IDENTIFICADOR { $$ = atoi($1); }  // Usando atoi para convertir char* a int
          | COMPARACION { $$ = $1; }
          | PARABRE expression PARCIERRA { $$ = $2; };

%%
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

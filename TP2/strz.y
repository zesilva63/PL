%{
  #define _GNU_SOURCE
  #include <string.h>
  #include <stdio.h>
  #import <glib.h>
  int yylex();
  int yyerror(char *);
  void addVar(char *);
  void addVector(char *, int, int);
  int getVar(char *);
  int getVector(char *);
  int getVectorCol(char *);

  int label;

  typedef struct VectorI {
    int add;
    int lin;
    int col;
  } VectorI;

  typedef struct SString {
    char *begin;
    char *end;
  } SString;

%}

%union{
  char * s;
  int n;
  SString ss;
}

%token Int HICODE KTHKBYE VISIVEL LEARNTHZ f call
%token <s> VAR STRING
%token <n> NUM
%type <s> intvars intvar insts expr parcel factor inst func funcs
%type <ss> data

%%
siplp: intvars funcs HICODE insts KTHKBYE { printf("%sjump inic\n%sstart\ninic: %sstop\n", $1, $2, $4); }
     ;

intvars: Int intvar ';'             { $$ = $2; }
       | Int intvar ';' intvars     { asprintf(&$$, "%s%s", $2, $4); }
       ;

intvar: VAR                         { asprintf(&$$, "\tpushi 0\n"); addVar($1); }
      | VAR '=' NUM                 { asprintf(&$$, "\tpushi %d\n", $3); addVar($1); }
      | VAR '[' NUM ']'             { asprintf(&$$, "\tpushn %d\n", $3); addVector($1, $3, 0);}
      | VAR '[' NUM ']' '[' NUM ']' { asprintf(&$$, "\tpushn %d\n", $3 * $6); addVector($1, $3, $6);}
      ;

funcs: func                         { $$ = $1; }
     | funcs func                   { asprintf(&$$, "%s%s", $1, $2); }
     |                              { $$ = ""; }
     ;

func: f STRING '{' insts '}'        { asprintf(&$$, "%s: nop\n%s\treturn\n", $2, $4); }
    ;

insts: inst                         { $$ = $1; }
     | insts inst                   { asprintf(&$$, "%s%s", $1, $2); }
     
inst: VISIVEL factor ';'                 { asprintf(&$$, "%s\twritei\n", $2);}
    | VISIVEL '"' STRING '"' ';'         { asprintf(&$$, "\tpushs \"%s\"\n\twrites\n", $3); }
    | LEARNTHZ  data  ';'                { asprintf(&$$, "%s\tread\n\tatoi\n\%s", $2.begin, $2.end); }
    | data '=' expr ';'                  { asprintf(&$$, "%s%s%s", $1.begin, $3, $1.end); }
    | '?''('expr')' '{' insts '}'        { asprintf(&$$, "%s\tjz label%d\n%slabel%d: ", $3, label,
                                           $6, label); label++; }
    | '?''('expr')''{' insts '}''_''{' insts '}'    { asprintf(&$$, "%s\tjz label%d\n%sjump label%d\nlabel%d: %slabel%d: ",
              $3, label, $6, label + 1, label, $10, label + 1); label += 2; }
    | '$''('expr')' '{' insts '}'                   { asprintf(&$$, "label%d: %s\tjz label%d\n%sjump label%d\nlabel%d: ",
     label, $3, label + 1, $6, label, label + 1); label += 2; }
    | call STRING ';'              { asprintf(&$$, "\tpusha %s\n\tcall\n\tnop\n", $2); }
    |                              { $$ = ""; }
    ;

data: VAR                           { asprintf(&$$.begin, "");
                                      asprintf(&$$.end, "\tstoreg %d\n", getVar($1)); }
    | VAR '[' expr ']'              { asprintf(&$$.begin, "\tpushgp\n\tpushi %d\n\tpadd\n%s", getVector($1), $3);
                                      asprintf(&$$.end, "\tstoren\n"); }
    | VAR '[' expr ']' '[' expr ']' { asprintf(&$$.begin, "\tpushgp\n\tpushi %d\n\tpadd\n%s\tpushi %d\n\tmul\n%s\tadd\n", getVector($1), $3, getVectorCol($1), $6);
                                      asprintf(&$$.end, "\tstoren\n"); }

expr: parcel                 { $$ = $1; }
    | expr '+' parcel        { asprintf(&$$, "%s%s\tadd\n", $1, $3); }
    | expr '-' parcel        { asprintf(&$$, "%s%s\tsub\n", $1, $3); }

parcel: parcel '*' factor    { asprintf(&$$, "%s%s\tmul\n", $1, $3); }
      | parcel '/' factor    { asprintf(&$$, "%s%s\tdiv\n", $1, $3); }
      | parcel '%' factor    { asprintf(&$$, "%s%s\tmod\n", $1, $3); }
      | parcel '>' factor    { asprintf(&$$, "%s%s\tsup\n", $1, $3); }
      | parcel '<' factor    { asprintf(&$$, "%s%s\tinf\n", $1, $3); }
      | parcel '>''=' factor { asprintf(&$$, "%s%s\tsupeq\n", $1, $4); }
      | parcel '<''=' factor { asprintf(&$$, "%s%s\tinfeq\n", $1, $4); }
      | parcel '!''=' factor { asprintf(&$$, "%s%s\tequal\npushi 1\ninf\n", $1, $4); }
      | parcel '=''=' factor { asprintf(&$$, "%s%s\tequal\n", $1, $4); }
      | parcel '&' factor    { asprintf(&$$, "%s%s\tadd\n\tpushi 2\n\tequal\n", $1, $3); }
      | parcel '|' factor    { asprintf(&$$, "%s%s\tadd\n\tpushi 0\n\tsup\n", $1, $3); }
      | factor               { $$ = $1; }

factor: NUM                           { asprintf(&$$, "\tpushi %d\n", $1); }
      | VAR                           { asprintf(&$$, "\tpushg %d\n", getVar($1)); }
      | VAR '[' expr ']'              { asprintf(&$$, "\tpushgp\n\tpushi %d\n\tpadd\n%s\tloadn\n", getVector($1), $3); }
      | VAR '[' expr ']' '[' expr ']' { asprintf(&$$, "\tpushgp\n\tpushi %d\n\tpadd\n%s\tpushi %d\n\tmul\n%s\tadd\n\tloadn\n", getVector($1), $3, getVectorCol($1), $6); }
      | '(' expr ')'                  { $$ = $2; }
      ;

%%

#include "lex.yy.c"

GHashTable * variaveis;
GHashTable * vectores;
int stackPointer;

int yyerror (char *s) {
  fprintf(stderr, "%s (%d)\n", s, yylineno);
  return 0;
}

int main() {
    variaveis    = g_hash_table_new(g_str_hash, g_str_equal);
    vectores     = g_hash_table_new(g_str_hash, g_str_equal);
    stackPointer = 0;
    label        = 0;

    yyparse();
    return 0;
}

void addVar(char * var) {
    int *addr = (int *) malloc(sizeof(int));
        *addr = stackPointer;
    g_hash_table_insert(variaveis, var, addr);
    stackPointer++;
}

void addVector(char * var, int lin, int col) {
    char *error;
    if (lin > 0 && col >=0) {
        VectorI *vector = (VectorI *) malloc(sizeof(VectorI));
        vector->add = stackPointer;
        vector->lin = lin;
        vector->col = col;
        g_hash_table_insert(vectores, var, vector);
        stackPointer += lin;
    }
    else {
        asprintf(&error, "Tamanho invalido");
        yyerror(error);
    }
}

int getVar(char * var) {
    return *((int *) g_hash_table_lookup(variaveis, var));
}

int getVector(char * var) {
    return ((VectorI *) g_hash_table_lookup(vectores, var))->add;
}

int getVectorCol(char * var) {
    return ((VectorI *) g_hash_table_lookup(vectores, var))->col;
}

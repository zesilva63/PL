%{
#include <string.h>
#include <stdio.h>
#include <glib.h>

int yylex();
int yyerror(char *);
void addVar(char *);
void addVetor(char *, int, int);
int getVarAdd(char *);
int getVectorAdd(char *);
int getVectorCol(char *);

 int nivel;

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

%%

/* Um programa é defenido por um conjunto de declarações seguido de um conjunto de instruções */
Prog: Decl Intr { printf("%s start\n %s stop\n", $1, $2); }
	;


/* 1------------- conjunto de declarações ------------- */
Decl : SDecl '\n'                          {$$ = $1;}
	 | SDecl '\n' Decl                     {asprintf(&$$, "%s%s", $1, $3);}f
	 ;

SDecl : 'INT' VAR                          {asprintf(&$$, "\tpushi 0 \n"          ); addVar($1)          ;}
	  | 'INT' VAR '=' NUM                  {asprintf(&$$, "\tpushi %d\n", $4      ); addVar($1)          ;}
	  | 'INT' '[' NUM ']' VAR              {asprintf(&$$, "\tpushn %d\n", $3      ); addVetor($1, $3, 0 );}
	  | 'INT' '[' NUM ']''[' NUM ']' VAR   {asprintf(&$$, "\tpushn %d\n", $3 * $6 ); addVetor($1, $3, $6);}
	  | '#' Coment                         {asprintf(&$$, "%s", $2)                                      ;}
	  ;


/* 2------------- Conjuto de Instruções ------------- */
Intr : Elem '\n'                   		   {$$ = $1}
	 | Elem '\n' Intr        	 		   {asprintf(&$$, "%s %s", $1, $2);}
	 ;

/* 2.1 Intrução elementar  */
Elem : Aritm                         	   {$$ = $1}
     | Cond                       		   {$$ = $1}
     | IO                         		   {$$ = $1}
     | '#' Coment                 		   {asprintf(&$$, "%s", $2);}
     ;

/* 2.1.1 Intrução aritemetica  */
Aritm : Data '='  NUM '+' NUM    {asprintf(&$$, "%s%s%s\tadd\n%s", $1.begin, $3, $5 , $1.end);}  
	  | Data '='  NUM '-' NUM	 {asprintf(&$$, "%s%s%s\tsub\n%s", $1.begin, $3, $5 , $1.end);}
	  | Data '='  NUM '*' NUM    {asprintf(&$$, "%s%s%s\tmul\n%s", $1.begin, $3, $5 , $1.end);}
	  | Data '='  NUM '/' NUM    {asprintf(&$$, "%s%s%s\tdiv\n%s", $1.begin, $3, $5 , $1.end);}
	  | Data '='  NUM '%' NUM    {asprintf(&$$, "%s%s%s\tmod\n%s", $1.begin, $3, $5 , $1.end);}
	  | Data '+=' NUM    		 {asprintf(&$$, "\tpushg %d\n%s%s%s\tadd\n%s",getVarAdd($1), $1.begin, getVarAdd($1), $5, $1.end);}
	  | Data '-=' NUM			 {asprintf(&$$, "\tpushg %d\n%s%s%s\tsub\n%s",getVarAdd($1), $1.begin, getVarAdd($1), $5, $1.end);}
	  | Data '*=' NUM			 {asprintf(&$$, "\tpushg %d\n%s%s%s\tmul\n%s",getVarAdd($1), $1.begin, getVarAdd($1), $5, $1.end);}
	  | Data '/=' NUM			 {asprintf(&$$, "\tpushg %d\n%s%s%s\tdiv\n%s",getVarAdd($1), $1.begin, getVarAdd($1), $5, $1.end);}
	  | Data '++'  				 {asprintf(&$$, "\tpushg %d\n%s%s%s\tadd\n%s",getVarAdd($1), $1.begin, getVarAdd($1), 1 , $1.end);}
	  | Data '--'				 {asprintf(&$$, "\tpushg %d\n%s%s%s\tsub\n%s",getVarAdd($1), $1.begin, getVarAdd($1), 1 , $1.end);}
	  | Data					 {asprintf(&$$, "\tpushg %d\n", getVarAdd($1);}
	  | NUM					     {asprintf(&$$, "\%d\n", $1;}
	  ;


Data : Var                             { asprintf(&$$.begin, "");
									     asprintf(&$$.end, "\tstoreg %d\n", getVarAdd($1)); }
     | Var '[' Aritm ']'               { asprintf(&$$.begin, "\tpushgp\n\tpushi %d\n\tpadd\n%s", getVectorAdd($1), $3);
       								     asprintf(&$$.end, "\tstoren\n"); }
     | Var '[' Aritm ']' '[' Aritm ']' { asprintf(&$$.begin, "\tpushgp\n\tpushi %d\n\tpadd\n%s\tpushi %d\n\tmul\n%s\tadd\n", getVectorAdd($1), $3, getVectorCol($1), $6);
                                         asprintf(&$$.end, "\tstoren\n"); }
     ; 


/* 2.1.2 Intrução condicional  */
Cond : '^'  Con Intr          'END'      {asprintf(&$$, "label%d: %s\tjz label%d\n%sjump label%d\nlabel%d: ",nivel, $2, nivel + 1, $3, nivel, nivel + 1); 
										  nivel += 2;}     
	 | '?'  Con Intr          'END'      {asprintf(&$$, "%s\t jz label%d\n%s label%d: ", $2, nivel, $3, nivel);
	 		   				   	          nivel++;   }
	 | '?'  Con Intr '»' Intr 'END'      {asprintf(&$$, "%s\t jz label%d\n%s jump label%d \n label%d: %slabel%d: ",$2, nivel, $3, nivel + 1, nivel, $5, nivel + 1);
	                                      nivel += 2;}
	 ;

/* 2.1.2.1 Condições */
Con : '(' Aritm '>'  Aritm ')'           { asprintf(&$$, "%s%s\tsup\n  ", $2, $4);              }  
    | '(' Aritm '<'  Aritm ')'           { asprintf(&$$, "%s%s\tinf\n  ", $2, $4);              }
    | '(' Aritm '>=' Aritm ')'           { asprintf(&$$, "%s%s\tsupeq\n", $2, $4);              }
    | '(' Aritm '<=' Aritm ')'           { asprintf(&$$, "%s%s\tinfeq\n", $2, $4);              }
    | '(' Aritm '!='  Aritm ')'          { asprintf(&$$, "%s%s\tequal\npushi 1\ninf\n", $2, $4);}
    | '(' Aritm '=='  Aritm ')'          
    ;

/* 2.1.3 Intrução IO  */
IO : '<' VAR   '\n'                  {asprintf(&$$, "%s\t read   \n\t atoi \n\%s", $2.begin, $2.end);}
   | '>' Aritm '\n'					 {asprintf(&$$, "%s\t writei \n"             , $2              );}	
   ; 


/* 3 ------------- Comentarios ------------- */
Coment : VAR                     {printf("%s"   ,$1    );}
	   | VAR Coment;             {printf("%s %s",$1, $2);}


%%

#include "lex.yy.c"


GHashTable * variaveis;
GHashTable * vetores;
int stackPointer;

int yyerror(char *s){
    printf("erro: %s\n",s);
}

int main(){
	variaveis   = g_hash_table_new(g_str_hash, g_str_equal);
  	vetores     = g_hash_table_new(g_str_hash, g_str_equal);
  	apontador   = 0;
  	nivel       = 0;

    yyparse();
    return 0;
}


void addVar(char * var) {
  	add = (int *) malloc(sizeof(int));
  	*add = stackPointer;
    g_hash_table_insert(variaveis, var, add);
    stackPointer++;
}


void addVector(char * var, int lin, int col) {
  if (lin > 0 && col >= 0) {
    	vetor = (VetorI *) malloc(sizeof(VetorI));
    	vetor->add = pointer;
    	vetor->lin = lin;
    	vetor->col = col;
    	g_hash_table_insert(vetores, var, vetor);
    	pointer += lin;
  }
  else {
    	asprintf(&error_message, "Tamanho invalido");
    	yyerror(error_message);
  	}
}


int getVarAdd(char * var) {
  int * add = (int *) g_hash_table_lookup(variaveis, var);
  return *add;
}

int get_array_addr(char * var) {
  VetorI *v = (VetorI *) g_hash_table_lookup(vetores, var);
  return v->add;
}

int get_array_cols_length(char * var) {
  VetorI *array = (VetorI *) g_hash_table_lookup(vetores, var);
  return array->cols;
}
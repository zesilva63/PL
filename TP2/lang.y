%{
#include <stdio.h>
%}

%%

/* Um programa é defenido por um conjunto de declarações seguido de um conjunto de instruções */
Prog: Decl Intr
	;


/* 1------------- conjunto de declarações ------------- */
Decl : SDecl                     {printf("\n");}
	 | SDecl Dec                 {printf("\n");}
	 ;

SDecl : 'INT' pal                {printf("int %s;\n", $2);}
	  | 'INT' pal '=' num        {printf("int %s = %d;\n", $2, $4 );}
	  | 'INT' Array pal          {printf("int %s %s;\n",$2, $3)}
	  | '#' Coment               {printf("# %s\n", $2);}
	  ;

Array : '[' num ']'              {printf("[%d]",$2);}        
	  | '[' num '] [' num ']'    {printf("[%d][%d]",$2,$3);}
	  ;


/* 2------------- Conjuto de Instruções ------------- */
Intr : Elem                      {printf("\n");}
	 | Elem Intr 				 {printf("\n");}
	 ;

/* 2.1 Intrução elementar  */
Elem : Aritm                     {printf("\n");}
     | Cond                      {printf("\n");}
     | IO                        {printf("\n");}
     | '#' Coment                {printf("# %s"$2);}
     ;

/* 2.1.1 Intrução aritemetica  */
Aritm : pal '='  num '+'  num    {printf("%s = %d +  %d",$1,$3,$5);}  
	  | pal '='  num '-'  num	 {printf("%s = %d -  %d",$1,$3,$5);}
	  | pal '='  num '*'  num    {printf("%s = %d *  %d",$1,$3,$5);}
	  | pal '='  num '/'  num    {printf("%s = %d /  %d",$1,$3,$5);}
	  | pal '='  num '//' num    {printf("%s = %d // %d",$1,$3,$5);}
	  | pal '='  num '**' num    {printf("%s = %d ** %d",$1,$3,$5);}
	  | pal '+=' num  			 {printf("%s = %s +  %d",$1,$1,$3);}
	  | pal '-=' num			 {printf("%s = %s -  %d",$1,$1,$3);}
	  | pal '*=' num			 {printf("%s = %s *  %d",$1,$1,$3);}
	  | pal '/=' num			 {printf("%s = %s /  %d",$1,$1,$3);}
	  | pal '++'  				 {printf("%s = %s +   1",$1,$1   );}
	  | pal '--'				 {printf("%s = %s +   1",$1,$1   );}
	  | pal						 {printf("%s"           ,$1      );}
	  | num					     {printf("%d"           ,$1      );}
	  ;


/* 2.1.2 Intrução condicional  */
Cond : 'WHILE' C Intr 'END'      {printf("while(%s) { %s }"  ,$2,$3 );}     
	 | 'IF'    C Intr 'END'      {printf("if(%s) { %s }"     ,$2,$3 );}
	 | 'ELIF'  C Intr 'END'      {printf("else if(%s) { %s }",$2,$3 );}
	 | 'ELSE'    Intr 'END'      {printf("else { %s }"       ,$2,$3 );}
	 ;

/* 2.1.3 Intrução IO  */
IO : '<' pal                     {printf("READ  %s",%$2);}
   | '>' Aritm 					 {printf("WRITE %s",%$2);}	
   ; 


/* 3 ------------- Comentarios ------------- */
Coment : pal                     {printf("%s"   ,$1    );}
	   | pal Coment;             {printf("%s %s",$1, $2);}


%%

#include "lex.yy.c"

int yyerror(char *s){
    printf("erro: %s\n",s);
}

int main(){
    yyparse();
    return 0;
}
/* original parser id follows */
/* yysccsid[] = "@(#)yaccpar	1.9 (Berkeley) 02/21/93" */
/* (use YYMAJOR/YYMINOR for ifdefs dependent on parser version) */

#define YYBYACC 1
#define YYMAJOR 1
#define YYMINOR 9
#define YYPATCH 20140715

#define YYEMPTY        (-1)
#define yyclearin      (yychar = YYEMPTY)
#define yyerrok        (yyerrflag = 0)
#define YYRECOVERING() (yyerrflag != 0)
#define YYENOMEM       (-2)
#define YYEOF          0
#define YYPREFIX "yy"

#define YYPURE 0

#line 2 "progz.y"
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

#line 29 "progz.y"
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union{
  char * s;
  int n;
  SString ss;
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
#line 60 "y.tab.c"

/* compatibility with bison */
#ifdef YYPARSE_PARAM
/* compatibility with FreeBSD */
# ifdef YYPARSE_PARAM_TYPE
#  define YYPARSE_DECL() yyparse(YYPARSE_PARAM_TYPE YYPARSE_PARAM)
# else
#  define YYPARSE_DECL() yyparse(void *YYPARSE_PARAM)
# endif
#else
# define YYPARSE_DECL() yyparse(void)
#endif

/* Parameters sent to lex. */
#ifdef YYLEX_PARAM
# define YYLEX_DECL() yylex(void *YYLEX_PARAM)
# define YYLEX yylex(YYLEX_PARAM)
#else
# define YYLEX_DECL() yylex(void)
# define YYLEX yylex()
#endif

/* Parameters sent to yyerror. */
#ifndef YYERROR_DECL
#define YYERROR_DECL() yyerror(const char *s)
#endif
#ifndef YYERROR_CALL
#define YYERROR_CALL(msg) yyerror(msg)
#endif

extern int YYPARSE_DECL();

#define Int 257
#define HICODE 258
#define KTHKBYE 259
#define VISIVEL 260
#define LEARNTHZ 261
#define f 262
#define call 263
#define VAR 264
#define STRING 265
#define NUM 266
#define YYERRCODE 256
typedef short YYINT;
static const YYINT yylhs[] = {                           -1,
    0,    1,    1,    2,    2,    2,    2,    9,    9,    9,
    8,    3,    3,    7,    7,    7,    7,    7,    7,    7,
    7,    7,   10,   10,   10,    4,    4,    4,    5,    5,
    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
    6,    6,    6,    6,    6,
};
static const YYINT yylen[] = {                            2,
    5,    3,    4,    1,    3,    4,    7,    1,    2,    0,
    5,    1,    2,    3,    5,    3,    4,    7,   11,    7,
    3,    0,    1,    4,    7,    1,    3,    3,    3,    3,
    3,    3,    3,    4,    4,    4,    4,    3,    3,    1,
    1,    1,    4,    7,    3,
};
static const YYINT yydefred[] = {                         0,
    0,    0,    0,    0,    0,    0,    8,    0,    0,    0,
    0,    0,    0,    9,    5,    0,    3,    0,    0,    0,
    0,    0,    0,    0,    0,   12,    0,    0,    0,    0,
   41,    0,    0,    0,    0,    0,    0,    0,    0,    1,
   13,    0,    0,   11,    0,    0,    0,    0,   40,   14,
   16,   21,    0,    0,    0,    0,    0,    0,    0,   45,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,   17,    7,    0,   15,    0,    0,
    0,   29,   30,   31,    0,   32,    0,   33,    0,   38,
   39,    0,    0,    0,    0,   37,   34,   35,   36,    0,
    0,    0,    0,   25,    0,   20,   44,    0,    0,    0,
   19,
};
static const YYINT yydgoto[] = {                          2,
    3,    5,   25,   47,   48,   49,   26,    7,    8,   27,
};
static const YYINT yysindex[] = {                      -255,
 -257,    0, -248,  -32,  -42, -243,    0, -246, -230, -221,
 -255,  -74,   -1,    0,    0,  -22,    0,   -1,  -34, -197,
 -186,    6,   61,   87,  -26,    0,   30,   45,  -21,   49,
    0, -124,    8,   83,   95,   97,    8,    8,    8,    0,
    0,    8, -114,    0,    8,  123,   25,  -29,    0,    0,
    0,    0,  -40,   35,  108,  -19,   65,  -24,  100,    0,
    8,    8,   99,    8,    8,    8,    3,    4,  101,    8,
    8,   70,   43,   44,    0,    0,   78,    0,  -29,  -29,
    8,    0,    0,    0,    8,    0,    8,    0,    8,    0,
    0,    8,   -1,   -1,    8,    0,    0,    0,    0,   40,
  -16,  -11,   72,    0,   68,    0,    0,   47,   -1,   -6,
    0,
};
static const YYINT yyrindex[] = {                         0,
    0,    0,  -87,  113,    0,    0,    0,    0,    0,    0,
 -224,    0,  -86,    0,    0,    0,    0,   52,    0,    0,
    0,  -20,    0,    0,    0,    0,    0,  115,    0,   13,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,   62,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    2,    0,    0,    0,    0,   51,    0,   75,  105,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,   52,   52,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,  -35,    0,    0,    0,   52,    0,
    0,
};
static const YYINT yygindex[] = {                         0,
  165,    0,   -7,   93,   20,   58,   -2,  170,    0,  159,
};
#define YYTABLESIZE 274
static const YYINT yytable[] = {                         32,
   18,    1,   61,   69,   62,   33,    4,   66,   70,   24,
   29,   13,   64,    6,   24,    6,   11,   65,   61,   24,
   62,   12,   41,   61,   24,   62,   41,   18,    9,   24,
   68,   63,   67,    2,   24,   15,   23,    2,   23,   75,
   23,   23,   33,   33,   16,   42,   23,   33,   18,   42,
   42,   23,   72,   42,   42,   42,   23,   42,   10,   42,
   24,   23,   24,   85,   87,   60,   22,   61,   77,   62,
   28,   42,   42,   42,   42,   73,   34,   61,   36,   62,
   79,   80,   61,   43,   62,  101,  102,   43,   43,   18,
   42,   43,   43,   43,   71,   43,   37,   43,   41,   41,
   38,  110,   26,   44,   26,   42,   26,   41,  105,   43,
   43,   43,   43,  106,   61,   27,   62,   27,  111,   27,
   26,   82,   83,   84,   86,   88,   39,   90,   91,   53,
   54,   55,  104,   27,   56,   43,   42,   58,   96,   45,
   46,   50,   97,   43,   98,   28,   99,   28,   74,   28,
   61,   57,   62,   51,   26,   52,   59,   76,   78,   81,
   92,   89,  108,   28,  107,   93,   94,   27,   95,  109,
   10,    4,   22,    6,   43,   17,   22,   14,   35,    0,
    0,    0,    0,    0,  100,    0,    0,  103,    0,    0,
    0,    0,    0,    0,    0,    0,    0,   28,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,   18,   18,   18,    0,   18,   18,   30,
    0,   31,   40,   19,   20,    0,   21,   22,   19,   20,
    0,   21,   22,   19,   20,    0,   21,   22,   19,   20,
    0,   21,   22,   19,   20,    0,   21,   22,   19,   20,
    0,   21,   22,    0,    0,    0,   30,   30,   31,   31,
    0,   30,    0,   31,
};
static const YYINT yycheck[] = {                         34,
   36,  257,   43,   33,   45,   40,  264,   37,   38,   36,
   18,  258,   42,  262,   36,  262,   59,   47,   43,   36,
   45,  265,   25,   43,   36,   45,   29,   63,   61,   36,
   60,   61,   62,  258,   36,  266,   63,  262,   59,   59,
   61,   63,   40,   40,  266,   33,   63,   40,  123,   37,
   38,   63,   93,   41,   42,   43,   63,   45,   91,   47,
   59,   63,   61,   61,   61,   41,  264,   43,   93,   45,
   93,   59,   60,   61,   62,   41,   19,   43,  265,   45,
   61,   62,   43,   33,   45,   93,   94,   37,   38,  125,
   61,   41,   42,   43,  124,   45,   91,   47,  101,  102,
   40,  109,   41,  125,   43,   93,   45,  110,  125,   59,
   60,   61,   62,  125,   43,   41,   45,   43,  125,   45,
   59,   64,   65,   66,   67,   68,   40,   70,   71,   37,
   38,   39,   93,   59,   42,   91,  124,   45,   81,   91,
  265,   59,   85,   93,   87,   41,   89,   43,   41,   45,
   43,  266,   45,   59,   93,   59,   34,   93,   59,   61,
   91,   61,   95,   59,   93,  123,  123,   93,   91,  123,
  258,   59,  259,   59,  124,   11,  125,    8,   20,   -1,
   -1,   -1,   -1,   -1,   92,   -1,   -1,   95,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   93,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,  259,  260,  261,   -1,  263,  264,  264,
   -1,  266,  259,  260,  261,   -1,  263,  264,  260,  261,
   -1,  263,  264,  260,  261,   -1,  263,  264,  260,  261,
   -1,  263,  264,  260,  261,   -1,  263,  264,  260,  261,
   -1,  263,  264,   -1,   -1,   -1,  264,  264,  266,  266,
   -1,  264,   -1,  266,
};
#define YYFINAL 2
#ifndef YYDEBUG
#define YYDEBUG 0
#endif
#define YYMAXTOKEN 266
#define YYUNDFTOKEN 279
#define YYTRANSLATE(a) ((a) > YYMAXTOKEN ? YYUNDFTOKEN : (a))
#if YYDEBUG
static const char *const yyname[] = {

"end-of-file",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
"'!'","'\"'",0,"'$'","'%'","'&'",0,"'('","')'","'*'","'+'",0,"'-'",0,"'/'",0,0,
0,0,0,0,0,0,0,0,0,"';'","'<'","'='","'>'","'?'",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,"'['",0,"']'",0,"'_'",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,"'{'","'|'","'}'",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Int","HICODE",
"KTHKBYE","VISIVEL","LEARNTHZ","f","call","VAR","STRING","NUM",0,0,0,0,0,0,0,0,
0,0,0,0,"illegal-symbol",
};
static const char *const yyrule[] = {
"$accept : siplp",
"siplp : intvars funcs HICODE insts KTHKBYE",
"intvars : Int intvar ';'",
"intvars : Int intvar ';' intvars",
"intvar : VAR",
"intvar : VAR '=' NUM",
"intvar : VAR '[' NUM ']'",
"intvar : VAR '[' NUM ']' '[' NUM ']'",
"funcs : func",
"funcs : funcs func",
"funcs :",
"func : f STRING '{' insts '}'",
"insts : inst",
"insts : insts inst",
"inst : VISIVEL factor ';'",
"inst : VISIVEL '\"' STRING '\"' ';'",
"inst : LEARNTHZ data ';'",
"inst : data '=' expr ';'",
"inst : '?' '(' expr ')' '{' insts '}'",
"inst : '?' '(' expr ')' '{' insts '}' '_' '{' insts '}'",
"inst : '$' '(' expr ')' '{' insts '}'",
"inst : call STRING ';'",
"inst :",
"data : VAR",
"data : VAR '[' expr ']'",
"data : VAR '[' expr ']' '[' expr ']'",
"expr : parcel",
"expr : expr '+' parcel",
"expr : expr '-' parcel",
"parcel : parcel '*' factor",
"parcel : parcel '/' factor",
"parcel : parcel '%' factor",
"parcel : parcel '>' factor",
"parcel : parcel '<' factor",
"parcel : parcel '>' '=' factor",
"parcel : parcel '<' '=' factor",
"parcel : parcel '!' '=' factor",
"parcel : parcel '=' '=' factor",
"parcel : parcel '&' factor",
"parcel : parcel '|' factor",
"parcel : factor",
"factor : NUM",
"factor : VAR",
"factor : VAR '[' expr ']'",
"factor : VAR '[' expr ']' '[' expr ']'",
"factor : '(' expr ')'",

};
#endif

int      yydebug;
int      yynerrs;

int      yyerrflag;
int      yychar;
YYSTYPE  yyval;
YYSTYPE  yylval;

/* define the initial stack-sizes */
#ifdef YYSTACKSIZE
#undef YYMAXDEPTH
#define YYMAXDEPTH  YYSTACKSIZE
#else
#ifdef YYMAXDEPTH
#define YYSTACKSIZE YYMAXDEPTH
#else
#define YYSTACKSIZE 10000
#define YYMAXDEPTH  10000
#endif
#endif

#define YYINITSTACKSIZE 200

typedef struct {
    unsigned stacksize;
    YYINT    *s_base;
    YYINT    *s_mark;
    YYINT    *s_last;
    YYSTYPE  *l_base;
    YYSTYPE  *l_mark;
} YYSTACKDATA;
/* variables for the parser stack */
static YYSTACKDATA yystack;
#line 112 "progz.y"

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
#line 390 "y.tab.c"

#if YYDEBUG
#include <stdio.h>		/* needed for printf */
#endif

#include <stdlib.h>	/* needed for malloc, etc */
#include <string.h>	/* needed for memset */

/* allocate initial stack or double stack size, up to YYMAXDEPTH */
static int yygrowstack(YYSTACKDATA *data)
{
    int i;
    unsigned newsize;
    YYINT *newss;
    YYSTYPE *newvs;

    if ((newsize = data->stacksize) == 0)
        newsize = YYINITSTACKSIZE;
    else if (newsize >= YYMAXDEPTH)
        return YYENOMEM;
    else if ((newsize *= 2) > YYMAXDEPTH)
        newsize = YYMAXDEPTH;

    i = (int) (data->s_mark - data->s_base);
    newss = (YYINT *)realloc(data->s_base, newsize * sizeof(*newss));
    if (newss == 0)
        return YYENOMEM;

    data->s_base = newss;
    data->s_mark = newss + i;

    newvs = (YYSTYPE *)realloc(data->l_base, newsize * sizeof(*newvs));
    if (newvs == 0)
        return YYENOMEM;

    data->l_base = newvs;
    data->l_mark = newvs + i;

    data->stacksize = newsize;
    data->s_last = data->s_base + newsize - 1;
    return 0;
}

#if YYPURE || defined(YY_NO_LEAKS)
static void yyfreestack(YYSTACKDATA *data)
{
    free(data->s_base);
    free(data->l_base);
    memset(data, 0, sizeof(*data));
}
#else
#define yyfreestack(data) /* nothing */
#endif

#define YYABORT  goto yyabort
#define YYREJECT goto yyabort
#define YYACCEPT goto yyaccept
#define YYERROR  goto yyerrlab

int
YYPARSE_DECL()
{
    int yym, yyn, yystate;
#if YYDEBUG
    const char *yys;

    if ((yys = getenv("YYDEBUG")) != 0)
    {
        yyn = *yys;
        if (yyn >= '0' && yyn <= '9')
            yydebug = yyn - '0';
    }
#endif

    yynerrs = 0;
    yyerrflag = 0;
    yychar = YYEMPTY;
    yystate = 0;

#if YYPURE
    memset(&yystack, 0, sizeof(yystack));
#endif

    if (yystack.s_base == NULL && yygrowstack(&yystack) == YYENOMEM) goto yyoverflow;
    yystack.s_mark = yystack.s_base;
    yystack.l_mark = yystack.l_base;
    yystate = 0;
    *yystack.s_mark = 0;

yyloop:
    if ((yyn = yydefred[yystate]) != 0) goto yyreduce;
    if (yychar < 0)
    {
        if ((yychar = YYLEX) < 0) yychar = YYEOF;
#if YYDEBUG
        if (yydebug)
        {
            yys = yyname[YYTRANSLATE(yychar)];
            printf("%sdebug: state %d, reading %d (%s)\n",
                    YYPREFIX, yystate, yychar, yys);
        }
#endif
    }
    if ((yyn = yysindex[yystate]) && (yyn += yychar) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yychar)
    {
#if YYDEBUG
        if (yydebug)
            printf("%sdebug: state %d, shifting to state %d\n",
                    YYPREFIX, yystate, yytable[yyn]);
#endif
        if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack) == YYENOMEM)
        {
            goto yyoverflow;
        }
        yystate = yytable[yyn];
        *++yystack.s_mark = yytable[yyn];
        *++yystack.l_mark = yylval;
        yychar = YYEMPTY;
        if (yyerrflag > 0)  --yyerrflag;
        goto yyloop;
    }
    if ((yyn = yyrindex[yystate]) && (yyn += yychar) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yychar)
    {
        yyn = yytable[yyn];
        goto yyreduce;
    }
    if (yyerrflag) goto yyinrecovery;

    YYERROR_CALL("syntax error");

    goto yyerrlab;

yyerrlab:
    ++yynerrs;

yyinrecovery:
    if (yyerrflag < 3)
    {
        yyerrflag = 3;
        for (;;)
        {
            if ((yyn = yysindex[*yystack.s_mark]) && (yyn += YYERRCODE) >= 0 &&
                    yyn <= YYTABLESIZE && yycheck[yyn] == YYERRCODE)
            {
#if YYDEBUG
                if (yydebug)
                    printf("%sdebug: state %d, error recovery shifting\
 to state %d\n", YYPREFIX, *yystack.s_mark, yytable[yyn]);
#endif
                if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack) == YYENOMEM)
                {
                    goto yyoverflow;
                }
                yystate = yytable[yyn];
                *++yystack.s_mark = yytable[yyn];
                *++yystack.l_mark = yylval;
                goto yyloop;
            }
            else
            {
#if YYDEBUG
                if (yydebug)
                    printf("%sdebug: error recovery discarding state %d\n",
                            YYPREFIX, *yystack.s_mark);
#endif
                if (yystack.s_mark <= yystack.s_base) goto yyabort;
                --yystack.s_mark;
                --yystack.l_mark;
            }
        }
    }
    else
    {
        if (yychar == YYEOF) goto yyabort;
#if YYDEBUG
        if (yydebug)
        {
            yys = yyname[YYTRANSLATE(yychar)];
            printf("%sdebug: state %d, error recovery discards token %d (%s)\n",
                    YYPREFIX, yystate, yychar, yys);
        }
#endif
        yychar = YYEMPTY;
        goto yyloop;
    }

yyreduce:
#if YYDEBUG
    if (yydebug)
        printf("%sdebug: state %d, reducing by rule %d (%s)\n",
                YYPREFIX, yystate, yyn, yyrule[yyn]);
#endif
    yym = yylen[yyn];
    if (yym)
        yyval = yystack.l_mark[1-yym];
    else
        memset(&yyval, 0, sizeof yyval);
    switch (yyn)
    {
case 1:
#line 42 "progz.y"
	{ printf("%sjump inic\n%sstart\ninic: %sstop\n", yystack.l_mark[-4].s, yystack.l_mark[-3].s, yystack.l_mark[-1].s); }
break;
case 2:
#line 45 "progz.y"
	{ yyval.s = yystack.l_mark[-1].s; }
break;
case 3:
#line 46 "progz.y"
	{ asprintf(&yyval.s, "%s%s", yystack.l_mark[-2].s, yystack.l_mark[0].s); }
break;
case 4:
#line 49 "progz.y"
	{ asprintf(&yyval.s, "\tpushi 0\n"); addVar(yystack.l_mark[0].s); }
break;
case 5:
#line 50 "progz.y"
	{ asprintf(&yyval.s, "\tpushi %d\n", yystack.l_mark[0].n); addVar(yystack.l_mark[-2].s); }
break;
case 6:
#line 51 "progz.y"
	{ asprintf(&yyval.s, "\tpushn %d\n", yystack.l_mark[-1].n); addVector(yystack.l_mark[-3].s, yystack.l_mark[-1].n, 0);}
break;
case 7:
#line 52 "progz.y"
	{ asprintf(&yyval.s, "\tpushn %d\n", yystack.l_mark[-4].n * yystack.l_mark[-1].n); addVector(yystack.l_mark[-6].s, yystack.l_mark[-4].n, yystack.l_mark[-1].n);}
break;
case 8:
#line 55 "progz.y"
	{ yyval.s = yystack.l_mark[0].s; }
break;
case 9:
#line 56 "progz.y"
	{ asprintf(&yyval.s, "%s%s", yystack.l_mark[-1].s, yystack.l_mark[0].s); }
break;
case 10:
#line 57 "progz.y"
	{ yyval.s = ""; }
break;
case 11:
#line 60 "progz.y"
	{ asprintf(&yyval.s, "%s: nop\n%s\treturn\n", yystack.l_mark[-3].s, yystack.l_mark[-1].s); }
break;
case 12:
#line 63 "progz.y"
	{ yyval.s = yystack.l_mark[0].s; }
break;
case 13:
#line 64 "progz.y"
	{ asprintf(&yyval.s, "%s%s", yystack.l_mark[-1].s, yystack.l_mark[0].s); }
break;
case 14:
#line 66 "progz.y"
	{ asprintf(&yyval.s, "%s\twritei\n", yystack.l_mark[-1].s);}
break;
case 15:
#line 67 "progz.y"
	{ asprintf(&yyval.s, "\tpushs \"%s\"\n\twrites\n", yystack.l_mark[-2].s); }
break;
case 16:
#line 68 "progz.y"
	{ asprintf(&yyval.s, "%s\tread\n\tatoi\n\%s", yystack.l_mark[-1].ss.begin, yystack.l_mark[-1].ss.end); }
break;
case 17:
#line 69 "progz.y"
	{ asprintf(&yyval.s, "%s%s%s", yystack.l_mark[-3].ss.begin, yystack.l_mark[-1].s, yystack.l_mark[-3].ss.end); }
break;
case 18:
#line 70 "progz.y"
	{ asprintf(&yyval.s, "%s\tjz label%d\n%slabel%d: ", yystack.l_mark[-4].s, label,
                                           yystack.l_mark[-1].s, label); label++; }
break;
case 19:
#line 72 "progz.y"
	{ asprintf(&yyval.s, "%s\tjz label%d\n%sjump label%d\nlabel%d: %slabel%d: ",
              yystack.l_mark[-8].s, label, yystack.l_mark[-5].s, label + 1, label, yystack.l_mark[-1].s, label + 1); label += 2; }
break;
case 20:
#line 74 "progz.y"
	{ asprintf(&yyval.s, "label%d: %s\tjz label%d\n%sjump label%d\nlabel%d: ",
     label, yystack.l_mark[-4].s, label + 1, yystack.l_mark[-1].s, label, label + 1); label += 2; }
break;
case 21:
#line 76 "progz.y"
	{ asprintf(&yyval.s, "\tpusha %s\n\tcall\n\tnop\n", yystack.l_mark[-1].s); }
break;
case 22:
#line 77 "progz.y"
	{ yyval.s = ""; }
break;
case 23:
#line 80 "progz.y"
	{ asprintf(&yyval.ss.begin, "");
                                      asprintf(&yyval.ss.end, "\tstoreg %d\n", getVar(yystack.l_mark[0].s)); }
break;
case 24:
#line 82 "progz.y"
	{ asprintf(&yyval.ss.begin, "\tpushgp\n\tpushi %d\n\tpadd\n%s", getVector(yystack.l_mark[-3].s), yystack.l_mark[-1].s);
                                      asprintf(&yyval.ss.end, "\tstoren\n"); }
break;
case 25:
#line 84 "progz.y"
	{ asprintf(&yyval.ss.begin, "\tpushgp\n\tpushi %d\n\tpadd\n%s\tpushi %d\n\tmul\n%s\tadd\n", getVector(yystack.l_mark[-6].s), yystack.l_mark[-4].s, getVectorCol(yystack.l_mark[-6].s), yystack.l_mark[-1].s);
                                      asprintf(&yyval.ss.end, "\tstoren\n"); }
break;
case 26:
#line 87 "progz.y"
	{ yyval.s = yystack.l_mark[0].s; }
break;
case 27:
#line 88 "progz.y"
	{ asprintf(&yyval.s, "%s%s\tadd\n", yystack.l_mark[-2].s, yystack.l_mark[0].s); }
break;
case 28:
#line 89 "progz.y"
	{ asprintf(&yyval.s, "%s%s\tsub\n", yystack.l_mark[-2].s, yystack.l_mark[0].s); }
break;
case 29:
#line 91 "progz.y"
	{ asprintf(&yyval.s, "%s%s\tmul\n", yystack.l_mark[-2].s, yystack.l_mark[0].s); }
break;
case 30:
#line 92 "progz.y"
	{ asprintf(&yyval.s, "%s%s\tdiv\n", yystack.l_mark[-2].s, yystack.l_mark[0].s); }
break;
case 31:
#line 93 "progz.y"
	{ asprintf(&yyval.s, "%s%s\tmod\n", yystack.l_mark[-2].s, yystack.l_mark[0].s); }
break;
case 32:
#line 94 "progz.y"
	{ asprintf(&yyval.s, "%s%s\tsup\n", yystack.l_mark[-2].s, yystack.l_mark[0].s); }
break;
case 33:
#line 95 "progz.y"
	{ asprintf(&yyval.s, "%s%s\tinf\n", yystack.l_mark[-2].s, yystack.l_mark[0].s); }
break;
case 34:
#line 96 "progz.y"
	{ asprintf(&yyval.s, "%s%s\tsupeq\n", yystack.l_mark[-3].s, yystack.l_mark[0].s); }
break;
case 35:
#line 97 "progz.y"
	{ asprintf(&yyval.s, "%s%s\tinfeq\n", yystack.l_mark[-3].s, yystack.l_mark[0].s); }
break;
case 36:
#line 98 "progz.y"
	{ asprintf(&yyval.s, "%s%s\tequal\npushi 1\ninf\n", yystack.l_mark[-3].s, yystack.l_mark[0].s); }
break;
case 37:
#line 99 "progz.y"
	{ asprintf(&yyval.s, "%s%s\tequal\n", yystack.l_mark[-3].s, yystack.l_mark[0].s); }
break;
case 38:
#line 100 "progz.y"
	{ asprintf(&yyval.s, "%s%s\tadd\n\tpushi 2\n\tequal\n", yystack.l_mark[-2].s, yystack.l_mark[0].s); }
break;
case 39:
#line 101 "progz.y"
	{ asprintf(&yyval.s, "%s%s\tadd\n\tpushi 0\n\tsup\n", yystack.l_mark[-2].s, yystack.l_mark[0].s); }
break;
case 40:
#line 102 "progz.y"
	{ yyval.s = yystack.l_mark[0].s; }
break;
case 41:
#line 104 "progz.y"
	{ asprintf(&yyval.s, "\tpushi %d\n", yystack.l_mark[0].n); }
break;
case 42:
#line 105 "progz.y"
	{ asprintf(&yyval.s, "\tpushg %d\n", getVar(yystack.l_mark[0].s)); }
break;
case 43:
#line 106 "progz.y"
	{ asprintf(&yyval.s, "\tpushgp\n\tpushi %d\n\tpadd\n%s\tloadn\n", getVector(yystack.l_mark[-3].s), yystack.l_mark[-1].s); }
break;
case 44:
#line 107 "progz.y"
	{ asprintf(&yyval.s, "\tpushgp\n\tpushi %d\n\tpadd\n%s\tpushi %d\n\tmul\n%s\tadd\n\tloadn\n", getVector(yystack.l_mark[-6].s), yystack.l_mark[-4].s, getVectorCol(yystack.l_mark[-6].s), yystack.l_mark[-1].s); }
break;
case 45:
#line 108 "progz.y"
	{ yyval.s = yystack.l_mark[-1].s; }
break;
#line 778 "y.tab.c"
    }
    yystack.s_mark -= yym;
    yystate = *yystack.s_mark;
    yystack.l_mark -= yym;
    yym = yylhs[yyn];
    if (yystate == 0 && yym == 0)
    {
#if YYDEBUG
        if (yydebug)
            printf("%sdebug: after reduction, shifting from state 0 to\
 state %d\n", YYPREFIX, YYFINAL);
#endif
        yystate = YYFINAL;
        *++yystack.s_mark = YYFINAL;
        *++yystack.l_mark = yyval;
        if (yychar < 0)
        {
            if ((yychar = YYLEX) < 0) yychar = YYEOF;
#if YYDEBUG
            if (yydebug)
            {
                yys = yyname[YYTRANSLATE(yychar)];
                printf("%sdebug: state %d, reading %d (%s)\n",
                        YYPREFIX, YYFINAL, yychar, yys);
            }
#endif
        }
        if (yychar == YYEOF) goto yyaccept;
        goto yyloop;
    }
    if ((yyn = yygindex[yym]) && (yyn += yystate) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yystate)
        yystate = yytable[yyn];
    else
        yystate = yydgoto[yym];
#if YYDEBUG
    if (yydebug)
        printf("%sdebug: after reduction, shifting from state %d \
to state %d\n", YYPREFIX, *yystack.s_mark, yystate);
#endif
    if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack) == YYENOMEM)
    {
        goto yyoverflow;
    }
    *++yystack.s_mark = (YYINT) yystate;
    *++yystack.l_mark = yyval;
    goto yyloop;

yyoverflow:
    YYERROR_CALL("yacc stack overflow");

yyabort:
    yyfreestack(&yystack);
    return (1);

yyaccept:
    yyfreestack(&yystack);
    return (0);
}

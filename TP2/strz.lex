%option noyywrap
%option yylineno
%x INTS INSTRUCTIONS READ WRITE ARRAYS INSTR EXPR COND FUNC CALL

%%
<INITIAL>Int              { BEGIN INTS; return Int; }
<INTS>[A-Za-z]+           { yylval.s = strdup(yytext); return VAR; }
<INTS>[0-9]+              { yylval.n = atof(yytext); return NUM; }
<INTS>[,=\[\]]            { return yytext[0]; }
<INTS>;                   { BEGIN INITIAL; return yytext[0]; }
<INTS>[ \t\n]*            { }

<INITIAL>func             { BEGIN FUNC; return f; }
<FUNC>[A-Za-z]+           { yylval.s = strdup(yytext); return STRING; }
<FUNC>[{]                 { BEGIN INSTRUCTIONS; return yytext[0]; }

<INITIAL>HICODE           { BEGIN INSTRUCTIONS; return HICODE; }
<INSTRUCTIONS>HICODE      { return HICODE; }
<INSTRUCTIONS>KTHKBYE     { BEGIN INITIAL; return KTHKBYE; }
<INSTRUCTIONS>[ \t\n]     { }

<INSTRUCTIONS>VISIVEL     { BEGIN WRITE; return VISIVEL; }
<WRITE>[\[\]]             { return yytext[0]; }
<WRITE>["]                { BEGIN INSTR; return yytext[0]; }
<WRITE>[A-Za-z]+          { yylval.s = strdup(yytext); return VAR; }
<WRITE>[0-9]+             { yylval.n = atof(yytext); return NUM; }
<INSTR>[^"]+              { yylval.s = strdup(yytext); return STRING; }
<INSTR>["]                { BEGIN WRITE; return yytext[0]; }
<WRITE>;                  { BEGIN INSTRUCTIONS; return yytext[0]; }
<WRITE>[()]               {  }


<INSTRUCTIONS>LEARNTHZ    { BEGIN READ; return LEARNTHZ; }
<READ>[\[\]]              { return yytext[0]; }
<READ>[A-Za-z]+           { yylval.s = strdup(yytext); return VAR; }
<READ>[0-9]+              { yylval.n = atof(yytext); return NUM; }
<READ>;                   { BEGIN INSTRUCTIONS; return yytext[0]; }
<READ>[()]                {  }

<INSTRUCTIONS>call        { BEGIN CALL; return call; }
<CALL>[A-Za-z]+           { yylval.s = strdup(yytext); return STRING; }
<CALL>[;]                 { BEGIN INSTRUCTIONS; return yytext[0]; }
<CALL>[\t ]*              { }

<INSTRUCTIONS>[A-Za-z]+   { BEGIN EXPR; yylval.s = strdup(yytext); return VAR; }
<EXPR>[-+*/%()=\[\]]      { return yytext[0]; }
<EXPR>[0-9]+              { yylval.n = atof(yytext); return NUM; }
<EXPR>[A-Za-z]+           { yylval.s = strdup(yytext); return VAR; }
<EXPR>;                   { BEGIN INSTRUCTIONS; return yytext[0]; }

<INSTRUCTIONS>[?$]        { BEGIN COND; return yytext[0]; }
<COND>[-+*/%()=><!\[\]]   { return yytext[0]; }
<COND>[0-9]+              { yylval.n = atof(yytext); return NUM; }
<COND>[A-Za-z]+           { yylval.s = strdup(yytext); return VAR; }
<COND>[{]                 { BEGIN INSTRUCTIONS; return yytext[0]; }
<COND>[ \t\n]*            { }


<INSTRUCTIONS>[}_{]       { return yytext[0]; }

<*>#.*                    { }
<*>.|\n                   { }
%%


%{
#define YYSTYPE char*
#include "cucu.tab.h"
%}
%%
"/*"([^*]|\*+[^*/])*\*+"/"
\/\/.* ;
(^i|i)nt {fprintf(yyout,"TYPE : %s\n",yytext);return TYPE;}
(^c|c)har" "\* {fprintf(yyout,"TYPE : %s\n",yytext);return TYPE;}
(^i|i)f {fprintf(yyout,"IF : %s\n",yytext);return IF;}
(^e|e)lse {fprintf(yyout,"ELSE : %s\n",yytext);return ELSE;}
(^w|w)hile {fprintf(yyout,"WHILE : %s\n",yytext);return WHILE;}
(^r|r)eturn {fprintf(yyout,"RETURN : %s\n",yytext);return RETURN;}
[a-zA-Z][a-zA-Z0-9_]* {yylval=strdup(yytext); fprintf(yyout,"ID : %s\n",yytext);return ID;}
[0-9]+ {yylval=yytext; fprintf(yyout,"NUM : %s\n",yytext);return NUM;}
; {fprintf(yyout,"SEMI : %s\n",yytext);return SEMI;}
(\() {fprintf(yyout,"OPEN_PAREN : %s\n",yytext);return OPEN_PAREN;}
(\)) {fprintf(yyout,"CLOSE_PAREN : %s\n",yytext);return CLOSE_PAREN;}
(\[) {fprintf(yyout,"SQUAR_OPEN : %s\n",yytext);return SQUAR_OPEN;}
(\]) {fprintf(yyout,"SQUAR_CLOSE : %s\n",yytext);return SQUAR_CLOSE;}
(\{) {fprintf(yyout,"CURLY_OPEN : %s\n",yytext);return CURLY_OPEN;}
(\}) {fprintf(yyout,"CURLY_CLOSE : %s\n",yytext);return CURLY_CLOSE;}
"*" {fprintf(yyout,"MUL : *\n");return MUL;}
"/" {fprintf(yyout,"DIV : /\n");return DIV;}
"+" {fprintf(yyout,"PLUS : +\n");return PLUS;}
"-" {fprintf(yyout,"SUB : -\n");return SUB;}
"," {fprintf(yyout,"COMMA : ,\n");return COMMA;}
"==" {fprintf(yyout,"EQLS : %s\n",yytext);return EQLS;} 
"!=" {fprintf(yyout,"NOT_EQLS : %s\n",yytext);return NOT_EQLS;}
"=" {fprintf(yyout,"ASSIGN : %s\n",yytext);return ASSIGN;}
\< {fprintf(yyout,"LESS_THAN : %s\n",yytext);return LESS_THAN;}
\> {fprintf(yyout,"MORE_THAN : %s\n",yytext);return MORE_THAN;}
[ \t]+ ;
[\n] ;
%%
int yywrap() 
 { 
  return 1; 
 } 
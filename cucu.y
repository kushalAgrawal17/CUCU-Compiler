%{
#include<stdio.h>
#include<stdlib.h>
#define YYSTYPE char*
int yylex();
int yyerror();
int flag = 0;
FILE *yyin, *yyout, *yyout2;
%}
%token COMMA PLUS SUB MUL DIV ID NUM TYPE SEMI ASSIGN OPEN_PAREN CLOSE_PAREN EQLS NOT_EQLS SQUAR_OPEN SQUAR_CLOSE CURLY_OPEN CURLY_CLOSE LESS_THAN MORE_THAN IF ELSE WHILE RETURN
%%
program : var_dec program 
        | func_dec SEMI program
        | func_def program
        |
        ;
var_dec : TYPE ID SEMI { fprintf(yyout2,"global variable: %s\n",yylval);}
func_dec : TYPE ID { fprintf(yyout2,"identifier: %s\n",yylval);} OPEN_PAREN func_arg CLOSE_PAREN 
func_arg: TYPE ID  { fprintf(yyout2,"function argument: %s\n",yylval);}
        | TYPE ID { fprintf(yyout2,"function argument: %s\n",yylval);} COMMA func_arg 
        |
        ;
func_def: func_dec CURLY_OPEN { fprintf(yyout2,"function body \n");} func_body CURLY_CLOSE 
func_body: stmt
        | stmt func_body
        ;
stmt: assign_st SEMI
        |local_var_dec
        |st SEMI
        |func_call SEMI
        |return_st SEMI
        |{ fprintf(yyout2,"IF-STMT\n");} if_st { fprintf(yyout2,"END-IF\n");}
        |{ fprintf(yyout2,"While-STMT \n");} while_st {fprintf(yyout2,"END-LOOP\n");}
        |
        ;
local_var_dec: TYPE ID SEMI { fprintf(yyout2,"local variable: %s\n",yylval);}
st: ID { fprintf(yyout2,"assign: %s\n",yylval);} ASSIGN expr { fprintf(yyout2," :=\n");}
        | ID { fprintf(yyout2,"Var-%s",yylval);} SQUAR_OPEN expr SQUAR_CLOSE { fprintf(yyout2," [] ");} ASSIGN expr { fprintf(yyout2,":=\n");} 
assign_st: TYPE ID { fprintf(yyout2,"local variable: %s\n",yylval);} ASSIGN expr { fprintf(yyout2," :=\n");}
expr: expr PLUS term { fprintf(yyout2," + ");}
        | expr SUB term { fprintf(yyout2," - ");}
        | term;
term: term MUL factor { fprintf(yyout2," * ");}
        | term DIV factor { fprintf(yyout2," / ");}
        | factor;
factor: OPEN_PAREN expr CLOSE_PAREN { fprintf(yyout2," () ");}
        | ID { fprintf(yyout2," Var-%s", yylval);}
        | NUM { fprintf(yyout2," Const-%s", yylval);}
        | ID { fprintf(yyout2,"Var-%s",yylval);} SQUAR_OPEN expr SQUAR_CLOSE { fprintf(yyout2," [] ");}

func_call: ID  OPEN_PAREN list_expr CLOSE_PAREN { fprintf(yyout2,"FUNC-CALL \n");}
list_expr: expr { fprintf(yyout2," FUNC-PARAMETER \n");} COMMA list_expr 
        | expr { fprintf(yyout2," FUNC-PARAMETER \n");}
        |;
return_st: RETURN expr { fprintf(yyout2," RETURN ");}
if_st: IF OPEN_PAREN bool_expr CLOSE_PAREN CURLY_OPEN stmt CURLY_CLOSE 
        | IF OPEN_PAREN bool_expr CLOSE_PAREN CURLY_OPEN stmt CURLY_CLOSE { fprintf(yyout2,"ELSE-STMT\n");} else_st;
else_st: ELSE CURLY_OPEN stmt CURLY_CLOSE;
while_st: WHILE OPEN_PAREN bool_expr CLOSE_PAREN CURLY_OPEN stmt CURLY_CLOSE; 
bool_expr: { fprintf(yyout2,"Condition: ");} expr bool_op expr { fprintf(yyout2," bool_operator \n");}
        | { fprintf(yyout2,"Condition: ");} expr;
bool_op: LESS_THAN | MORE_THAN | LESS_THAN ASSIGN | MORE_THAN ASSIGN | EQLS | NOT_EQLS ;

%%
int main(int argc, char *argv[])
{
    if(argc!=2)
    {
    printf("No arguments passed\n");
    exit(0);
    }
    yyin=fopen(argv[1],"r");
    yyout=fopen("Lexer.txt","w");
    yyout2=fopen("Parser.txt","w");
    yyparse();
    yylex();
    if (flag == 0){
        printf("Code valid.\n");
    }
    return 0;    
}                                                                                                                                                                                                                                                                                                                                                                            
yyerror()
 {
  fprintf(yyout,"Error Code Invalid.\n");
  printf("Code Invalid.\n");
  flag = 1;
 }


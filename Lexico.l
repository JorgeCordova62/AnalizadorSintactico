%{
#include <stdio.h>
void yyerror(char *);
#include "y.tab.h"

/* Generacion de tokens*/
%}
Caracter     \"[a-z]\"
Cadena      \"[a-z0-9A-Z]+\"
Identificador   [a-zA-Z][_]*[a-zA-Z0-9]*
digito      [0-9]                   
nentero     {digito}+               
nreal       {nentero}\.{digito}*
Operador      [=*+/-]*
Reservado   (if)|(for)|(while)
tipodato    (int)|(float)|(bolean)
logico      (>=)|(<=)|(==)|(!=)|(>)|(<)


/* Tarea que realizar cuando detecta algun caracter*/
%%

{nentero}           {return nentero;}
{tipodato}          {return tipodato;}
{logico}           {return logico;}
{Identificador}     {return Identificador;}



[\}\{]              return *yytext;
[-+*=\(\),\n]      return *yytext;

[ \t]       ;
.           yyerror("invalido\n");

%%

/*Ejecucucion */
int yywrap(void){
    return 1;
}
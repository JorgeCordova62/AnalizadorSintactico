%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "y.tab.h"


/* Generacion de tokens*/
%}
 
Caracter     \'[a-z0-9A-Z]\'
Cadena      \"[a-z0-9A-Z\t ]*\"
Identificador   [a-zA-Z][_]*[a-zA-Z0-9]*
digito      [0-9] 
flotanega      "\-"{flotante} 
flotante      {nentero}\.{digito}*   
negaente        "\-"{nentero}      
nentero     {digito}+  
Operador      [=*+/-]*
Reservado   (if)|(for)|(while)
tipodato    (int)|(float)|(bolean)|(String)|(char)
logico      (>=)|(<=)|(==)|(!=)|(>)|(<)
negaent     "-"{digito}+ 


/* Tarea que realizar cuando detecta algun caracter  [-+*=\(\),\n]      return *yytext;    */
/* [\}\{]              return *yytext;     */
/* [ \t]       ;  */



%%




{flotanega}           { 
    char cadena[128] = "Numero flotante negativo  : ";
    FILE* fichero;
    fichero = fopen("SalidaFlex.txt", "a");  
    strcat(cadena, yytext);  
    strcat(cadena, "\n"); 
    fputs(cadena , fichero); 
     /*printf ("%s",cadena); */
    fclose(fichero);
    return flotanega;}

{flotante}           { 
    char cadena[128] = "Numero flotante  : ";
    FILE* fichero;
    fichero = fopen("SalidaFlex.txt", "a");  
    strcat(cadena, yytext);  
    strcat(cadena, "\n"); 
    fputs(cadena , fichero); 
     /*printf ("%s",cadena); */
    fclose(fichero);
    return flotante;}
  
  
{negaente}           { 
    char cadena[128] = "Numero entero negativo  : ";
    FILE* fichero;
    fichero = fopen("SalidaFlex.txt", "a");  
    strcat(cadena, yytext);  
    strcat(cadena, "\n"); 
    fputs(cadena , fichero); 
     /*printf ("%s",cadena); */
    fclose(fichero);
    return negaente;}
 
{nentero}           { 
    char cadena[128] = "Numero entero  : ";
    FILE* fichero;
    fichero = fopen("SalidaFlex.txt", "a");  
    strcat(cadena, yytext);  
    strcat(cadena, "\n"); 
    fputs(cadena , fichero); 
     /*printf ("%s",cadena); */
    fclose(fichero);
    return nentero;}





{tipodato}          {
    char cadena[128] = "Tipo de dato : ";
    FILE* fichero;
    fichero = fopen("SalidaFlex.txt", "a");
    strcat(cadena, yytext); 
    strcat(cadena, "\n"); 
    fputs(cadena , fichero); 
    /*printf ("%s",cadena);  */
    fclose(fichero);
    return tipodato;}

{logico}            {
    char cadena[128] = "Tipo dato logico : ";
    FILE* fichero;
    fichero = fopen("SalidaFlex.txt", "a");
    strcat(cadena, yytext); 
    strcat(cadena, "\n"); 
    fputs(cadena , fichero); 
     /*printf ("%s",cadena);  */
    fclose(fichero);
    return logico;}

{Caracter}           { 
    char cadena[128] = "Caracter  : ";
    FILE* fichero;
    fichero = fopen("SalidaFlex.txt", "a");  
    strcat(cadena, yytext);  
    strcat(cadena, "\n"); 
    fputs(cadena , fichero); 
     /*printf ("%s",cadena); */
    fclose(fichero);
    return Caracter;}

{Cadena}           { 
    char cadena[128] = "Cadena  : ";
    FILE* fichero;
    fichero = fopen("SalidaFlex.txt", "a");  
    strcat(cadena, yytext);  
    strcat(cadena, "\n"); 
    fputs(cadena , fichero); 
     /*printf ("%s",cadena); */
    fclose(fichero);
    return Cadena;}

{Identificador}     {
    char cadena[128] = "Tipo identificador: ";
    FILE* fichero;
    fichero = fopen("SalidaFlex.txt", "a");
    strcat(cadena, yytext); 
    strcat(cadena, "\n"); 
    fputs(cadena , fichero); 
     /*printf ("%s",cadena);  */
    fclose(fichero);
    return Identificador;}











[-+*=\(\),\n]      return *yytext;

.           {
    char cadena[128] = "Token no reconocido: ";
    FILE* fichero;
    fichero = fopen("SalidaFlex.txt", "a");
    strcat(cadena, yytext); 
    strcat(cadena, "\n"); 
    fputs(cadena , fichero); 
     /*printf ("%s",cadena);  */
    fclose(fichero);
    return Identificador;}


%%

/*Ejecucucion */
int yywrap(void){
    return 1;
}



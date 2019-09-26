%{
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    int yylex(void);
    void yyerror(char *);
    int sum = 0;


%}
/* Tokens utilizados para la deteccion del analizador*/
%token flotante
%token nentero
%token Identificador
%token tipodato
%token logico

%token negaent

%%


/* Gramatica */
program:
        program declarar '\n' {sum++; }
        | 
        ;




declarar:
        asigna
        | tipodato asigna           
        | tipodato asigna ',' declarar
        | tipodato asigna '(' declarar ')' '{'
        | 
        ;



asigna: 
        expr
        |   Identificador '=' expr
        |   Identificador comparacion expr
        ;



expr:   
        term             
        |   term '+' expr  
        |   term '-' expr   
        ;

term:
        factor
        |   factor '*' term
        ;

factor:
        iden
        ;

comparacion:
                logico
                ;

iden:  
        Identificador
        |   nentero
        |   flotante
        ;







%%

/* Ejecucion del programa*/

void yyerror(char *s){
    sum++;
    char cadena[128];
    FILE* fichero2;
    fichero2 = fopen("SalidaSintaxis.txt", "a");
    sprintf(cadena,"Error de sintaxis en la linea %d \n", sum); 
    fputs(cadena , fichero2); 
     /*printf ("%s",cadena);  */
    fclose(fichero2);
    yyparse();


}

int main (void){
    FILE* fichero;
    fichero = fopen("SalidaFlex.txt", "w");
    fclose(fichero);
    FILE* fichero2;
    fichero2 = fopen("SalidaSintaxis.txt", "w");
    fclose(fichero2);
    yyparse();

    return 0;
}
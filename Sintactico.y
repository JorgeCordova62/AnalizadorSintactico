%{
    #include <stdio.h>
    int yylex(void);
    void yyerror(char *);

%}
/* Tokens utilizados para la deteccion del analizador*/
%token nentero
%token Identificador
%token tipodato
%token logico

%%


/* Gramatica */
program:
        program declarar '\n' {printf("Aceptado\n");}
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
        ;







%%

/* Ejecucion del programa*/

void yyerror(char *s){
    fprintf(stderr, "%s\n", s);

}

int main (void){
    yyparse();
    return 0;
}
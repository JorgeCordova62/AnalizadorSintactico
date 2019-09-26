bison -yd SoloSintactico.y 

flex SoloFlex.l

gcc y.tab.c lex.yy.c -o salida

rm -r y.tab.c
rm -r y.tab.h
rm -r lex.yy.c

./salida
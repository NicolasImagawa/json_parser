%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token CO1 CO2 CH1 CH2 ASP ESP L N PTS VIR PVI EOL

%%
/*
Em relacao aos significados dos tokens:
CO1: [
CO2: ]
CH1: {
CH2: }
ASP: "
ESP: " " (sem as aspas)
L: [a-zA-Z]+[ 0-9a-zA-Z]*
N: [0-9(.)?]+
PTS: :
VIR: ,
PVI: ;
EOL: \n
*/

S: CH1 E PTS E CH2 { printf("VALIDO\n");
             exit(0); }

E:
 CH1 E PTS E CH2
 |CH1 EOL E PTS E CH2
 |CH1 EOL ESP E PTS E CH2
 |CO1 E CO2
 |ASP E ASP
 |E PTS E
 |E ESP
 |ESP E
 |ASP L ASP
 |E VIR ESP ASP L ASP E
 |E VIR ESP N E
 |E VIR ESP CO1 E CO2
 |E VIR ESP ASP E ASP
 |E VIR EOL E
 |N
 |E EOL E
 |
 ;

%%

void yyerror(char *s) {
  printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;
}

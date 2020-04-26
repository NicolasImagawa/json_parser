%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}


%%

[a-zA-Z]+[ 0-9a-zA-Z]* { return L; }

[0-9(.)?]+ { return N; }

[[] { return CO1; }

[]] { return CO2; }

[{] { return CH1; }

[}] { return CH2; }

[:] { return PTS; }

[;] { return PVI; }

["] { return ASP; }

[ ]* { return ESP; }

[,]? { return VIR; }

\n? { return EOL; }

. { yyerror("INVALIDO\n "); }

%%

int yywrap() {
  return 1;
}

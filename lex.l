{%
    #include <stdio.h>
    #include <string.h>
    
    typedef struct token{
        char name[];
        char code[];
        
    }

    token generate_token()

%}


%%
"if" {return generate_token("if",IF);}
"in" {return generate_token("in",IN);}
"else" {return generate_token("else",ELSE);}
"for" {return generate_token("for",FOR);}
"function" {return generate_token("function",FUNCTION);}
"int" {return generate_token("int",INT);}
"string" {return generate_token("if",STRING);}
"float" {return generate_token("if",FLOAT);}
"bool" {return generate_token("bool",BOOL);}
"," {return generate_token("comma",COMMA);}
"(" { return generate_token("(",LPAR); }
")" { return generate_token(")",RPAR); }
"{" { return generate_token("{",BEGIN); }
"}" { return generate_token("}",END); }
"<-" { return generate_token("<-",ASSIGN); }
"+" { return generate_token("plus",PLUS); }
"-" { return generate_token("minus",MINUS); }
"*" { return generate_token("mult",MULT); }
"/" { return generate_token("div",DIV); }
"<=" { return generate_token("leq",LEQ); }
">=" { return generate_token("gtq",GTQ); }
"==" { return generate_token("eq",EQ); }
"!=" { return generate_token("neq",NEQ); }
"<"  { return generate_token("le",LE); }
">"  { return generate_token("gt",GT); }
"&&" { return generate_token("and",AND); }
"||" { return generate_token("or",OR); }
"!"  { return generate_token("not",NOT); }
":"  { return generate_token("colon",COLON);}
([a-zA-Z_])([a-zA-Z0-9_.])*|([.][a-zA-Z_])([a-zA-Z0-9_.])* {return generate_token("Identifier",IDENT, yytext());}
[+-]?[1-9][0-9]*[lL]?|0[xX][0-9a-fA-F]+ {return generate_token("INTCONST",INTCONST, atoi(yytext());}
[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+) {return generate_token("FLOATCONST",FLOATCONST, atoi(yytext());}
TRUE|FALSE {return generate_token("BOOLCONST",BOOLCONST, atoi(yytext());}
\"([^\"])*\" {}
#.* {}
\r|\n|\r\n {}
[\r|\n|\r\n] | [ \t\f] {}




%%

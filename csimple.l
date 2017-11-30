%{
int counter = 1;
%}
%%
"boolean" return BOOLEAN;
"char" return CHAR;
"void" return VOID;
"int" return INT;
"string" return STRING;
"intp" return INTP;
"charp" return CHARP;
"if" return IF;
"else" return ELSE;
"while" return WHILE;
"do" return DO;
"for" return FOR;
"return" return RETURN;
"null" return _NULL;
"&&" return AND;
"/" return DIV;
"==" return EQ;
"=" return SET;
">=" return GE;
">" return GT;
"<=" return LE;
"<" return LT;
"-" return MINUS;
"!=" return NE;
"!" return NOT;
"+" return PLUS;
"*" return MULT;
"&" return REF;
"^" return HEIGHT;
[a-zA-Z]+ return IDENTIFIERE;
[0-9]+ return NUM;
"(" return LEFT_CIRC_BRAK;
")" return RIGHT_CIRC_BRAK;
"[" return LEFT_SQR_BRAK;
"]" return RIGHT_SQR_BRAK;
"{" return LEFT_BLOCK_BRAK;
"}" return RIGHT_BLOCK_BRAK;
";" return SEMICOLON;
"," return COMMA;
"||" return OR;
"|" return PIPE;
\n counter++;
[ \t\v\f]* ;
. return yytext[0];

%%
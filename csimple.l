%%
boolean return BOOLEAN;
char return CHAR;
void return VOID;
int return INT;
string return STRING;
intp return INTP;
charp return CHARP;
if return IF;
"else" return ELSE;
while return WHILE;
do return DO;
for return FOR
"return" return RETURN;
"null" return NULL;
"&&"" return AND;
/ return DIV;
\= return SET;
\== return EQ;
\> return GT;
\>= return GE
\< return LT;
\<= return LE;
\- return MINUS;
\! return NOT;
\!= return NE;
\+ return PLUS;
\* return MULT;
\& return REF;
\^ return HEIGHT;
[a-zA-Z]+ return IDENTIFIERE;
[0-9]+ return NUM;
\( return LEFT_CIRC_BRAK;
\) return RIGHT_CIRC_BRAK;
\[ return LEFT_SQR_BRAK;
\] return RIGHT_SQR_BRAK;
\{ return LEFT_BLOCK_BRAK;
\} return RIGHT_BLOCK_BRAK;
\; return SEMICOLON;
\, return COMMA;
\| return PIPE;
"||" return OR;
[ \t\n\v\f]* ;
. return yytext[0];

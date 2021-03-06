%{
int counter = 1;
%}
%%
"boolean" return BOOLEAN;
"true" return _TRUE;
"false" return _FALSE;
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
"^" return DEREF;
[a-zA-Z][a-zA-Z0-9_]* return IDENTIFIERE;
(0x|0X)[0-9]*[A-E]* return HEX_NUM;
0[0-7]* return OCTAL_NUM;
[0-1]+b return BINARY_NUM; 
0|[1-9][0-9]* return NUM;
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
"/*"((\*+[^/*])|([^*]))*\**"*/" ; 
\"(\\.|[^"\\\n])*\" return STR;

"//"(\\.|[^"\\\n])* ;

\" return QUOTS;
\'(\\.|[^"\\\n])\' return SINGLE_CHAR;
\n counter++;
[ \t] ;
. return yytext[0];

%%
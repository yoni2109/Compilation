%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
typedef struct node
	{ char *token;
	  struct node *left;
	  struct node *right;
	} node;
node *mknode ( char *token , node *left, node *right);
void printtree ( node *tree);
#define YYSTYPE struct node *
%}
%start recived_program
%token BOOLEAN,CHAR,VOID,INT,STRING,INTP,CHARP /*declerations*/
%token IF,ELSE /*if\else*/
%token WHILE,DO,FOR /*loops*/
%token RETURN, _NULL /**/
%token AND,DIV,SET,EQ,GT,GE,LT,LE,MINUS,NOT,NE,PLUS,MULT,REF,HEIGHT,OR,PIPE/*operators*/
%token IDENTIFIERE,NUM /*values*/
%token SEMICOLON,COMMA
%token LEFT_CIRC_BRAK,RIGHT_CIRC_BRAK,LEFT_SQR_BRAK,RIGHT_SQR_BRAK,LEFT_BLOCK_BRAK,RIGHT_BLOCK_BRAK
%left AND,DIV,SET,EQ,GT,GE,LT,LE,MINUS,NOT,NE,PLUS,MULT,REF,HEIGHT,OR,PIPE
%%
recived_program: lines {printtree($1);}



lines:  line SEMICOLON nextline{ $$ = mknode(NULL,$1,$3);}

nextline: lines | /*espilon*/  

line:  	statement

statement: 	decleration_statement 
		| decleration_and_set
		| if_statement
//		| loop_statement
//		| function_statement

expr:		expr PLUS expr { $$ = mknode("+",$1,$2);}
		| expr MINUS expr{ $$=mknode("-",$1,$3);}
		| expr MULT expr{ $$=mknode("*",$1,$3);}
		| expr DIV expr{ $$=mknode("/",$1,$3);}		
		| value
		
cond: 	 expr EQ expr{ $$=mknode("==",$1,$3);}
		| expr NE expr{ $$=mknode("!=",$1,$3);}
		| expr GT expr{ $$=mknode(">",$1,$3);}
		| expr GE expr{ $$=mknode(">=",$1,$3);}
		| expr LT expr{ $$=mknode("<",$1,$3);}
		| expr LE expr{ $$=mknode("<=",$1,$3);}
		| expr HEIGHT expr{ $$=mknode("^",$1,$3);}
		| expr AND expr{ $$=mknode("&&",$1,$3);}
		| expr SET expr{ $$=mknode("=",$1,$3);}
		| expr OR expr{ $$=mknode("||",$1,$3);}
		|wraped_cond
		

if_statement: 	IF wraped_cond code_block { $$=mknode("if",$2,$3);} 

wraped_cond: 	LEFT_CIRC_BRAK cond RIGHT_CIRC_BRAK{ $$=mknode("()",$2,NULL);}|/*epsilon*/

code_block: 	LEFT_BLOCK_BRAK block RIGHT_BLOCK_BRAK else_statement { $$=mknode("{}",$2,$4);} | /*epsilon*/

block: 			lines

else_statement: ELSE code_block{ $$=mknode("else",$2,NULL);} | /*epsilon*/

set_statement : ident SET value { $$=mknode("=",$1,$3);}

value: 		NUM{ $$=mknode(yytext,NULL,NULL);} 
			| ident

decleration_statement: type ident { $$=mknode("decleration_statement",$1,$2);} 

decleration_and_set: type set_statement {$$ = mknode(NULL,$1,$2);}
			

type: 	BOOLEAN{ $$=mknode(yytext,NULL,NULL);}
		|CHAR{ $$=mknode(yytext,NULL,NULL);}
		|VOID{ $$=mknode(yytext,NULL,NULL);}
		|INT{ $$=mknode(yytext,NULL,NULL);}
		|STRING{ $$=mknode(yytext,NULL,NULL);}
		|INTP{ $$=mknode(yytext,NULL,NULL);}
		|CHARP{ $$=mknode(yytext,NULL,NULL);}

ident: 	IDENTIFIERE { $$=mknode(yytext,NULL,NULL);};


%%
#include "lex.yy.c"
int main(){ 
		return yyparse();
	}
node * mknode(char *token, node *left, node *right){
node * newnode = (node*) malloc (sizeof(node));
if(token!=NULL)
{
char* newstr = (char*) malloc (sizeof(token)+1);
strcpy (newstr,token);
newnode->token=newstr;
}
else{
newnode->token = NULL;
}
newnode->left = left;
newnode->right = right;
return newnode;
}
void printtree(node *tree){
static int count = 0;
count++;
if(tree->token) printf("%s\n",tree->token);
for(int i = 0;i<count;i++){
printf(" ");
}
if(tree->left){ printtree(tree->left);}
count--;
if(tree->right){ printtree(tree->right);}
count--;
}
int yyerror(){ 
		printf("error happend\n");
		return 0;
	}



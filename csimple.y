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
%token STR,QUOTS
%token LEFT_CIRC_BRAK,RIGHT_CIRC_BRAK,LEFT_SQR_BRAK,RIGHT_SQR_BRAK,LEFT_BLOCK_BRAK,RIGHT_BLOCK_BRAK
%left AND,DIV,SET,EQ,GT,GE,LT,LE,MINUS,NOT,NE,PLUS,MULT,REF,HEIGHT,OR,PIPE
%%

recived_program: /*recived program is the first reduce terminal*/
			full_program {printtree($1);}  

full_program:
			functions lines { $$ = mknode(NULL,$1,$2);} 
			| lines 

functions:
			function_decleration code_block{ $$ = mknode(NULL,$1,$2);} //TODO: change code block
			
lines:  
			program 
			
program:
			line  program{ $$ = mknode(NULL,$1,$2);}
			|/*epsilon*/

line:  	
			statement  
			| expr SEMICOLON

statement: 	
			decleration_statement SEMICOLON  /*statements as if \ if else \ loops \ functions*/	
			| if_statement 
			| loop_statement 


function_decleration:
			decleration_statement wraped_arguments{ $$ = mknode("function decleration",$1,$2);}

wraped_arguments:
			LEFT_CIRC_BRAK decleration_statement RIGHT_CIRC_BRAK{ $$=mknode("()",$2,NULL);}

expr:		  
			  expr PLUS expr { $$ = mknode("+",$1,$3);}
			| expr MINUS expr { $$=mknode("-",$1,$3);}
			| expr MULT expr { $$=mknode("*",$1,$3);}
			| expr DIV expr { $$=mknode("/",$1,$3);}	
			| ident SET expr { $$=mknode("=",$1,$3);}
			| value
			| REF ident  { $$=mknode("&",$2,NULL);} 
			| str
			

		
cond: 		 
			  cond EQ cond{ $$=mknode("==",$1,$3);}
			| cond NE cond{ $$=mknode("!=",$1,$3);}
			| cond GT cond{ $$=mknode(">",$1,$3);}
			| cond GE cond{ $$=mknode(">=",$1,$3);}
			| cond LT cond{ $$=mknode("<",$1,$3);}
			| cond LE cond{ $$=mknode("<=",$1,$3);}
			| cond AND cond{ $$=mknode("&&",$1,$3);}
			| cond OR cond{ $$=mknode("||",$1,$3);}
			| wraped_cond
			| value
		
if_statement: 	
			IF wraped_cond code_block_if { $$=mknode("if",$2,$3);} 
code_block: 	
			LEFT_BLOCK_BRAK block RIGHT_BLOCK_BRAK /*else_statement*/ { $$=mknode("{}",$2,NULL);} 
			| /*epsilon*/

code_block_if: 	
			expr SEMICOLON else_statement { $$=mknode(NULL,$1,$3);}
			|LEFT_BLOCK_BRAK block RIGHT_BLOCK_BRAK else_statement { $$=mknode("{}",$2,$4);} 

block: 			
			lines

else_statement: 
			ELSE code_block_if{ $$=mknode("else",$2,NULL);}
			|ELSE if_statement{ $$= mknode("else",$2,NULL);} 
			| /*epsilon*/


loop_statement: 
				while_statement
				|do_while_statement
				|for_statement

do_while_statement: 
			DO code_block while_statement { $$ = mknode("do",$2,$3);}

while_statement: 
			WHILE wraped_cond code_block{ $$ = mknode("while",$2,$3);}
			
for_statement: 
			FOR wraped_for code_block { $$ = mknode("for",$2,$3);}

wraped_for: 
			LEFT_CIRC_BRAK for_cond RIGHT_CIRC_BRAK { $$ = mknode("()",$2,NULL);}

for_cond: 
			first_expr sec_expr {$$ = mknode (NULL,$1,$2);}

first_expr : 
			expr SEMICOLON { $$=mknode (";",$1,NULL);}

sec_expr : 
			cond SEMICOLON expr { $$ = mknode (";",$1,$3);}

wraped_cond: 	
			LEFT_CIRC_BRAK cond RIGHT_CIRC_BRAK{ $$=mknode("()",$2,NULL);}
			|/*epsilon*/


value: 		
			NUM{ $$=mknode(yytext,NULL,NULL);} 
			| ident
			

decleration_statement: 
			type vars { $$=mknode("decleration_statement",$1,$2);} 

vars:
			ident vars{ $$ = mknode(NULL,$1,$2);}
			|COMMA vars { $$ = mknode(",",$2,NULL);}
			|ident_string vars { $$ = mknode(NULL,$1,$2);}
			|/*epsilon*/

ident_string:
			ident string { $$ = mknode(NULL,$1,$2);}

string:
			LEFT_SQR_BRAK value RIGHT_SQR_BRAK { $$ = mknode("[]",$2,NULL);}					

type: 		
			BOOLEAN{ $$=mknode(yytext,NULL,NULL);}
			|CHAR{ $$=mknode(yytext,NULL,NULL);}
			|VOID{ $$=mknode(yytext,NULL,NULL);}
			|INT{ $$=mknode(yytext,NULL,NULL);}
			|STRING{ $$=mknode(yytext,NULL,NULL);}
			|INTP{ $$=mknode(yytext,NULL,NULL);}
			|CHARP{ $$=mknode(yytext,NULL,NULL);}

ident: 	
			IDENTIFIERE { $$=mknode(yytext,NULL,NULL);};

str:	
			STR   { $$=mknode(yytext,NULL,NULL);};


			


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
	if(tree->token) printf("%s\n",tree->token);
	for(int i = 0;i<count;i++){
	printf("-");
	}
	count++;
	if(tree->left){ printtree(tree->left);}
	if(tree->right){ printtree(tree->right);}
	count--;
}
int yyerror(){ 
		printf("error happend in line [%d] in token [%s]\n",counter,yytext);
		return 0;
	}



%{
	#include <stdio.h>
	#include <string.h>
	#include <stdlib.h>
	typedef struct node
		{ char *token;
		  struct node *left;
		  struct node *right;
		  int row;
		} node;
	node *mknode ( char *token , node *left, node *right,int row);
	void printtree ( node *tree);
	#define YYSTYPE struct node *
%}
%start recived_program
%token BOOLEAN,CHAR,VOID,INT,STRING,INTP,CHARP /*declerations*/
%token IF,ELSE /*if\else*/
%token WHILE,DO,FOR /*loops*/
%token RETURN, _NULL /**/
%token AND,DIV,SET,EQ,GT,GE,LT,LE,MINUS,NOT,NE,PLUS,MULT,OR,PIPE/*operators*/
%token IDENTIFIERE,NUM /*values*/
%token SEMICOLON,COMMA,REF,DEREF
%token STR,QUOTS,SINGLE_CHAR
%token _TRUE , _FALSE
%token OCTAL_NUM, HEX_NUM , BINARY_NUM
%token LEFT_CIRC_BRAK,RIGHT_CIRC_BRAK,LEFT_SQR_BRAK,RIGHT_SQR_BRAK,LEFT_BLOCK_BRAK,RIGHT_BLOCK_BRAK
%left AND,DIV,SET,EQ,GT,GE,LT,LE,MINUS,NOT,NE,PLUS,MULT,REF,DEREF,OR,PIPE
%%

recived_program: /*recived program is the first reduce terminal*/
			full_program {semantica($1);}  

full_program:
			declerations full_program { $$ = mknode(NULL,$1,$2,counter);} 
			| program 

declerations:
			function_decleration function_code_block{ $$ = mknode("function",$1,$2,counter);} 
			| decleration_statement SEMICOLON
			
//lines:  
//			program 
			
program:
			line  program{ $$ = mknode(NULL,$1,$2,counter);}
			|/*epsilon*/

line:  	
			statement  
			| expr SEMICOLON

statement: 	
			//decleration_statement SEMICOLON  /*statements as if \ if else \ loops \ functions*/	
			if_statement 
			| loop_statement 

function_decleration:
			type_ident_for_function wraped_arguments{ $$ = mknode("function decleration",$1,$2,counter);}

type_ident_for_function:
			type ident { $$=mknode(NULL,$1,$2,counter);}/*used as funcction decleration and function args on decleration*/
			
wraped_arguments:
			LEFT_CIRC_BRAK func_args RIGHT_CIRC_BRAK{ $$=mknode("()",$2,NULL,counter);}

func_args:
			type_ident_for_function func_args { $$=mknode(NULL,$1,$2,counter);}
			| COMMA func_args { $$=$2;}
			|/*epsilon*/
expr:		  
			  expr PLUS expr { $$ = mknode("+",$1,$3,counter);}
			| expr MINUS expr { $$=mknode("-",$1,$3,counter);}
			| expr MULT expr { $$=mknode("*",$1,$3,counter);}
			| expr DIV expr { $$=mknode("/",$1,$3,counter);}
			| PIPE expr PIPE { $$=mknode("||",$2,NULL,counter);}	
			| ident SET expr { $$=mknode("=",$1,$3,counter);}
			| value
			| DEREF ident{ $$=mknode("^",$2,NULL,counter);}
			| REF ident  { $$=mknode("&",$2,NULL,counter);} 
			| str
			| single_char
			| function_call

function_call:
			ident LEFT_CIRC_BRAK expr_list RIGHT_CIRC_BRAK { $$=mknode(NULL,$1,$3,counter);}
expr_list:
			expr expr_list { $$= mknode(NULL,$1,$2,counter);}
			| COMMA expr_list { $$=$2;}
			|/*epsilon*/
					
cond: 		 
			  cond EQ cond{ $$=mknode("==",$1,$3,counter);}
			| cond NE cond{ $$=mknode("!=",$1,$3,counter);}
			| cond GT cond{ $$=mknode(">",$1,$3,counter);}
			| cond GE cond{ $$=mknode(">=",$1,$3,counter);}
			| cond LT cond{ $$=mknode("<",$1,$3,counter);}
			| cond LE cond{ $$=mknode("<=",$1,$3,counter);}
			| cond AND cond{ $$=mknode("&&",$1,$3,counter);}
			| cond OR cond{ $$=mknode("||",$1,$3,counter);}
			| wraped_cond
			| expr
		
if_statement: 	
			IF wraped_cond code_block_if { $$=mknode("if",$2,$3,counter);} 
code_block: 	
			LEFT_BLOCK_BRAK block RIGHT_BLOCK_BRAK { $$=mknode("{}",$2,NULL,counter);} 
			| /*epsilon*/
loop_code_block: 	
			LEFT_BLOCK_BRAK block RIGHT_BLOCK_BRAK { $$=mknode("{}",$2,NULL,counter);} 
			|	expr SEMICOLON { $$ = $1;}
function_code_block:
			LEFT_BLOCK_BRAK block return_statement RIGHT_BLOCK_BRAK { $$=mknode("{}",$2,$3,counter);} 
			| /*epsilon*/

return_statement:
			RETURN expr SEMICOLON { $$ = mknode("return",$2,NULL,counter);}
			|RETURN SEMICOLON

code_block_if: 	
			expr SEMICOLON else_statement { $$=mknode("BLOCK",$1,$3,counter);}
			|LEFT_BLOCK_BRAK block RIGHT_BLOCK_BRAK else_statement { $$=mknode("{}",$2,$4,counter);} 

block: 			
			full_program

else_statement: 
			ELSE code_block_if{ $$=mknode("else",$2,NULL,counter);}
			|ELSE if_statement{ $$= mknode("else",$2,NULL,counter);} 
			| /*epsilon*/

loop_statement: 
				while_statement
				|do_while_statement
				|for_statement

do_while_statement: 
			DO code_block while_statement_do_while { $$ = mknode("do",$2,$3,counter);}
while_statement_do_while:
			WHILE wraped_cond{ $$ = mknode("while",$2,NULL,counter);}
while_statement: 
			WHILE wraped_cond loop_code_block{ $$ = mknode("while",$2,$3,counter);}
			
for_statement: 
			FOR wraped_for loop_code_block { $$ = mknode("for",$2,$3,counter);}

wraped_for: 
			LEFT_CIRC_BRAK for_cond RIGHT_CIRC_BRAK { $$ = mknode("()",$2,NULL,counter);}

for_cond: 
			first_expr sec_expr {$$ = mknode (NULL,$1,$2,counter);}

first_expr : 
			expr SEMICOLON { $$=mknode (";",$1,NULL,counter);}

sec_expr : 
			cond SEMICOLON expr { $$ = mknode (";",$1,$3,counter);}

wraped_cond: 	
			LEFT_CIRC_BRAK cond RIGHT_CIRC_BRAK{ $$=mknode("()",$2,NULL,counter);}
			|/*epsilon*/

value: 		
			NUM{ $$=mknode(yytext,NULL,NULL,counter);} 
			|_TRUE { $$=mknode(yytext,NULL,NULL,counter);} 
			|_FALSE { $$=mknode(yytext,NULL,NULL,counter);} 
			| OCTAL_NUM { $$=mknode(yytext,NULL,NULL,counter);} 
			| BINARY_NUM { $$=mknode(yytext,NULL,NULL,counter);} 
			| HEX_NUM { $$=mknode(yytext,NULL,NULL,counter);} 
			| ident
			| _NULL { $$=mknode(yytext,NULL,NULL,counter);}
			
decleration_statement: 
			type vars { $$=mknode("decleration_statement",$1,$2,counter);} 

vars:
			ident vars{ $$ = mknode(NULL,$1,$2,counter);}
			|COMMA vars { $$ =mknode(NULL,NULL,$2,counter);}
			|ident_string vars { $$ = mknode(NULL,$1,$2,counter);}
			|/*epsilon*/

ident_string:
			ident string { $$ = mknode(NULL,$1,$2,counter);}

string:
			LEFT_SQR_BRAK value RIGHT_SQR_BRAK { $$ = mknode("[]",$2,NULL,counter);}					

type: 		
			BOOLEAN{ $$=mknode(yytext,NULL,NULL,counter);}
			|CHAR{ $$=mknode(yytext,NULL,NULL,counter);}
			|VOID{ $$=mknode(yytext,NULL,NULL,counter);}
			|INT{ $$=mknode(yytext,NULL,NULL,counter);}
			|STRING{ $$=mknode(yytext,NULL,NULL,counter);}
			|INTP{ $$=mknode(yytext,NULL,NULL,counter);}
			|CHARP{ $$=mknode(yytext,NULL,NULL,counter);}

ident: 	
			IDENTIFIERE { $$=mknode(yytext,NULL,NULL,counter);}

str:	
			STR   { $$=mknode(yytext,NULL,NULL,counter);}
single_char:
			SINGLE_CHAR { $$=mknode(yytext,NULL,NULL,counter);};

			


%%
#include "lex.yy.c"
static int flag_main=0;//flag for main
static int check_dec_flag = 0;
int main()
{ 
		return yyparse();
}
node * mknode(char *token, node *left, node *right,int row_)
{
	node * newnode = (node*) malloc (sizeof(node));
	if(token!=NULL)
	{
		char* newstr = (char*) malloc (sizeof(token)+1);
		strcpy (newstr,token);
		newnode->token=newstr;
		newnode->row=row_;
	}
	else
	{ 
		newnode->token = NULL;
	}
	
	newnode->left = left;
	newnode->right = right;
	return newnode;
}
void printtree(node *tree)
{
	static int count = 0;
	if(tree->token)
	{ 
		count++;
		for(int i = 0;i<count;i++)
		{
			printf("\t");
		}
		printf("%s\n",tree->token);
	}
	if(tree->left)	
	{
		printtree(tree->left);
	}
	if(tree->right)	
	{
		printtree(tree->right);
	}
	if(tree->token)	
		count--;	
}
int yyerror(){ 
		printf("error happend in line [%d] in token [%s]\n",counter,yytext);
		return 0;
	}
typedef struct linkedlist
{
	char *type;
	char *ident;
    struct linkedlist *left;
    struct linkedlist *right;
}linkedlist;

typedef struct scope
{
	struct node *scope_head;//scopes rellevant tree root
    struct scope **inner_scopes;// not used yet
	int inner_scopes_count;// counts the number of inner scopes
    struct scope *outter_scope;// will hold poiter to currents "global" scope
	struct linkedlist *scops_list;//type ident list
}scope;

scope* mk_scope(node* tree,scope *outterscope)
{
	scope *newscope = (scope*)malloc(sizeof(scope));
	newscope->outter_scope = outterscope;
	newscope->scope_head = tree;
	newscope->scops_list = (linkedlist*)malloc(sizeof(linkedlist));
	newscope->scops_list->ident=NULL;
	newscope->scops_list->type=NULL;
	newscope->inner_scopes_count=0;
	return newscope;
}

void cehck_func_dec(node *dec_stat,linkedlist *current)
{
	
	if( (current->ident&&strcmp(dec_stat->right->token,current->ident)==0)//we check also if there is main and the ident is main
	   ||((current->ident&&strcmp("main",dec_stat->right->token)==0) && (flag_main==1)))//we also can copy this if only for the main
	{
		printf("%s already defined\n",dec_stat->right->token);
		return;
	}
	
	else
	{
		if(current->right)
		{
			printf("move right to next list\n");
			return cehck_func_dec(dec_stat,current->right);
		}
		
		else
		{
			
			if(current->ident)
			{
				//printf("****\n");
				current->right = (linkedlist*)malloc(sizeof(linkedlist));
				current=current->right;
			}
			

			current->ident = strdup(dec_stat->right->token);
			current->type = strdup(dec_stat->left->token);

			if(current->ident&&strcmp(current->ident,"main")==0) flag_main=1;//if the ident is main we mark the flag
			//printf("check if main %s %d\n",current->ident,flag_main);

			printf("success declaration on [%s %s] \n",current->type,current->ident);
			//printf("flag main %d\n",flag_main);
			check_dec_flag = 1;
			return;
		}
	}
	
}

void check_ident_decleration(char* dec_ident,char* type,linkedlist* current)
{
		if(current->ident&&strcmp(dec_ident,current->ident)==0)
	{
		printf("%s already defined\n",current->ident);
		return;
	}
	else
	{
		if(current->right)
		{
			return check_ident_decleration(dec_ident,type,current->right);
		}
		else
		{
			if(current->ident)
			{
				current->right = (linkedlist*)malloc(sizeof(linkedlist));
				current=current->right;
			}	
			current->ident = strdup(dec_ident);
			current->type = strdup(type);
			printf("success declaration on [%s %s] \n",current->type,current->ident);
			check_dec_flag = 1;
			return;
		}
	}

}
void check_dec_idents(scope* current_scope)
{
	current_scope->scope_head = current_scope->scope_head->left;
	char* type = strdup(current_scope->scope_head->left->token);
	char* identifier;
	while(current_scope->scope_head->right)
	{
		current_scope->scope_head =current_scope->scope_head->right;
		identifier =NULL;
		identifier = strdup(current_scope->scope_head->left->token);
		check_ident_decleration(identifier,type,current_scope->scops_list);
		if(check_dec_flag==1)
		{
			check_dec_flag=0;	
		}
		if(current_scope->scope_head->right){
			current_scope->scope_head=current_scope->scope_head->right;
		}

	}
}
void samentise_(scope* current_scope) 
{
	node* savestate;
	scope *innerscope;
	if(current_scope->scope_head->token&&strcmp(current_scope->scope_head->token,"{}")==0)
	{
		//TODO:  func args
		//TODO:  return statement
		current_scope->scope_head = current_scope->scope_head->left; 
	}
	if( current_scope->scope_head 
		&& current_scope->scope_head->left 
		&& strcmp(current_scope->scope_head->left->token,"function")==0 ) // end if conditions
	{
		//cehck_func_dec(current_scope->scope_head->left->left->left,current_scope->scops_list);
		if(check_dec_flag == 1)
		{
			check_dec_flag=0;
			if(current_scope->inner_scopes_count==0){
				current_scope->inner_scopes = (scope**)malloc(sizeof(scope*)+1);
				current_scope->inner_scopes_count++;
			}
			else if(current_scope->inner_scopes_count){
				current_scope->inner_scopes = (scope**)realloc(current_scope->inner_scopes,current_scope->inner_scopes_count+1);
				current_scope->inner_scopes_count++;
			}
			current_scope->inner_scopes[current_scope->inner_scopes_count-1] = mk_scope(current_scope->scope_head->left->right,current_scope);
			
			samentise_(current_scope->inner_scopes[current_scope->inner_scopes_count-1]);
			//printf("cehck func dec \n");
		}
		if(current_scope->scope_head->right)
		{
			current_scope->scope_head = current_scope->scope_head->right;
			return samentise_(current_scope);
		}
	}
	if(current_scope->scope_head 
	&& current_scope->scope_head->left 
	&& strcmp(current_scope->scope_head->left->token,"decleration_statement")==0)
	{
		savestate = current_scope->scope_head;
		//left son is a type
		//right son is identifiers or a single identifier
		check_dec_idents(current_scope);
		current_scope->scope_head = savestate;
	}
	if(current_scope->scope_head&&current_scope->scope_head->right)
	{
		current_scope->scope_head = current_scope->scope_head->right;
		return samentise_(current_scope);
	}
}

void semantica(node *tree){//recivce a tree from lexical analizer
    node *head = tree;
	printtree(tree);
	scope *globalscope = mk_scope(tree,NULL); // firsr scope is the global scope 
	samentise_(globalscope); 

}


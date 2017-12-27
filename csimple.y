%{
	#include <stdio.h>
	#include <string.h>
	#include <stdlib.h>
	#include <stdbool.h>
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
			declerations full_program { $$ = mknode(NULL,$1,$2);} 
			| program 

declerations:
			function_decleration function_code_block{ $$ = mknode("function",$1,$2);} 
			| decleration_statement SEMICOLON
			
//lines:  
//			program 
			
program:
			line  program{ $$ = mknode(NULL,$1,$2);}
			|/*epsilon*/

line:  	
			statement  
			| expr SEMICOLON

statement: 	
			//decleration_statement SEMICOLON  /*statements as if \ if else \ loops \ functions*/	
			if_statement 
			| loop_statement 

function_decleration:
			type_ident_for_function wraped_arguments{ $$ = mknode("function decleration",$1,$2);}

type_ident_for_function:
			type ident { $$=mknode(NULL,$1,$2);}/*used as funcction decleration and function args on decleration*/
			
wraped_arguments:
			LEFT_CIRC_BRAK func_args RIGHT_CIRC_BRAK{ $$=mknode("()",$2,NULL);}

func_args:
			type_ident_for_function func_args { $$=mknode(NULL,$1,$2);}
			| COMMA func_args { $$=$2;}
			|/*epsilon*/
expr:		  
			  expr PLUS expr { $$ = mknode("+",$1,$3);}
			| expr MINUS expr { $$=mknode("-",$1,$3);}
			| expr MULT expr { $$=mknode("*",$1,$3);}
			| expr DIV expr { $$=mknode("/",$1,$3);}
			| PIPE expr PIPE { $$=mknode("||",$2,NULL);}	
			| ident SET expr { $$=mknode("=",$1,$3);}
			| value
			| DEREF ident{ $$=mknode("^",$2,NULL);}
			| REF ident  { $$=mknode("&",$2,NULL);} 
			| str
			| single_char
			| function_call

function_call:
			ident LEFT_CIRC_BRAK expr_list RIGHT_CIRC_BRAK { $$=mknode("function_call",$1,$3);}
expr_list:
			expr expr_list { $$= mknode(NULL,$1,$2);}
			| COMMA expr_list { $$=$2;}
			|/*epsilon*/
					
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
			| expr
		
if_statement: 	
			IF wraped_cond code_block_if { $$=mknode("if",$2,$3);} 
code_block: 	
			LEFT_BLOCK_BRAK block RIGHT_BLOCK_BRAK { $$=mknode("{}",$2,NULL);} 
			| /*epsilon*/
loop_code_block: 	
			LEFT_BLOCK_BRAK block RIGHT_BLOCK_BRAK { $$=mknode("{}",$2,NULL);} 
			|	expr SEMICOLON { $$ = $1;}
function_code_block:
			LEFT_BLOCK_BRAK block return_statement RIGHT_BLOCK_BRAK { $$=mknode("{}",$2,$3);} 
			| /*epsilon*/

return_statement :
			RETURN expr SEMICOLON { $$ = mknode("return",$2,NULL);}
			|RETURN SEMICOLON

code_block_if: 	
			expr SEMICOLON else_statement { $$=mknode("BLOCK",$1,$3);}
			|LEFT_BLOCK_BRAK block RIGHT_BLOCK_BRAK else_statement { $$=mknode("{}",$2,$4);} 

block: 			
			full_program

else_statement: 
			ELSE code_block_if{ $$=mknode("else",$2,NULL);}
			|ELSE if_statement{ $$= mknode("else",$2,NULL);} 
			| /*epsilon*/

loop_statement: 
				while_statement
				|do_while_statement
				|for_statement

do_while_statement: 
			DO code_block while_statement_do_while { $$ = mknode("do",$2,$3);}
while_statement_do_while:
			WHILE wraped_cond{ $$ = mknode("while",$2,NULL);}
while_statement: 
			WHILE wraped_cond loop_code_block{ $$ = mknode("while",$2,$3);}
			
for_statement: 
			FOR wraped_for loop_code_block { $$ = mknode("for",$2,$3);}

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
			|_TRUE { $$=mknode(yytext,NULL,NULL);} 
			|_FALSE { $$=mknode(yytext,NULL,NULL);} 
			| OCTAL_NUM { $$=mknode(yytext,NULL,NULL);} 
			| BINARY_NUM { $$=mknode(yytext,NULL,NULL);} 
			| HEX_NUM { $$=mknode(yytext,NULL,NULL);} 
			| ident
			| _NULL { $$=mknode(yytext,NULL,NULL);}
			
decleration_statement: 
			type vars { $$=mknode("decleration_statement",$1,$2);} 

vars:
			ident vars{ $$ = mknode(NULL,$1,$2);}
			|COMMA vars { $$ =mknode(NULL,NULL,$2);}
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
			IDENTIFIERE { $$=mknode(yytext,NULL,NULL);}

str:	
			STR   { $$=mknode(yytext,NULL,NULL);}
single_char:
			SINGLE_CHAR { $$=mknode(yytext,NULL,NULL);};

			


%%
#include "lex.yy.c"
int main()
{ 
		return yyparse();
}
static int flag_main=0;//flag for main
static int check_dec_flag = 0;
node * mknode(char *token, node *left, node *right)
{
	node * newnode = (node*) malloc (sizeof(node));
	if(token!=NULL)
	{
		char* newstr = (char*) malloc (sizeof(token)+1);
		strcpy (newstr,token);
		newnode->token=newstr;
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
	bool isfunc;
    struct linkedlist *right;
    struct linkedlist *args;
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
linkedlist * check_if_func_decleared(scope *CallingScope ,char *identifier)
{
	int found = 0;
	linkedlist *CallingScopeList = CallingScope->scops_list;
	while(CallingScopeList)
	{
		if(strcmp(CallingScopeList->ident,identifier)==0&& CallingScopeList->isfunc)
		{
			printf("found it\n");
			found++;
			return CallingScopeList;
		}
		CallingScopeList = CallingScopeList->right;

	}
	if(CallingScope->outter_scope) return check_if_func_decleared(CallingScope->outter_scope ,identifier);
	if(found==0)printf("not found\n");
	return NULL;

}
void cehck_func_dec(node *dec_stat,linkedlist *current)
{
	
	if( (current->ident&&strcmp(dec_stat->left->right->token,current->ident)==0)//we check also if there is main and the ident is main
	   ||((current->ident&&strcmp("main",dec_stat->left->right->token)==0) && (flag_main==1)))//we also can copy this if only for the main
	{
		printf("%s already defined\n",dec_stat->left->right->token);
		return;
	}
	
	else
	{
		if(current->right)
		{
			//printf("move right to next list\n");
			return cehck_func_dec(dec_stat,current->right);
		}
		
		else
		{
			
			if(current->ident)
			{
				current->right = (linkedlist*)malloc(sizeof(linkedlist));
				current=current->right;
			}
			current->ident = strdup(dec_stat->left->right->token);
			current->type = strdup(dec_stat->left->left->token);
			current->isfunc = true;
			if(current->ident&&strcmp(current->ident,"main")==0) flag_main=1;//if the ident is main we mark the flag
			printf("success declaration on [%s %s] \n",current->type,current->ident);
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
			current->isfunc = false;
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
void add_arguments(scope *globalscope,node* args_head)
{
	int mainargs = 0;
	linkedlist *globals_list = globalscope->scops_list;
	linkedlist *function_args_list = globalscope->inner_scopes[globalscope->inner_scopes_count-1]->scops_list;
	while(globals_list->right){
		globals_list = globals_list->right;
	}
	if(strcmp(globals_list->ident,"main")==0){mainargs = 1;}
	globals_list->args = (linkedlist*)malloc(sizeof(linkedlist));
	globals_list = globals_list->args;
	if(args_head->left) args_head = args_head->left;
	while(args_head)
	{
		if(args_head->left)
		{
			if(mainargs){
				printf("main cannot recive arguments!\n");
			}
			if(args_head->left->left->token) globals_list->type = strdup(args_head->left->left->token);
			//printf("%s past it\n",args_head->left->right->token);
			globals_list->ident = NULL;
			function_args_list->type = strdup(args_head->left->left->token);
			function_args_list->ident = strdup(args_head->left->right->token);
			globals_list->right = (linkedlist*)malloc(sizeof(linkedlist));
			globals_list = globals_list->right;
			function_args_list->right = (linkedlist*)malloc(sizeof(linkedlist));
			function_args_list = function_args_list->right;
		}
		args_head = args_head->right;
	}
	

	
}
void samentise_(scope* current_scope) 
{
	node* savestate;
	scope *innerscope;
	if(current_scope->scope_head->token&&strcmp(current_scope->scope_head->token,"{}")==0)
	{
		
		//TODO:  return statement
		current_scope->scope_head = current_scope->scope_head->left; 
	}
	if( current_scope->scope_head 
		&& current_scope->scope_head->left 
		&& current_scope->scope_head->left->token
		&& strcmp(current_scope->scope_head->left->token,"function")==0 ) // end if conditions
	{
	
		cehck_func_dec(current_scope->scope_head->left->left,current_scope->scops_list);
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
			
			current_scope->inner_scopes[current_scope->inner_scopes_count-1] = mk_scope(current_scope->scope_head->left/*->right*/,current_scope);
			add_arguments(current_scope,current_scope->scope_head->left->left->right);
			//the above sends the current scope 
			//(so the args culd be added to functions list and to inner scops list) and the head of args tree 
			samentise_(current_scope->inner_scopes[current_scope->inner_scopes_count-1]);
			
		}
		if(current_scope->scope_head->right)
		{
			current_scope->scope_head = current_scope->scope_head->right;
			return samentise_(current_scope);
		}
	}
	if(	current_scope->scope_head 
		&& current_scope->scope_head->left 
		&& current_scope->scope_head->left->token
		&& strcmp(current_scope->scope_head->left->token,"decleration_statement")==0)
	{
		savestate = current_scope->scope_head;
		check_dec_idents(current_scope);
		current_scope->scope_head = savestate;
	}
	if(current_scope->scope_head
	&&current_scope->scope_head->left
	&&current_scope->scope_head->left->token
	&&strcmp(current_scope->scope_head->left->token,"function_call")==0)
	{
		printf("%s\n",current_scope->scope_head->left->left->token);
		linkedlist *declearation_linkedlist = check_if_decleared(current_scope,current_scope->scope_head->left->left->token);
		if(declearation_linkedlist){
			printf("recived decleration \n");
		}
	}
	if(current_scope->scope_head&&current_scope->scope_head->right)
	{
		current_scope->scope_head = current_scope->scope_head->right;
		return samentise_(current_scope);
	}

}

void semantica(node *tree)
{//recivce a tree from lexical analizer
    node *head = tree;
	printtree(tree);
	scope *globalscope = mk_scope(tree,NULL); // firsr scope is the global scope 
	samentise_(globalscope); 

}


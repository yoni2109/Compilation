/* original parser id follows */
/* yysccsid[] = "@(#)yaccpar	1.9 (Berkeley) 02/21/93" */
/* (use YYMAJOR/YYMINOR for ifdefs dependent on parser version) */

#define YYBYACC 1
#define YYMAJOR 1
#define YYMINOR 9
#define YYPATCH 20140715

#define YYEMPTY        (-1)
#define yyclearin      (yychar = YYEMPTY)
#define yyerrok        (yyerrflag = 0)
#define YYRECOVERING() (yyerrflag != 0)
#define YYENOMEM       (-2)
#define YYEOF          0
#define YYPREFIX "yy"

#define YYPURE 0

#line 2 "csimple.yacc"
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
#line 33 "y.tab.c"

#if ! defined(YYSTYPE) && ! defined(YYSTYPE_IS_DECLARED)
/* Default: YYSTYPE is the semantic value type. */
typedef int YYSTYPE;
# define YYSTYPE_IS_DECLARED 1
#endif

/* compatibility with bison */
#ifdef YYPARSE_PARAM
/* compatibility with FreeBSD */
# ifdef YYPARSE_PARAM_TYPE
#  define YYPARSE_DECL() yyparse(YYPARSE_PARAM_TYPE YYPARSE_PARAM)
# else
#  define YYPARSE_DECL() yyparse(void *YYPARSE_PARAM)
# endif
#else
# define YYPARSE_DECL() yyparse(void)
#endif

/* Parameters sent to lex. */
#ifdef YYLEX_PARAM
# define YYLEX_DECL() yylex(void *YYLEX_PARAM)
# define YYLEX yylex(YYLEX_PARAM)
#else
# define YYLEX_DECL() yylex(void)
# define YYLEX yylex()
#endif

/* Parameters sent to yyerror. */
#ifndef YYERROR_DECL
#define YYERROR_DECL() yyerror(const char *s)
#endif
#ifndef YYERROR_CALL
#define YYERROR_CALL(msg) yyerror(msg)
#endif

extern int YYPARSE_DECL();

#define BOOLEAN 257
#define CHAR 258
#define VOID 259
#define INT 260
#define STRING 261
#define INTP 262
#define CHARP 263
#define IF 264
#define ELSE 265
#define WHILE 266
#define DO 267
#define FOR 268
#define RETURN 269
#define NULL 270
#define AND 271
#define DIV 272
#define SET 273
#define EQ 274
#define GT 275
#define GE 276
#define LT 277
#define LE 278
#define MINUS 279
#define NOT 280
#define NE 281
#define PLUS 282
#define MULT 283
#define REF 284
#define HEIGHT 285
#define OR 286
#define PIPE 287
#define IDENTIFIERE 288
#define NUM 289
#define SEMICOLON 290
#define COMMA 291
#define LEFT_CIRC_BRAK 292
#define RIGHT_CIRC_BRAK 293
#define LEFT_SQR_BRAK 294
#define RIGHT_SQR_BRAK 295
#define LEFT_BLOCK_BRAK 296
#define RIGHT_BLOCK_BRAK 297
#define YYERRCODE 256
typedef short YYINT;
static const YYINT yylhs[] = {                           -1,
    0,    1,    3,    3,    2,    4,    4,    4,    8,    8,
    8,    8,    8,    8,    8,    8,    8,    8,    8,    8,
    8,    8,    8,    7,   10,   12,   11,   11,   13,   14,
   14,   15,    9,    9,    5,    6,   17,   17,   17,   17,
   17,   17,   17,   16,
};
static const YYINT yylen[] = {                            2,
    1,    3,    1,    0,    1,    1,    1,    1,    3,    3,
    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
    3,    3,    1,    3,    2,    2,    2,    0,    3,    2,
    0,    3,    1,    1,    2,    2,    1,    1,    1,    1,
    1,    1,    1,    1,
};
static const YYINT yydefred[] = {                         0,
   37,   38,   39,   40,   41,   42,   43,    0,    0,    1,
    0,    5,    6,    7,    8,    0,    0,    0,    0,   44,
   36,    0,   33,    0,   23,   25,   34,    0,   24,    3,
    2,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,   26,    0,   27,   32,
   20,   12,   21,   13,   15,   16,   17,   18,   10,   14,
    9,   11,   19,   22,    0,    0,   29,   30,
};
static const YYINT yydgoto[] = {                          9,
   10,   11,   31,   12,   13,   14,   15,   24,   25,   18,
   29,   26,   49,   67,   21,   27,   16,
};
static const YYINT yysindex[] = {                      -217,
    0,    0,    0,    0,    0,    0,    0, -292,    0,    0,
 -279,    0,    0,    0,    0, -273, -270, -276, -217,    0,
    0, -252,    0, -269,    0,    0,    0, -217,    0,    0,
    0, -270, -270, -270, -270, -270, -270, -270, -270, -270,
 -270, -270, -270, -270, -270, -270,    0, -275,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0, -242, -276,    0,    0,
};
static const YYINT yyrindex[] = {                         0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0, -241,    1,    0,
    0, -240,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0, -239, -241,    0,    0,
};
static const YYINT yygindex[] = {                         0,
   20,    0,    0,    0,    0,    0,    0,   -8,   21,    0,
  -14,    0,    0,    0,    0,   38,    0,
};
#define YYTABLESIZE 298
static const YYINT yytable[] = {                         17,
    4,   33,   34,   35,   36,   37,   38,   39,   40,   41,
   19,   42,   43,   44,   20,   45,   46,   20,   23,   28,
   32,   65,   66,   47,   51,   52,   53,   54,   55,   56,
   57,   58,   59,   60,   61,   62,   63,   64,   30,    1,
    2,    3,    4,    5,    6,    7,    8,   48,   28,   35,
   31,   68,   50,   22,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    4,
};
static const YYINT yycheck[] = {                        292,
    0,  271,  272,  273,  274,  275,  276,  277,  278,  279,
  290,  281,  282,  283,  288,  285,  286,  288,  289,  296,
  273,  297,  265,  293,   33,   34,   35,   36,   37,   38,
   39,   40,   41,   42,   43,   44,   45,   46,   19,  257,
  258,  259,  260,  261,  262,  263,  264,   28,  290,  290,
  290,   66,   32,   16,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,  297,
};
#define YYFINAL 9
#ifndef YYDEBUG
#define YYDEBUG 0
#endif
#define YYMAXTOKEN 297
#define YYUNDFTOKEN 317
#define YYTRANSLATE(a) ((a) > YYMAXTOKEN ? YYUNDFTOKEN : (a))
#if YYDEBUG
static const char *const yyname[] = {

"end-of-file",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"BOOLEAN","CHAR","VOID","INT",
"STRING","INTP","CHARP","IF","ELSE","WHILE","DO","FOR","RETURN","NULL","AND",
"DIV","SET","EQ","GT","GE","LT","LE","MINUS","NOT","NE","PLUS","MULT","REF",
"HEIGHT","OR","PIPE","IDENTIFIERE","NUM","SEMICOLON","COMMA","LEFT_CIRC_BRAK",
"RIGHT_CIRC_BRAK","LEFT_SQR_BRAK","RIGHT_SQR_BRAK","LEFT_BLOCK_BRAK",
"RIGHT_BLOCK_BRAK",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"illegal-symbol",
};
static const char *const yyrule[] = {
"$accept : recived_program",
"recived_program : lines",
"lines : line SEMICOLON nextline",
"nextline : lines",
"nextline :",
"line : statement",
"statement : decleration_statement",
"statement : decleration_and_set",
"statement : if_statement",
"expr : expr PLUS expr",
"expr : expr MINUS expr",
"expr : expr MULT expr",
"expr : expr DIV expr",
"expr : expr EQ expr",
"expr : expr NE expr",
"expr : expr GT expr",
"expr : expr GE expr",
"expr : expr LT expr",
"expr : expr LE expr",
"expr : expr HEIGHT expr",
"expr : expr AND expr",
"expr : expr SET expr",
"expr : expr OR expr",
"expr : value",
"if_statement : IF wraped_expr code_block",
"wraped_expr : LEFT_CIRC_BRAK exprinbrak",
"exprinbrak : expr RIGHT_CIRC_BRAK",
"code_block : LEFT_BLOCK_BRAK block",
"code_block :",
"block : lines RIGHT_BLOCK_BRAK else_statement",
"else_statement : ELSE code_block",
"else_statement :",
"set_statement : ident SET value",
"value : NUM",
"value : ident",
"decleration_statement : type ident",
"decleration_and_set : type set_statement",
"type : BOOLEAN",
"type : CHAR",
"type : VOID",
"type : INT",
"type : STRING",
"type : INTP",
"type : CHARP",
"ident : IDENTIFIERE",

};
#endif

int      yydebug;
int      yynerrs;

int      yyerrflag;
int      yychar;
YYSTYPE  yyval;
YYSTYPE  yylval;

/* define the initial stack-sizes */
#ifdef YYSTACKSIZE
#undef YYMAXDEPTH
#define YYMAXDEPTH  YYSTACKSIZE
#else
#ifdef YYMAXDEPTH
#define YYSTACKSIZE YYMAXDEPTH
#else
#define YYSTACKSIZE 10000
#define YYMAXDEPTH  10000
#endif
#endif

#define YYINITSTACKSIZE 200

typedef struct {
    unsigned stacksize;
    YYINT    *s_base;
    YYINT    *s_mark;
    YYINT    *s_last;
    YYSTYPE  *l_base;
    YYSTYPE  *l_mark;
} YYSTACKDATA;
/* variables for the parser stack */
static YYSTACKDATA yystack;
#line 97 "csimple.yacc"
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
if(tree->right){ printtree(tree->right);}
count--;
}
int yyerror(){ 
		printf("error happend\n");
		return 0;
	}


#line 372 "y.tab.c"

#if YYDEBUG
#include <stdio.h>		/* needed for printf */
#endif

#include <stdlib.h>	/* needed for malloc, etc */
#include <string.h>	/* needed for memset */

/* allocate initial stack or double stack size, up to YYMAXDEPTH */
static int yygrowstack(YYSTACKDATA *data)
{
    int i;
    unsigned newsize;
    YYINT *newss;
    YYSTYPE *newvs;

    if ((newsize = data->stacksize) == 0)
        newsize = YYINITSTACKSIZE;
    else if (newsize >= YYMAXDEPTH)
        return YYENOMEM;
    else if ((newsize *= 2) > YYMAXDEPTH)
        newsize = YYMAXDEPTH;

    i = (int) (data->s_mark - data->s_base);
    newss = (YYINT *)realloc(data->s_base, newsize * sizeof(*newss));
    if (newss == 0)
        return YYENOMEM;

    data->s_base = newss;
    data->s_mark = newss + i;

    newvs = (YYSTYPE *)realloc(data->l_base, newsize * sizeof(*newvs));
    if (newvs == 0)
        return YYENOMEM;

    data->l_base = newvs;
    data->l_mark = newvs + i;

    data->stacksize = newsize;
    data->s_last = data->s_base + newsize - 1;
    return 0;
}

#if YYPURE || defined(YY_NO_LEAKS)
static void yyfreestack(YYSTACKDATA *data)
{
    free(data->s_base);
    free(data->l_base);
    memset(data, 0, sizeof(*data));
}
#else
#define yyfreestack(data) /* nothing */
#endif

#define YYABORT  goto yyabort
#define YYREJECT goto yyabort
#define YYACCEPT goto yyaccept
#define YYERROR  goto yyerrlab

int
YYPARSE_DECL()
{
    int yym, yyn, yystate;
#if YYDEBUG
    const char *yys;

    if ((yys = getenv("YYDEBUG")) != 0)
    {
        yyn = *yys;
        if (yyn >= '0' && yyn <= '9')
            yydebug = yyn - '0';
    }
#endif

    yynerrs = 0;
    yyerrflag = 0;
    yychar = YYEMPTY;
    yystate = 0;

#if YYPURE
    memset(&yystack, 0, sizeof(yystack));
#endif

    if (yystack.s_base == NULL && yygrowstack(&yystack) == YYENOMEM) goto yyoverflow;
    yystack.s_mark = yystack.s_base;
    yystack.l_mark = yystack.l_base;
    yystate = 0;
    *yystack.s_mark = 0;

yyloop:
    if ((yyn = yydefred[yystate]) != 0) goto yyreduce;
    if (yychar < 0)
    {
        if ((yychar = YYLEX) < 0) yychar = YYEOF;
#if YYDEBUG
        if (yydebug)
        {
            yys = yyname[YYTRANSLATE(yychar)];
            printf("%sdebug: state %d, reading %d (%s)\n",
                    YYPREFIX, yystate, yychar, yys);
        }
#endif
    }
    if ((yyn = yysindex[yystate]) && (yyn += yychar) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yychar)
    {
#if YYDEBUG
        if (yydebug)
            printf("%sdebug: state %d, shifting to state %d\n",
                    YYPREFIX, yystate, yytable[yyn]);
#endif
        if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack) == YYENOMEM)
        {
            goto yyoverflow;
        }
        yystate = yytable[yyn];
        *++yystack.s_mark = yytable[yyn];
        *++yystack.l_mark = yylval;
        yychar = YYEMPTY;
        if (yyerrflag > 0)  --yyerrflag;
        goto yyloop;
    }
    if ((yyn = yyrindex[yystate]) && (yyn += yychar) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yychar)
    {
        yyn = yytable[yyn];
        goto yyreduce;
    }
    if (yyerrflag) goto yyinrecovery;

    YYERROR_CALL("syntax error");

    goto yyerrlab;

yyerrlab:
    ++yynerrs;

yyinrecovery:
    if (yyerrflag < 3)
    {
        yyerrflag = 3;
        for (;;)
        {
            if ((yyn = yysindex[*yystack.s_mark]) && (yyn += YYERRCODE) >= 0 &&
                    yyn <= YYTABLESIZE && yycheck[yyn] == YYERRCODE)
            {
#if YYDEBUG
                if (yydebug)
                    printf("%sdebug: state %d, error recovery shifting\
 to state %d\n", YYPREFIX, *yystack.s_mark, yytable[yyn]);
#endif
                if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack) == YYENOMEM)
                {
                    goto yyoverflow;
                }
                yystate = yytable[yyn];
                *++yystack.s_mark = yytable[yyn];
                *++yystack.l_mark = yylval;
                goto yyloop;
            }
            else
            {
#if YYDEBUG
                if (yydebug)
                    printf("%sdebug: error recovery discarding state %d\n",
                            YYPREFIX, *yystack.s_mark);
#endif
                if (yystack.s_mark <= yystack.s_base) goto yyabort;
                --yystack.s_mark;
                --yystack.l_mark;
            }
        }
    }
    else
    {
        if (yychar == YYEOF) goto yyabort;
#if YYDEBUG
        if (yydebug)
        {
            yys = yyname[YYTRANSLATE(yychar)];
            printf("%sdebug: state %d, error recovery discards token %d (%s)\n",
                    YYPREFIX, yystate, yychar, yys);
        }
#endif
        yychar = YYEMPTY;
        goto yyloop;
    }

yyreduce:
#if YYDEBUG
    if (yydebug)
        printf("%sdebug: state %d, reducing by rule %d (%s)\n",
                YYPREFIX, yystate, yyn, yyrule[yyn]);
#endif
    yym = yylen[yyn];
    if (yym)
        yyval = yystack.l_mark[1-yym];
    else
        memset(&yyval, 0, sizeof yyval);
    switch (yyn)
    {
case 1:
#line 25 "csimple.yacc"
	{printtree(yystack.l_mark[0]);}
break;
case 2:
#line 29 "csimple.yacc"
	{ yyval = mknode(NULL,yystack.l_mark[-2],mknode(";",yystack.l_mark[0],NULL));}
break;
case 9:
#line 42 "csimple.yacc"
	{ yyval = mknode("+",yystack.l_mark[-2],yystack.l_mark[-1]);}
break;
case 10:
#line 43 "csimple.yacc"
	{ yyval=mknode("-",yystack.l_mark[-2],yystack.l_mark[0]);}
break;
case 11:
#line 44 "csimple.yacc"
	{ yyval=mknode("*",yystack.l_mark[-2],yystack.l_mark[0]);}
break;
case 12:
#line 45 "csimple.yacc"
	{ yyval=mknode("/",yystack.l_mark[-2],yystack.l_mark[0]);}
break;
case 13:
#line 46 "csimple.yacc"
	{ yyval=mknode("==",yystack.l_mark[-2],yystack.l_mark[0]);}
break;
case 14:
#line 47 "csimple.yacc"
	{ yyval=mknode("!=",yystack.l_mark[-2],yystack.l_mark[0]);}
break;
case 15:
#line 48 "csimple.yacc"
	{ yyval=mknode(">",yystack.l_mark[-2],yystack.l_mark[0]);}
break;
case 16:
#line 49 "csimple.yacc"
	{ yyval=mknode(">=",yystack.l_mark[-2],yystack.l_mark[0]);}
break;
case 17:
#line 50 "csimple.yacc"
	{ yyval=mknode("<",yystack.l_mark[-2],yystack.l_mark[0]);}
break;
case 18:
#line 51 "csimple.yacc"
	{ yyval=mknode("<=",yystack.l_mark[-2],yystack.l_mark[0]);}
break;
case 19:
#line 52 "csimple.yacc"
	{ yyval=mknode("^",yystack.l_mark[-2],yystack.l_mark[0]);}
break;
case 20:
#line 53 "csimple.yacc"
	{ yyval=mknode("&&",yystack.l_mark[-2],yystack.l_mark[0]);}
break;
case 21:
#line 54 "csimple.yacc"
	{ yyval=mknode("=",yystack.l_mark[-2],yystack.l_mark[0]);}
break;
case 22:
#line 55 "csimple.yacc"
	{ yyval=mknode("||",yystack.l_mark[-2],yystack.l_mark[0]);}
break;
case 24:
#line 59 "csimple.yacc"
	{ yyval=mknode("if",yystack.l_mark[-1],yystack.l_mark[0]);}
break;
case 25:
#line 61 "csimple.yacc"
	{ yyval=mknode("(",yystack.l_mark[0],NULL);}
break;
case 26:
#line 63 "csimple.yacc"
	{ yyval=mknode(")",yystack.l_mark[-1],NULL);}
break;
case 27:
#line 65 "csimple.yacc"
	{ yyval=mknode("{",yystack.l_mark[0],NULL);}
break;
case 29:
#line 67 "csimple.yacc"
	{ yyval=mknode("}",yystack.l_mark[-2],yystack.l_mark[0]);}
break;
case 30:
#line 69 "csimple.yacc"
	{ yyval=mknode("else",yystack.l_mark[0],NULL);}
break;
case 32:
#line 75 "csimple.yacc"
	{ yyval=mknode("=",yystack.l_mark[-2],yystack.l_mark[0]);}
break;
case 33:
#line 77 "csimple.yacc"
	{ yyval=mknode(yytext,NULL,NULL);}
break;
case 35:
#line 80 "csimple.yacc"
	{ yyval=mknode("decleration_statement",yystack.l_mark[-1],yystack.l_mark[0]);}
break;
case 36:
#line 82 "csimple.yacc"
	{yyval = mknode(NULL,yystack.l_mark[-1],yystack.l_mark[0]);}
break;
case 37:
#line 85 "csimple.yacc"
	{ yyval=mknode(yytext,NULL,NULL);}
break;
case 38:
#line 86 "csimple.yacc"
	{ yyval=mknode(yytext,NULL,NULL);}
break;
case 39:
#line 87 "csimple.yacc"
	{ yyval=mknode(yytext,NULL,NULL);}
break;
case 40:
#line 88 "csimple.yacc"
	{ yyval=mknode(yytext,NULL,NULL);}
break;
case 41:
#line 89 "csimple.yacc"
	{ yyval=mknode(yytext,NULL,NULL);}
break;
case 42:
#line 90 "csimple.yacc"
	{ yyval=mknode(yytext,NULL,NULL);}
break;
case 43:
#line 91 "csimple.yacc"
	{ yyval=mknode(yytext,NULL,NULL);}
break;
case 44:
#line 93 "csimple.yacc"
	{ yyval=mknode(yytext,NULL,NULL);}
break;
#line 710 "y.tab.c"
    }
    yystack.s_mark -= yym;
    yystate = *yystack.s_mark;
    yystack.l_mark -= yym;
    yym = yylhs[yyn];
    if (yystate == 0 && yym == 0)
    {
#if YYDEBUG
        if (yydebug)
            printf("%sdebug: after reduction, shifting from state 0 to\
 state %d\n", YYPREFIX, YYFINAL);
#endif
        yystate = YYFINAL;
        *++yystack.s_mark = YYFINAL;
        *++yystack.l_mark = yyval;
        if (yychar < 0)
        {
            if ((yychar = YYLEX) < 0) yychar = YYEOF;
#if YYDEBUG
            if (yydebug)
            {
                yys = yyname[YYTRANSLATE(yychar)];
                printf("%sdebug: state %d, reading %d (%s)\n",
                        YYPREFIX, YYFINAL, yychar, yys);
            }
#endif
        }
        if (yychar == YYEOF) goto yyaccept;
        goto yyloop;
    }
    if ((yyn = yygindex[yym]) && (yyn += yystate) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yystate)
        yystate = yytable[yyn];
    else
        yystate = yydgoto[yym];
#if YYDEBUG
    if (yydebug)
        printf("%sdebug: after reduction, shifting from state %d \
to state %d\n", YYPREFIX, *yystack.s_mark, yystate);
#endif
    if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack) == YYENOMEM)
    {
        goto yyoverflow;
    }
    *++yystack.s_mark = (YYINT) yystate;
    *++yystack.l_mark = yyval;
    goto yyloop;

yyoverflow:
    YYERROR_CALL("yacc stack overflow");

yyabort:
    yyfreestack(&yystack);
    return (1);

yyaccept:
    yyfreestack(&yystack);
    return (0);
}

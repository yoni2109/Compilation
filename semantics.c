#include <stdio.h>
#include <malloc.h>
#include <string.h>
#include <stdlib.h>
#include "csimple.y"

typedef struct linkedlist{

    struct linkedlist *left;
    struct linkedlist *right;

}linkedlist;

typedef struct scope{

    struct scope *inner_scope;
    struct scope *outter_scope;

}scope;

void semantica(node* tree){

}

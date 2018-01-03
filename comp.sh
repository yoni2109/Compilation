#!/bin/bash
lex csimple.l
yacc -t -v csimple.y 
cc -o run1.out y.tab.c -ll -Ly
clear
#!/bin/bash
lex csimple.l
yacc csimple.y
cc -o run1.out y.tab.c -ll -Ly

#!/bin/sh

# 
# name: compiling.sh
# date: 2020AUG08
#       2020JUL30 filename arg
#       2020JUL29
#       2020JUl16
# prog: pr
# desc: wrapper for elm compiler
#

{ 
    # build filename from second command arg
    if [ $1 ] ; then 
        FILENAME=$1
    else
        # no filename? assume Main
        FILENAME="Main"
    fi 


    # ---- EDIT THESE VALUES ----
    SOURCE=src/$FILENAME.elm
    DEST=main.js
    # ---- EDIT THESE VALUES ----


    echo "compiling... $SOURCE"
    elm make $SOURCE  --output $DEST

} >&2


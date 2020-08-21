#!/bin/sh

# 
# name: go.sh
# date: 2020AUG21
# prog: pr
# desc: wrapper for HTTP server
# args: 
#        $ ./go.sh 8080 
#        > option: port is 8080
#        > starting server http://127.0.0.1:8080
# 
#        $ ./go.sh
#        > starting server http://127.0.0.1:5000
#
{ 
    # supply a PORT?
    if [ $1 ] ; then 
        PORT=$1
        echo "option: port is $PORT"
    else
        # no port, assume 5000
        PORT=5000
    fi 


    # ---- EDIT THESE VALUES ----
    URL="127.0.0.1"
    # ---- EDIT THESE VALUES ----


    echo "starting server $URL:$PORT"
    python3 -m http.server --bind $URL $PORT

} >&2


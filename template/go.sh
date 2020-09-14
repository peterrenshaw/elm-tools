#!/bin/sh

# 
# name: go.sh
# date: 2020SEP14
#       2020AUG21
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
#        $ ./go.sh 5000 192.168.0.60
#        > option: port is 5000
#        > option: URL  is 192.168.0.60
#        > starting server http://192.168.0.60:5000
#        
{ 

    # supply a PORT?
    if [ $1 ] ; then 
        PORT=$1
        echo "option: port is $PORT"
    else
        # no port, assume 5000
        # ---- EDITABLE VALUE ----
        PORT=5000
        # ---- EDITABLE VALUE ----
    fi 

    # supply a URL?
    if [ $2 ] ; then
        URL="$2"
        echo "option: url is <http://$URL>"
    else
        # no URL, assume localhost
        # ---- EDITABLE VALUE ----
        URL="127.0.0.1"
        # ---- EDITABLE VALUE ----
    fi

    echo "starting server $URL:$PORT"
    python3 -m http.server --bind $URL $PORT 

} >&2


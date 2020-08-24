#!/bin/sh

#
# name: elm-start.sh
# date: 2020AUG24
#       2020AUG11
#       2020AUG10
#       2020AUG07
#       - create src/Main.elm
#       - list $1 
#       - cd $1 (TODO extract filename / directory & cd dir only)
#       2020JUL30
#       2020JUL28
# prog: pr
# desc: build scaffolding thru one command
# 
# read: * add git status
#


{
  ROOT=$HOME/work/code/elm/elm-hacks/elm-tools
  DOC_TEMPLATE=$ROOT/template

  clear

  echo "0/ create a directory at <$ROOT/$1>"
  mkdir $ROOT/$1

  echo "1/ build DOC skeleton"
  echo "   cp template"
  cp -R $DOC_TEMPLATE/* $ROOT/$1

  echo "2/ move to dir <$ROOT/$1>"
  cd $ROOT/$1

  echo "3/ setup git"
  git init .

  echo "4/ setup elm"
  elm init


  echo "5/ add to git... first checkin"
  git add README 
  git add TODO
  git add BUGS
  git add elm.json
  git add index.html
  git add src/*.elm
  git add favicon.png
  git commit -a -m "Initial Checkin for $1"
  git log
  git status
 
  echo "5/ start coding"
  ls -la *

} >&2 

# eof

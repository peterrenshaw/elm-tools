#!/bin/sh

#
# name: elm-start.sh
# date: 2020AUG07
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
  DOC_FILES="README TODO index.html"

  echo "0/ create a directory at $1"
  mkdir $1
  cd $1

  echo "1/ build DOC skeleton"
  touch $DOC_FILES

  echo "2/ setup git"
  git init .

  echo "3/ setup elm"
  elm init

  # make default elm file
  touch $1/src/Main.elm

  echo "4/ add to git... first checkin"
  git add README 
  git add TODO
  git add elm.json
  git add index.html
  git add src/*.elm
  git commit -a -m "Initial Checkin for $1"
  git log
  git status
 
  echo "5/ start coding"
  #cd $1
  ls $1 

} >&2 

# eof


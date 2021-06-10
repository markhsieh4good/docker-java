#!/bin/bash

_FILE=$1
_DIST=$2

if [ ! -e ${_FILE} ]; then
  echo "$_FILE not exist ... reject"
  pwd
  echo "========== "

elif [ -z ${_DIST} ]; then
  jar -xvf "$_FILE"
  
  pwd | awk '{printf "\n unzip file to %s\n",$1}'
elif [ -e "./config/tomcat/ROOT/$_DIST" ]; then
  jar -xvf "$_FILE" -C "./config/tomcat/ROOT/$_DIST"
  echo  "./config/tomcat/ROOT/$_DIST" | awk '{printf "\n unzip file to %s\n",$1}'
else
  mkdir tmp
  jar -xvf "$_FILE" -C ./tmp
  pwd | awk '{printf "\n unzip file to %s/tmp\n",$1}'
fi

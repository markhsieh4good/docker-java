#!/bin/bash

_INPUT=""
if [ "$1" == "up" ] && [ "$2" == "-d" ]; then
  sudo docker-compose -f docker-compose-tomcat.yml up -d
  
else
  _INPUT=$1
  sudo docker-compose -f docker-compose-tomcat.yml "${_INPUT}" 
fi


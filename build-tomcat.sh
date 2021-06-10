#!/bin/bash

_CHK=`sudo docker images | grep tomcat | awk '{printf "name:%s\nversion:%s\nid:%s\n============\n",$1,$2,$3}'`
_ID=`echo "$_CHK" | grep 'id' | sed 's/id://g'`
_ID_NUM=`echo "$_ID" | wc -l`

if [ ${_ID_NUM} -gt 1 ]; then
  echo "we only remove the version: [10.0.6-jdk11-buster-apr] as old one."
  sudo docker rmi tomcat:10.0.6-jdk11-buster-apr
elif [ ! -z "$_ID" ]; then
  echo "$_ID exist, we will remove the old one."
  sudo docker rmi ${_ID}
else
  echo "image not exist, we will create one."
fi

_PWD=`pwd`
cd docker-imgs/tomcat/
sudo docker build -t tomcat:10.0.6-jdk11-buster-apr .
sleep 1
echo ""
cd ${_PWD}
sudo docker images | grep tomcat | awk '{printf "name:%s\nversion:%s\nid:%s\n============\n",$1,$2,$3}'

#!/bin/bash

find . -type f -iname '*.sh' -print0 | xargs -0 fromdos

if [ -e ./setenv.sh ]; then
  cp ./setenv.sh /usr/local/tomcat/webapps.dist/bin/setenv.sh
  echo "cp setenv.sh to tomcat webapps bin/"
else
  echo "no setenv.sh need to exec."

fi

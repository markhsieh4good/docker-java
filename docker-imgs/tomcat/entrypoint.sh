#!/bin/sh

## Do whatever you need with env vars here ...
if [ -e /opt/manual ]; then
  find /opt/manual/ -type f -iname '*.sh' -print0 | xargs -0 fromdos
  sleep 1
  if [ -e /opt/manual/run.sh ]; then
    /bin/bash /opt/manual/run.sh 
  fi
fi

# Hand off to the CMD
exec "$@"

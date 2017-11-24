#!/bin/bash
if pgrep -x "nc" > /dev/null ; then :
else
  cd /etc/squirrel/assets/
  nc -l -p 8888 < nc-message.txt
fi

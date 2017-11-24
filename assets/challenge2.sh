#!/bin/bash

if [ -d /home/$(whoami)/challenge2 ];then
  echo "Unfortunately, you have already claimed this flag."
else
  echo "Challenge 2 has been unlocked!"
  sed -i "/$(whoami)/s/0/1/1" /etc/squirrel/scoring/scoreList
  echo "Copying files into your home directory..."
  cp -R /etc/squirrel/challenges/challenge2 /home/$(whoami)/
  chmod -R 755 /home/$(whoami)/challenge2
  echo "Done."
fi


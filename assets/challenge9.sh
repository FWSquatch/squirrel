#!/bin/bash

if [ -d /home/$(whoami)/challenge9 ];then
  echo "Unfortunately, you have already claimed this flag."
else
  echo "Challenge 9 has been unlocked!"
  sed -i "/$(whoami)/s/0/1/1" /etc/squirrel/scoring/scoreList
  echo "Copying files into your home directory..."
  cp -R /etc/squirrel/challenges/challenge9 /home/$(whoami)/
  chmod -R 755 /home/$(whoami)/challenge9
  echo "Done."
fi


#!/bin/bash

installDate=%%INSTALLDATE%% #Will be changed at install

if [ -d /home/$(whoami)/challenge1 ];then
  :
else
  pwLastChange=$(date -d $(passwd -S | awk '{print $3}') +%s)
  if [ $pwLastChange -ge $installDate  ];then
    key=$(echo -n $(whoami)0 | md5sum)
    key=${key::-3}
    echo -e "User password has been changed. You passed the first test!"
    echo "Here is your flag: " $key
    echo "You will need to submit your flag by typing:"
    echo "checkflag " $key
    echo "If you do it correctly, Challenge1 will appear in this directory."
  else
    echo -e "\n\nYour first challenge is to change your password."
  fi
fi

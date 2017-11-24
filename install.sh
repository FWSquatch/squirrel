#!/bin/bash

PASSWORD=eoctech
installDate=$(date --date="$(date +%D)" +%s)

#Set up /etc/squirrel
echo "Creating /etc/squirrel..."
mkdir /etc/squirrel
cp -R challenges /etc/squirrel
cp -R assets /etc/squirrel

#Get userlist and create users
echo "Setting up users..."
while read u; do
echo -e $PASSWORD"\n"$PASSWORD"\n" | adduser $u --force-badname
  chmod 750 -R /home/$u #Make home directory private
#  cp /etc/squirrel/assets/README /home/$u/
  chage $u -d 2000-01-01
done < usernames.txt

#Generate keys and create initial scoreList
echo "Generating keys..."
python scoring/keyGen.py > /dev/null
numChallenges=$(ls -l challenges | grep -c ^d) #Count challenges
if [ -e scoring/scoreList ];then rm scoring/scoreList;else :;fi #Delete scoreLi$
END=$numChallenges
for ((i=1;i<=END;i++));do
printf ",Ch "`expr $i - 1` >>scoring/scoreList
done
printf "\n" >>scoring/scoreList
while read u; do #Loop through usernames and create empty scores
printf $u >> scoring/scoreList
i=1
while [[ $i -le  $numChallenges  ]]; do
  printf ",0">> scoring/scoreList
  ((i++))
done
printf "\n">> scoring/scoreList
done < usernames.txt
#Set up the auto scoreboard
if [[ $(crontab -l -u root | grep updateScore.py) ]] ; then :; else
  (crontab -l -u root ; echo "* * * * * cd /etc/squirrel/scoring && /usr/bin/python /etc/squirrel/scoring/updateScore.py")| crontab -
fi

#Move scoring folder
cp -R scoring /etc/squirrel
chmod 777 /etc/squirrel/scoring

#Set up the checkflag command
echo "Setting up checkflag..."
chmod +x scoring/checkflag
cp scoring/checkflag /usr/local/bin/checkflag

#Set up the scoreboard in /var/www/html
cp assets/sqbg.png /var/www/html/sqbg.png

#Special assets
#Oaktree
if [ ! -d "/secretsquirrel/oaktree" ]; then
  echo "Copying special assets..."
  mkdir /secretsquirrel
  cp -R assets/oaktree /secretsquirrel/ 
fi
#Set up netcat listener via crontab
if [[ $(crontab -l -u root | grep ncFire.sh) ]] ; then :; else
  (crontab -l -u root ; echo "* * * * * bash /etc/squirrel/assets/ncFire.sh")| crontab -
fi


#Set up Challenge0
chmod +x /etc/squirrel/assets/challenge0.sh
sed -i -e "s/%%INSTALLDATE%%/$installDate/g" /etc/squirrel/assets/challenge0.sh
while read u; do
  if [[ $(grep challenge0.sh /home/$u/.bashrc) ]]; then :; else
     echo "/etc/squirrel/assets/challenge0.sh" >> /home/$u/.bashrc
  fi
done < usernames.txt


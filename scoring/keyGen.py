#!/usr/bin/env python

import hashlib
import os
import md5
import csv

numChallenges = os.popen("ls -l /etc/squirrel/challenges | grep -c ^d").read()
print numChallenges

with open ('scoring/flag.cfg','rb') as f:
  reader = csv.reader(f)
  flagseed = list(reader)

with open("usernames.txt") as f:
  user = f.readlines()
  user = [x.strip() for x in user]

#g = open("scoring/keys.csv","w")
#for i in user:
#
#      newHash= i+str(j)
#      m = md5.new(newHash)
#      g.write (","+m.hexdigest())
#  g.write ("\n")

print user

print flagseed

g = open("scoring/keys.csv","w")
for i in user:
  g.write(i)
  for j in range(int(numChallenges)):
    if flagseed[j][1] == 'static':
#      print str(flagseed[j][2])
      g.write(","+str(flagseed[j][2]))
    else:
#      print i+str(flagseed[j][1])
      h = hashlib.md5()
      h.update(i+str(flagseed[j][1]))
      g.write (","+h.hexdigest())
  g.write("\n")

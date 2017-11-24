#!/usr/bin/python

import sys
import os
import md5

def program(*args):
  myDate=int(os.popen('date +%s').read())
  theirDate = sys.argv[1]

  try:
    val = int(theirDate)
    if (myDate - val <=5):
      os.system('clear')
      print "\n\nKIRBY DANCE!\n\n"
      print "(>'-')> <('-'<) ^('-')^ v('-')v(>'-')> (^-^)"
      print "\n\nO YEAH! That's the stuff!\n\n"
      flag=os.popen('echo -n $(whoami)kirby | md5sum').read()
      print "Here is your flag: ", flag[:-3]

    else:
      os.system('clear')
      print "\n\n\n       (>'_')>\n\n GROSS! That date is not fresh enough!"
  except ValueError:
    os.system('clear')
    print "\n\n\n(>'_')> Yuck! Kirby only likes certain types of dates."
    print "\n\n Epoch is his favorite variety.\n\n"

if __name__ == "__main__":
    try:
        arg1 = sys.argv[1]
    except IndexError:
        os.system('clear')
        print "\n\n\n                 ^('O')^"
        print "\n\nKirby is sooooo hungry! Feed him some dates!\n\n"
        sys.exit(1)

    # start the program
    program(arg1)

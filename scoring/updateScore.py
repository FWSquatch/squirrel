#!/usr/bin/env python

list_of_lists = []
with open('scoreList') as f:
    for line in f:
        inner_list = [elt.strip() for elt in line.split(',')]
        list_of_lists.append(inner_list)

file = open("/var/www/html/index.html","w")

file.write('<!DOCTYPE html><html><body style="background-color:#fef222; background-image:url(sqbg.png);background-repeat:no-repeat;background-attachment:fixed;background-position:right;">')
file.write('<table style="width: 600px;"><tbody><tr><td><h1 style="text-align: center;">Secret Squirrel Society</h1><h3 style="text-align: center;">Secrets are our business...and business is GOOD!</h3></td></tr><tr><td><p>Welcome to our secret corner of the network! We have been expecting you. You have stumbled upon a series of challenges to test your command line, problem solving, and crypto skills.&nbsp; A few things you need to know before you get started:</p><ol><li>This place is a SECRET! Do&nbsp;<strong>NOT</strong> talk about this with the hoser sitting next to you. You will be going it alone.</li><li>Questions are not allowed. Just like in life, you are going to have to figure it out ON YOUR OWN.</li><li>This server is in beta so it is still kind of fragile. Please respect the game and complete the challenges instead of trying to find a way around them (that is something we will do later).</li><li>Good luck!</li></ol><p>Find your agent name and figure out what to do next. <strong>SSH</strong>hhhh! Good luck!</p></td></tr></tbody></table><table border=1 style="background-color:#ffffff;">')
#file.write('<H1>Secret Squirrel Society<H1><H3>"Stealing secrets is our business...and business is GOOD!"</H3><br>We have been expecting you.This place is a secret! Do <b>NOT</b> tell the hoser next to you about this. You are part of an exclusive group. You are a member of the Secret Squirrel Society. Find your agent name and figure out what to do next. Questions are not allowed. SSHhhhhhhhhh! <table border=1 style="background-color:#ffffff;">')
for i in range (0,len(list_of_lists)):
  file.write("<tr>")
  for j in range (0,len(list_of_lists[0])):
    try:
      int(list_of_lists[i][j])
      if int(list_of_lists[i][j]) != 0:
        file.write('<td style="background-color:#b1ffba;"><div align="center">')
      else:
        file.write('<td><div align="center">')
      file.write(list_of_lists[i][j]+"</div></td>")
    except:
      file.write('<td style="background-color:#cccccc;"><div align="center">'+list_of_lists[i][j]+'</div></td>')
  file.write("</tr>")
file.write("</table>")
file.write('</body></html>')

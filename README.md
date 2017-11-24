# Squirrel Server

Squirrel server is an exploration activity aimed at students interested in learning Linux, cryptography, and problem solving. It requires them to learn a little bit of scripting/programming and cryptography along the way. It has been designed to be modular and allow the admin to switch out challenges as they see fit. The challenges are pretty basic right now, but I hope to expand them and make them more complex as I go. This activity leans heavily on the BANDIT activity from overthewire.org but concentrates on other skills. Squirrel is in its infancy right now and is fragile and extremely insecure! Do not run this on a public facing server.

### Requirements:
* Debian-based server (tested on Ubuntu server)
* Web server 
* Python 2.7
* SSH access

### Installation:
1. Setup Linux server. Install required packages. I suggest apache2, python-minimal, openssh-server.
2. Clone into this repo (you might need to install git) `git clone https://github.com/FWSquatch/squirrel.git`
3. Fill usernames.txt with student usernames (one per line).
4. If you would like to use a different default password than "eoctech", then make appropriate change in the install.sh file.
5. From the squirrel directory, perform the install by typing `sudo ./install.sh`

### Running the game:
Once you've run the install script, everything should be automatic from there on out. Visiting the server in a browser will present a scoreboard and a quick rundown of the rules. Students will SSH into the server to complete the challenges. Bash scripts will set up the next challenge after the student claims a flag. Most of the challenges are written in python but a few use C++. I've compiled the python files to obsfucate the code a bit, but I've also included the source files in the assets directory. Some flags are static, but most of them are dynamically created by md5 hashing the username with a password located in the scoring/flag.cfg file. I plan on making that easier in later releases. 

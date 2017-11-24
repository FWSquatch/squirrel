#!/bin/bash

echo "You have completed your quest."
echo -e "\nI realize that this is a little bit anticlimactic. Such is life."
echo -e "\nHave a chicken dinner.\n"

echo "          ,,,;            ~-.~-.~-"
echo "         (.../           ~-.~-.~-.~-.~-."
echo "         } o~',         ~-.~-.~-.~-.~-.~-."
echo "         (//    \      ~-.~-.~-.~-.~-.~-.~-."
echo "          ;    \    ~-.~-.~-.~-.~-.~-.~-."
echo "         ;     {_.~-.~-.~-.~-.~-.~-.~"
echo "        ;:  .-~'    ~-.~-.~-.~-.~-."
echo "       ;.: :'    ._   ~-.~-.~-.~-.~-"
echo "        ;::'-.    '-._  ~-.~-.~-.~-"
echo "         ;::. '-.    '-,~-.~-.~-."
echo "          ';::::.'''-.-'"
echo "            ';::;;:,:'"
echo "               '||'"
echo "               // |"
echo "             ~' ~''"

echo "Sorry, but you're going to have to cook it yourself."
echo "Stay tuned for more stuff like this at a later date."
sed -i "/$(whoami)/s/0/1/1" /etc/squirrel/scoring/scoreList

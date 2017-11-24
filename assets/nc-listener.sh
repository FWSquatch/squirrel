#!/bin/bash

while true; do nc -l -p 8888 -q 1 < /etc/squirrel/assets/nc-message.txt; done


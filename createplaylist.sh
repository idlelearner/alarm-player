#!/bin/bash
if [ ${#@} = 0 ]
then
   echo "I need a YouTube play-list link. Exiting now..."
   exit 1
fi
PlayList_Link=$1
OUT="local"
VOL="1550"
PlayLinks(){
   lynx --source "$PlayList_Link" | grep -i "watch?v=" | uniq -u | grep -o "data-vid.*" | cut -d'"' -f2 > /home/pi/projs/alarm-player/temp
}
PlayLinks
echo 'created playlist!!'

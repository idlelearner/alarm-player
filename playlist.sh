#!/bin/bash
if [ ${#@} = 0 ]
then
   echo "I need a YouTube play-list link. Exiting now..."
   exit 1
fi
PlayList_Link=$1
OUT="both"
VOL="1550"
PlayLinks(){
   for lines in $(lynx --source "$PlayList_Link" | grep -i "watch?v=" | uniq -u | grep -o "data-vid.*" | cut -d\'"\' -f2; print "https://youtube.com/watch?v="$2}')
   do
      echo "Playing $lines"
      echo "omxplayer -o $OUT --vol -$VOL \"\$(youtube-dl -g $lines)\""
      omxplayer -o $OUT --vol -$VOL "$(youtube-dl -g $lines)"
      clear
   done
}
PlayLinks

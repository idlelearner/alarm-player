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
   lynx --source "$PlayList_Link" | grep -i "watch?v=" | uniq -u | grep -o "data-vid.*" | cut -d'"' -f2 > temp
#   for line in $(cat temp) 
#   do 
   #echo "$ line" done
   while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "Text read from file: $line"
    lines="https://www.youtube.com/watch?v=$line"
    echo "Playing $lines"
    echo "omxplayer -o $OUT --vol -$VOL \"\$(youtube-dl -g $lines)\""
    #v="$(youtube-dl -g $lines)"
    #echo "Downloaded $v"
    #omxplayer -o local $v
    omxplayer -o $OUT --vol $VOL "$(youtube-dl -g $lines)"
    #omxplayer -o both `youtube-dl -g $lines`
    #sleep 1
    exit
    #kill $(ps aux | grep 'omxplayer.bin' | awk '{print $2}')
    clear
    echo "Finished playing song!!!!!!!"
   done < temp
}
PlayLinks
echo 'finished playing!!'

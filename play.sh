#!/bin/bash
# This script will play through a playlist without downloading from youtube. 
# This requires the playlist number like PL4490218958302D68 from youtube.  
# Given a url like "http://www.youtube.com/watch?v=2ErvwPkV7G4&playnext=1&list=PL4490218958302D68&feature=results_main" pick it out. 
# If this file is saved as play_list.sh the command to run this would be sh play_list.sh PL4490218958302D68 ( there are other methods)
# This script requires omxplayer , wget , grep , uniq - standard for raspberry pi
# This script requires youtube-dl - refer to http://rg3.github.com/youtube-dl/ or the web for setup instructions
# This script doesn't handle the nice exit from  youtube-dl ( there is alot of extranious junk printed)
echo "PlayList is $1"
#Below is the method to get a full list from the api location
play_url="https://gdata.youtube.com/feeds/api/playlists/"$1"/?"
#Wget here makes a file called index.html by default. 
echo "$play_url"
`wget $play_url`
#The following reads index.html and picks out the important part then using uniq removes duplicates 
short_list=`grep -o -e 'https://[[:alnum:]/.&;=_-?]*app=youtube_gdata' index.html | uniq`
#Rm index.html  its not needed now. 
rm index.html
echo "$short_list\n"
for f in $short_list ;do
        #This takes one line at a time and processes it using youtube -g which only gets the correct url.    
        real_url=`youtube-dl -g $f`
        #This takes that correct url and outputs it to the HDMI port on the RasberryPI
        `omxplayer -o local $real_url`
done 

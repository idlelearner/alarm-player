sudo -su pi kill $(ps aux | grep 'playnew.py' | awk '{print $2}')
sudo -su pi kill $(ps aux | grep 'myplayer.sh' | awk '{print $2}')
sudo -su pi kill $(ps aux | grep 'omx' | awk '{print $2}')

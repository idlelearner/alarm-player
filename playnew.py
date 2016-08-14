import subprocess
import random
with open("/home/pi/projs/alarm-player/playlist.txt", "r") as ins:
    array = []
    for line in ins:
        #print line
        array.append(line)
while True:
    playlist = random.choice(array)
    print playlist
    p = subprocess.Popen('/home/pi/projs/alarm-player/createplaylist.sh %s' % playlist, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    for line in p.stdout.readlines():
        print(line)
    retval = p.wait()

    #If not present create it
    playerfile = '/home/pi/projs/alarm-player/myplayer.sh'
    f = open(playerfile,'w')
    with open("/home/pi/projs/alarm-player/temp", "r") as ins:
        for line in ins:
            print line
	    line=line.rstrip('\n')
            f.write('omxplayer -o local `youtube-dl -g \'https://www.youtube.com/watch?v=%s\'`\n' % line)
            f.write('clear\n')
    f.close()
    p = subprocess.Popen('/home/pi/projs/alarm-player/myplayer.sh', shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    for line in p.stdout.readlines():
        print(line)
    retval = p.wait()

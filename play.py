import subprocess
import random
with open("playlist.txt", "r") as ins:
    array = []
    for line in ins:
        #print line
        array.append(line)
playlist = random.choice(array)
print playlist
p = subprocess.Popen('./createplaylist.sh %s' % playlist, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
for line in p.stdout.readlines():
    print(line)
retval = p.wait()

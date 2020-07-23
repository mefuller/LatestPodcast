#! /bin/bash

#get the episode listing: using Der Spiegel Nachrichten Updates
#-N: overwrite existing file with (updated) version from server
#-q: quiet turns off writing of local log by wget
wget -N -q http://feeds.soundcloud.com/users/soundcloud:users:683997587/sounds.rss

#extract the most recent episode URL
export NewPod=$(./podcast_fetch.py)

#play it with VLC (since it plays everything)
cvlc --play-and-exit $NewPod


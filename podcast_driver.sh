#!/usr/bin/env bash

#system check as inspired by: https://gist.github.com/dprandzioch/5aae328bceac5e3b5c30
[ -x "$(command -v wget)" ] || (echo "wget is not installed" && exit 1)
[ -x "$(command -v cvlc)" ] || (echo "VLC is not installed" && exit 1)
[ -x "$(command -v python)" ] || (echo "python is not installed" && exit 1)

#location of RSS feed for podcast
export RSS=$"http://feeds.soundcloud.com/users/soundcloud:users:683997587/sounds.rss"

#get the episode listing: using Der Spiegel Nachrichten Updates
#-N: overwrite existing file with (updated) version from server
#-q: quiet turns off writing of local log by wget
#-O feed.rss: fix the output name so that the only change needed is to the URL
wget -N -q -O feed.rss $RSS

#extract the most recent episode URL
export NewPod=$(./podcast_fetch.py feed.rss)

#play it with VLC (since it plays everything)
cvlc --play-and-exit $NewPod


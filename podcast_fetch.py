#! /usr/bin/env python
import re
import sys

def get_latest_episode(rss_file):
    with open (rss_file, 'r') as feedfile:
        feedlines = feedfile.readlines()
        
    for line in feedlines:
        if line.strip().startswith('<enclosure'):
            try:
                epurl = re.search('url="(.+?)" ', line).group(1)
                break
            except AttributeError:
                #print("Unable to extract episode URL")
                epurl="" #placeholder to local file 
                continue #keep searching
                
    return epurl
    
    
if __name__ == "__main__":
    rss_file = sys.argv[1] 
    addr = get_latest_episode(rss_file) #test file
    print(addr)            

#!/bin/sh
xhost + >& /dev/null
xmodmap .xmodmaprc
echo HOST = /$HOST/
ical &
# secure shell
ssh-add >& /dev/null &
#
# netscape
#
netscape -install http://claspc2.cebaf.gov/ >& /dev/null &
#
rm -f /tmp/fvwm95-2.log
exec fvwm95-2 -f "Read .fvwm2rc95" 1> /tmp/fvwm95-2.log 2>&1
# 

#!/bin/sh
xhost + >& /dev/null
xmodmap .xmodmaprc
echo HOST = /$HOST/
if [ $HOST != localhost.localdomain ]
then
    ical &
fi
ssh-add >& /dev/null &
#
rm -f /tmp/fvwm95-2.log
exec fvwm95-2 -f "Read .fvwm2rc95" 1> /tmp/fvwm95-2.log 2>&1
# 

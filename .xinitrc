#!/bin/sh
# $Id: .xinitrc,v 1.10 2000/09/07 17:56:04 marki Exp $
xhost + >& /dev/null
# secure shell
ssh-add >& /dev/null &
# window manager
rm -f /tmp/fvwm95-2.log
exec fvwm95-2 -f "Read .fvwm2rc95" 1> /tmp/fvwm95-2.log 2>&1
# 

#!/bin/sh
# $Id: .xinitrc,v 1.11 2002/11/27 12:30:31 marki Exp $
xhost + >& /dev/null
# secure shell
ssh-add >& /dev/null &
# window manager
exec ssh-agent /usr/X11R6/bin/RunWM.WindowMaker
# 

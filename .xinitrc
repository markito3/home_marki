#!/bin/sh
# $Id: .xinitrc,v 1.12 2003/12/04 02:13:31 marki Exp $
xhost + >& /dev/null
# secure shell
ssh-add >& /dev/null &
# window manager
/usr/local/bin/wmaker
# 

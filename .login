#
# $Id: .login,v 1.103 2014/01/10 13:44:16 marki Exp $
#
echo starting .login
#
# set up the terminal
#
set prompt="%m:%n:%C> "  # prompt set to machine:current directory
#
# Set up shell environment:
#
set autolist
set history=1000
set savehist=(1000 merge)
set histdup=erase
#
# aliases
#
source ~/.alias
#
# info
#
date
uname -a
uptime
who
#
# finished
#
echo ".login done"

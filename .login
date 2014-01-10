#
# $Id: .login,v 1.102 2014/01/10 01:47:45 marki Exp $
#
echo starting .login
#
# set up the terminal
#
set prompt="%m:%n:%C> "  # prompt set to machine:current directory

# Set up shell environment:
set autolist
#
# aliases
#
source ~/.alias
date
#
# finished
#
echo ".login done"

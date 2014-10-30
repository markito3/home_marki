#
# $Id: .login,v 1.110 2014/10/30 00:18:47 marki Exp $
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
# general environment
#
setenv EDITOR emacs
setenv CVS_RSH ssh
setenv SCR /scratch/$USER
setenv HDSVN https://halldsvn.jlab.org/repos
setenv P12SVN https://phys12svn.jlab.org/repos
setenv HOUSE 74.110.120.74
setenv SOFT /group/halld/Software
setenv BUILDS /group/halld/Software/builds
setenv SCRIPTS /group/halld/Software/scripts
setenv WEB /group/halld/www/halldweb1/html
setenv LC_ALL en_US
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

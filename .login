#
# $Id: .login,v 1.143 2020/05/20 16:49:07 marki Exp $
#
echo starting .login
#
# are we at jlab
#
if ($HOST =~ *.jlab.org) then
    setenv AT_JLAB 1
else if ($HOST =~ ifarm*) then
    setenv AT_JLAB 1
else if ($HOST =~ farm*) then
    setenv AT_JLAB 1
else
    setenv AT_JLAB 0
endif
if ($AT_JLAB) then
    eval `~marki/bin/addpath.pl /site/bin`
    source /group/halld/Software/build_scripts/gluex_env_boot_jlab.csh
    source /group/halld/Software/time-history-plots/scripts/setup.csh
endif
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
setenv SCR /u/scratch/$USER
setenv HDSVN https://halldsvn.jlab.org/repos
setenv P12SVN https://phys12svn.jlab.org/repos
setenv HOUSE 74.110.127.14
setenv SOFT /group/halld/Software
setenv WEB /group/halld/www/halldweb/html
setenv LC_ALL en_US
setenv GH https://github.com/jeffersonlab
setenv GHM https://github.com/markito3
setenv JPROJ ~/jproj
addpath.pl -l /usr/local/lib
#
# aliases
#
source /home/marki/.alias
#
# info
#
dahell
#
# finished
#
echo ".login done"

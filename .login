#
# $Id: .login,v 1.95 2008/12/23 13:13:06 marki Exp $
#
echo starting .login
#
# general environment
#
setenv EDITOR emacs
setenv CVS_RSH ssh
setenv SCR /scratch/marki
setenv HDSVN https://halldsvn.jlab.org/repos
setenv P12SVN https://phys12svn.jlab.org/repos
#
# CLAS software
#
if (-e ~/.marki) then
    set hosttype=marki
else if (-e .jlab) then
    set hosttype=jlab
    setenv CLAS_ROOT /group/clas
    source $CLAS_ROOT/builds/PRODUCTION/packages/cms/$hosttype.cshrc
    setenv TOP_DIR /scratch/$USER/top_dir
else
    set hosttype=undefined
endif
echo hosttype = $hosttype
#
# set up the terminal
#
stty erase "^?" kill "^U" intr "^C" eof "^D" susp "^Z" hupcl ixon ixoff tostop -tabs
set prompt="%m:%C:\!> "  # prompt set to machine:current directory

# Set up shell environment:
set autolist

# no core dump
limit coredumpsize 0

#
# font names
#
setenv fontUnreadable lucidasanstypewriter-8
setenv fontTiny lucidasanstypewriter-10
setenv fontSmall lucidasanstypewriter-12
setenv fontMedium lucidasanstypewriter-14
setenv fontLarge lucidasanstypewriter-18
setenv fontHuge lucidasanstypewriter-24
#
# aliases
#
source ~/.alias
#
# primex
#
if ($hosttype == jlab) then
    source /group/primex/scripts/primex_jlab
endif
#
# java
#
if ($hosttype == marki) then
    setenv JAVA_HOME /usr/java/jdk1.5.0_01
    eval `addpath.pl $JAVA_HOME/bin`
endif
#
# info
#
who
if ($?DISPLAY) then
  echo DISPLAY = $DISPLAY
else
  echo DISPLAY not defined
endif
date
#
# finished
#
echo ".login done"

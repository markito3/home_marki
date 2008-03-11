#
# $Id: .login,v 1.92 2008/03/11 18:10:28 marki Exp $
#
echo starting .login
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
set history=1000
set savehist=(1000 merge)
set histdup=erase

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

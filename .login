#
# $Id: .login,v 1.81 2003/11/02 20:10:56 marki Exp $
#
echo starting .login
#
# CLAS software
#
set hosttype=`perl -e 'if ($ENV{HOST} =~ /^gp-/ || $ENV{HOST} =~ /^varc-/ || $ENV{HOST} =~ /^jlab/ || $ENV{HOST} =~ /^farm/ || $ENV{HOST} =~ /^ifarm/) {print "jlab";} else {print "marki";}'`
echo hosttype = $hosttype
setenv CLAS_ROOT /group/clas
source $CLAS_ROOT/builds/PRODUCTION/packages/cms/$hosttype.cshrc
setenv TOP_DIR /scratch/$USER/top_dir
#
# set up the terminal
#
stty erase "^?" kill "^U" intr "^C" eof "^D" susp "^Z" hupcl ixon ixoff tostop -tabs
set prompt="%m:%C:\!> "  # prompt set to machine:current directory

# Set up shell environment:
set autolist
set history=1000
set savehist=(1000 merge)

# no core dump
limit coredumpsize 0

# Set the default X server.

if ($?REMHOST ) then
  if ($REMOTEHOST != "") then
    setenv DISPLAY "$REMOTEHOST":0
  else
    setenv DISPLAY :0
  endif
endif
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
source .alias
#
# primex
#
if ($hosttype == jlab) then
    source /group/primex/scripts/primex_jlab.cshrc
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
# set term size variables
eval `resize`
#
# finished
#
echo ".login done"

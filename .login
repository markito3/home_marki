echo starting .login
#
# CLAS software
#
set hosttype=`perl -e 'if ($ENV{HOST} =~ /^gp-/ || $ENV{HOST} =~ /^varc-/ || $ENV{HOST} =~ /^jlab/ || $ENV{HOST} =~ /^farm/ || $ENV{HOST} =~ /^ifarm/) {print "jlab";} else {print "marki";}'`
echo hosttype = $hosttype
if ($hosttype == jlab) then
    setenv CLAS_ROOT /group/clas
else
    setenv CLAS_ROOT /home/claslib
endif
source $CLAS_ROOT/builds/PRODUCTION/packages/cms/$hosttype.cshrc
echo CLAS_BUILD = $CLAS_BUILD
echo CLAS_PARMS = $CLAS_PARMS
setenv TOP_DIR /scratch/$USER/top_dir
echo TOP_DIR = $TOP_DIR
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
if ($HOST != marki.jlab.org && $HOST != claspc14.jlab.org) then
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

echo starting .login
#
# CLAS software
#
if ($HOST == claspc2.jlab.org || $HOST == marki.jlab.org \
    || $HOST == claslap2.jlab.org) then
    setenv CLAS_ROOT /home/claslib
    set host=`~marki/bin/short_host.perl`
else
    setenv CLAS_ROOT /group/clas
    set host=jlab
endif
source $CLAS_ROOT/builds/PRODUCTION/packages/cms/$host.cshrc
echo CLAS_BUILD = $CLAS_BUILD
if ($host == claspc2.jlab.org || $host == marki || $host == claslap2) \
    setenv CLAS_PARMS /home/claslib/parms
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

# add personal man pages
setenv MANPATH .:/apps/man:/usr/man
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

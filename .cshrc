# Set up C shell environment:
set noclobber
set history=1000
set savehist=1000

# source /site/env/syscshrc # this redefines path from scratch.
# Wipes out any adjustments to path by user done after initial invocation
# of .cshrc.

setenv OSNAME `/bin/uname -s`

setenv EDITOR emacs
if ($HOST == jlabh1 || $HOST == jlabh2 || $HOST == jlabh3 || $HOST == jlabh4 || $HOST == ifarmh1 || $HOST == ifarmh2 || $HOST == ifarmh3 || $HOST == ifarmh4 || $HOST == ifarmh5) then
  setenv CERN /site/cernlib/hp700_ux90
else if ($HOST == jlabs1 || $HOST == jlabs2 || $HOST == jlabs3 || $HOST == jlabs4 || $HOST == clon00 || $HOST == clon01 || $HOST == clon02 || $HOST == clon03 || $HOST == clon04 || $HOST == clon05 || $HOST == clon06 || $HOST == clon10) then
  setenv CERN /site/cernlib/sun4_solaris2
else if ($HOST == jlaba1 || $HOST == jlaba2) then
  setenv CERN /site/cernlib/rs_aix32
else if ($HOST == ifarml1 || $HOST == ifarml2) then
  setenv CERN /site/cernlib/pc_linux
else if ($HOST == claspc2.cebaf.gov) then
  setenv CERN /home/cern
else if ($HOST == localhost.localdomain) then
  setenv CERN /home/cern/cernlib
else
  setenv CERN /dummy_file_system
endif
setenv FTP /site/ftp/pub/marki
setenv MISC $HOME/misc
if ($HOST == localhost.localdomain) then
  setenv SCR /home/scratch/marki
else
  setenv SCR /scratch/marki
endif
setenv EPB /usr/site2/epics_physics/hallb

# Define your default printer
setenv LPDEST phyhp9
if ($HOST != marki.cebaf.gov) setenv PRINTER phyhp9
#
# setups
#
#source /usr/user9/marki/egs4_system/Cshrc_additions_for_egs4
#source /usr/site4/egs4/Cshrc_additions_for_egs4
if ($HOST == jlabh1 || $HOST == jlabh2 || $HOST == jlabh3 || $HOST == jlabh4) then
  alias setup 'set s_args=(\!*); source /site/bin/setup'
else
  alias setup 'set s_args=(\!*); source /usr/local/bin/setup'
endif
#
# CERN Libraries
#
if ($OSNAME == SunOS || ($OSNAME == Linux && $HOST != claspc2.cebaf.gov)) then
    setenv CERN_LEVEL 97a
else
    setenv CERN_LEVEL 99
endif
setenv CERN_ROOT $CERN/$CERN_LEVEL
#
# CLAS
#
if ($HOST == claspc2.cebaf.gov || $HOST == localhost.localdomain) then
    alias setup_clas source /home/claslib/builds/PRODUCTION/packages/cms/claspc2.cshrc
else
    alias setup_clas source /group/clas/builds/PRODUCTION/packages/cms/jlab.cshrc
endif
#
# Miscellaneous environment variables
#
setenv WINGZ3 /usr/local/src/Wingz3
#
# path
#
if ($OSNAME == HP-UX && $HOST != clas10) then
  eval `~marki/bin/addpath.perl /apps/tex/bin /apps/emacs/19.34b/bin /apps/gnu/bin /apps/bin /site/bin /opt/fortran/bin`
else if ($HOST == jlabs1 || $HOST == jlabs2 || $HOST == jlabs3 || $HOST == jlabs4) then
    eval `~marki/bin/delpath.perl /usr/local/bin`
  eval `~marki/bin/addpath.perl $CERN_ROOT /usr/local/bin /bin /usr/sbin /apps/bin /site/bin /usr/openwin/bin /usr/dt/bin /usr/bin/X11 /opt/SUNWspro/bin /usr/ccs/bin /usr/ucb`
else if ($HOST == clon00 || $HOST == clon01 || $HOST == clon02 || $HOST == clon03 || $HOST == clon04 || $HOST == clon05 || $HOST == clon06 || $HOST == clon10) then
  eval `~marki/bin/addpath.perl $CERN_ROOT /apps/gnu/bin /usr/local/bin /bin /usr/sbin /apps/bin /site/bin /usr/openwin/bin /usr/dt/bin /usr/bin/X11 /opt/SUNWspro/bin /usr/ccs/bin /usr/ucb /usr/local/gnu/bin /net/alcor/usr/local/windppc/host/sun4-solaris2/bin`
else if ($HOST == cebafb || $HOST == cebafe || $HOST == cebafh) then
  eval `~marki/bin/addpath.perl /usr/site2/emacs/bin /site/bin`
else if ($HOST == claspc2.cebaf.gov) then
  eval `~marki/bin/addpath.perl /usr/local/src/jdk/bin /site/bin /usr/openwin/bin /usr/games`
else if ($HOST == claslap2.cebaf.gov) then
  eval `~marki/bin/addpath.perl /usr/games`
else if ($OSNAME == AIX) then
  eval `~marki/bin/delpath.perl . /usr/local/bin`
  eval `~marki/bin/addpath.perl /site/bin /usr/local/bin`
endif
if ($HOST == clas10) then
  eval `~marki/bin/delpath.perl /usr/local/bin /usr/bin /bin /usr/site2/gnu/bin /usr/site2/bin /usr/vue/bin /usr/contrib/bin . /bin/posix /usr/bin/X11`
  eval `~marki/bin/addpath.perl /usr/vue/bin /usr/bin/X11 /usr/local/bin /usr/bin /bin`
endif
eval `~marki/bin/addpath.perl $CERN_ROOT/bin`
eval `~marki/bin/addpath.perl . $HOME/bin $HOME/bin/$OSNAME`
#
# umask
#
umask 2
#
# exit
#
exit

# Set up C shell environment:
set noclobber
set history=1000
set savehist=1000

# source /site/env/syscshrc # this redefines path from scratch.
# Wipes out any adjustments to path by user done after initial invocation
# of .cshrc.

setenv OSNAME `/bin/uname -s`

setenv EDITOR "emacs -nw"
if ($HOST == jlabh1 || $HOST == jlabh2 || $HOST == jlabh3 || $HOST == jlabh4) then
  setenv CERN /site/cernlib/hp700_ux90
else if ($HOST == jlabs1 || $HOST == jlabs2 || $HOST == jlabs3 || $HOST == jlabs4 || $HOST == clon00 || $HOST == clon01 || $HOST == clon02 || $HOST == clon03 || $HOST == clon04) then
  setenv CERN /site/cernlib/sun4_solaris2
else if ($HOST == jlaba1 || $HOST == jlaba2) then
  setenv CERN /site/cernlib/rs_aix32
else if ($HOST == ifarml1.cebaf.gov) then
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
if ($HOST == cebafb || $HOST == cebafe || $HOST == cebafh) then
  setenv SCR /scratch2/marki
else
  setenv SCR /scratch/marki
endif
setenv EPB /usr/site2/epics_physics/hallb

# Define your default printer
setenv LPDEST cb113q
if ($HOST != localhost.localdomain) setenv PRINTER cb113q
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
if ($HOST == ifarml1.cebaf.gov) then
    setenv CERN_LEVEL 97a
else
    setenv CERN_LEVEL 96a
endif
setenv CERN_ROOT $CERN/$CERN_LEVEL
#
# CLAS
#
if ($HOST == claspc2.cebaf.gov) then
    alias setup_clas source /group/clas/builds/DEVELOPMENT/packages/cms/claspc2.cshrc
else if ($HOST == localhost.localdomain) then
    alias setup_clas \
	source /home/claslib/builds/PRODUCTION/packages/cms/marki.cshrc
else
    alias setup_clas source /group/clas/builds/DEVELOPMENT/packages/cms/jlab.cshrc
endif
setenv TOP_DIR /home/marki/work
#
# EPICS
#
alias setup_epics "source /apps/epics/setup/setup_epics"
alias spe "source ~marki/bin/spe"
#
# path
#
eval `~marki/bin/addpath.perl $CERN_ROOT/bin`
if ($HOST == jlabh1 || $HOST == jlabh2 || $HOST == jlabh3 || $HOST == jlabh4 || $HOST == jlaba1 || $HOST == jlaba2) then
  eval `~marki/bin/addpath.perl . $HOME/bin $HOME/bin/$OSNAME $CERN_ROOT/bin /apps/tex/bin /apps/emacs/19.34b/bin /apps/gnu/bin /apps/bin /site/bin`
else if ($HOST == jlabs1 || $HOST == jlabs2 || $HOST == jlabs3 || $HOST == jlabs4) then
  eval `~marki/bin/addpath.perl . $HOME/bin $HOME/bin/$OSNAME  $CERN_ROOT /apps/gnu/bin /usr/local/bin /bin /usr/sbin /apps/bin /site/bin /usr/openwin/bin /usr/dt/bin /usr/bin/X11 /opt/SUNWspro/bin /usr/ccs/bin /usr/ucb`
else if ($HOST == clon00 || $HOST == clon01 || $HOST == clon02 || $HOST == clon03 || $HOST == clon04) then
  eval `~marki/bin/addpath.perl . $HOME/bin $HOME/bin/$OSNAME  $CERN_ROOT /usr/local/bin /bin /usr/sbin /apps/bin /site/bin /usr/openwin/bin /usr/dt/bin /usr/bin/X11 /opt/SUNWspro/bin /usr/ccs/bin /usr/ucb /usr/local/gnu/bin /net/alcor/usr/local/windppc/host/sun4-solaris2/bin`
else if ($HOST == cebafb || $HOST == cebafe || $HOST == cebafh) then
  eval `~marki/bin/addpath.perl . $HOME/bin $HOME/bin/$OSNAME  $CERN_ROOT/bin /usr/site2/emacs/bin /site/bin`
else if ($HOST == clas10) then
  eval `~marki/bin/addpath.perl . $HOME/bin $HOME/bin/$OSNAME  $CERN_ROOT/bin /usr/site2/emacs/bin /site/bin`
else if ($HOST == claspc2.cebaf.gov) then
  eval `~marki/bin/addpath.perl . $HOME/bin $HOME/bin/$OSNAME  /usr/openwin/bin`
else
  eval `~marki/bin/addpath.perl . $HOME/bin $HOME/bin/$OSNAME`
endif
#
# umask
#
umask 2
#
# exit
#
exit

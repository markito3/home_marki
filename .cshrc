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
  setenv CERN /site/cernlib/hp_ux102
else if ($HOST == jlabs1 || $HOST == jlabs2 || $HOST == ifarms1 || $HOST == ifarms2 || $HOST == clon00 || $HOST == clon01 || $HOST == clon02 || $HOST == clon03 || $HOST == clon04 || $HOST == clon05 || $HOST == clon06 || $HOST == clon10) then
  setenv CERN /site/cernlib/sun4_solaris2
else if ($HOST == jlaba1 || $HOST == jlaba2 || $HOST == ifarma1) then
  setenv CERN /site/cernlib/rs_aix41
else if ($HOST == ifarml1 || $HOST == ifarml2 || $HOST == ifarml3) then
  setenv CERN /site/cernlib/pc_linux
else if ($HOST == claspc2.jlab.org) then
  setenv CERN /home/cern
else if ($HOST == marki.jlab.org) then
  setenv CERN /home/cern/cernlib
else
  setenv CERN /dummy_file_system
endif
setenv FTP /site/ftp/pub/marki
setenv MISC $HOME/misc
setenv SCR /scratch/marki

# Define your default printer
setenv LPDEST phyhp9
if ($HOST != marki.jlab.org) setenv PRINTER phyhp9
#
# setups
#
#source /usr/user9/marki/egs4_system/Cshrc_additions_for_egs4
#source /usr/site4/egs4/Cshrc_additions_for_egs4
#
# CERN Libraries
#
if ($HOST == ifarml1 || $HOST == ifarml2 || $HOST == ifarml3) then
    setenv CERN_LEVEL 97a
else
    setenv CERN_LEVEL 99
endif
setenv CERN_ROOT $CERN/$CERN_LEVEL
#
# CLAS
#
if ($HOST == claspc2.jlab.org || $HOST == localhost.localdomain) then
    alias setup_clas source /home/claslib/builds/PRODUCTION/packages/cms/claspc2.cshrc
else
    alias setup_clas source /group/clas/builds/PRODUCTION/packages/cms/jlab.cshrc
endif
#
# Miscellaneous environment variables
#
setenv CLAS_TOOLS /group/clas/tools
setenv WINGZ3 /usr/local/src/Wingz3
#
# path
#
source ~marki/.set_path
#
# umask
#
umask 2
#
# exit
#
exit

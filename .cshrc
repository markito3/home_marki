# Set up C shell environment:
set noclobber

# source /site/env/syscshrc # this redefines path from scratch.
# Wipes out any adjustments to path by user done after initial invocation
# of .cshrc.

setenv OSNAME `/bin/uname -s`
setenv EDITOR emacs
setenv CVS_RSH ssh

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
else if ($HOST == claslap2.jlab.org) then
  setenv CERN /home/cern
else if ($HOST == marki.jlab.org) then
  setenv CERN /home/cern/cernlib
else
  setenv CERN /dummy_file_system
endif
setenv FTP /site/ftp/pub/marki
setenv MISC $HOME/misc
setenv SCR /scratch/marki
#
# setups
#
#source /usr/user9/marki/egs4_system/Cshrc_additions_for_egs4
#source /usr/site4/egs4/Cshrc_additions_for_egs4
#
# CERN Libraries
#
if ($HOST == ifarml1 || $HOST == ifarml2) then
    setenv CERN_LEVEL 98a
else if ($HOST == claspc2.jlab.org || $HOST == claslap2.jlab.org || $HOST == ifarml1 || $HOST == ifarml2 || $HOST == ifarml3) then
    setenv CERN_LEVEL 2000
else
    setenv CERN_LEVEL 99
endif
setenv CERN_ROOT $CERN/$CERN_LEVEL
#
# Miscellaneous environment variables
#
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

# Set up C shell environment:
set noclobber

# source /site/env/syscshrc # this redefines path from scratch.
# Wipes out any adjustments to path by user done after initial invocation
# of .cshrc.

setenv EDITOR emacs
setenv CVS_RSH ssh
setenv SCR /scratch/marki
setenv HDSVN https://halldsvn.jlab.org/repos
setenv P12SVN https://phys12svn.jlab.org/repos
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

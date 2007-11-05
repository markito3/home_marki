# Set up C shell environment:
set noclobber

# source /site/env/syscshrc # this redefines path from scratch.
# Wipes out any adjustments to path by user done after initial invocation
# of .cshrc.

setenv OSNAME `/bin/uname -s`
setenv EDITOR emacs
setenv CVS_RSH ssh
setenv MISC $HOME/misc
setenv SCR /scratch/marki
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

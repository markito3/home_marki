# Set up C shell environment:
set noclobber
#
# path
#
source ~marki/.set_path
#
# umask
#
umask 2
#
# history
#
set history=1000
set savehist=(1000 merge)
set histdup=erase
#
# exit
#
exit

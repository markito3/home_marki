# Set up C shell environment:
set noclobber
#
# are we at jlab
#
if ($HOST =~ *.jlab.org) then
    setenv AT_JLAB 1
else
    setenv AT_JLAB 0
endif
#
# path
#
source ~marki/.set_path
setenv LD_LIBRARY_PATH /usr/local/lib
#
# umask
#
umask 2
#
# exit
#
exit

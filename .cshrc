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
source ~/.set_path
#
# umask
#
umask 2
#
# exit
#
exit

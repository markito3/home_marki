#!/bin/csh
echo starting .login
#set up the terminal
stty erase "^?" kill "^U" intr "^C" eof "^D" susp "^Z" hupcl ixon ixoff tostop -tabs
set prompt="%m:%C> "  # prompt set to machine:current directory

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

# adjust the path
if ($HOST == jlabh1) then
  eval `/home/marki/bin/addpath.pl /usr/contrib/bin/X11`
  #setenv PATH `/home/marki/bin/addpath /site/bin`
  #setenv PATH `/home/marki/bin/addpath /home/marki/bin`
  #setenv PATH `/home/marki/bin/addpath .`
else if ($HOST == clas10) then
  eval `/home/marki/bin/addpath.pl /home/marki/bin`
  #setenv PATH `/home/marki/bin/addpath /home/marki/bin`
else if ($HOST == jlabs3) then
  eval `/home/marki/bin/addpath.pl /home/marki/bin`
  rehash
endif

# add personal man pages
setenv MANPATH .:/apps/man:/usr/man

# fonts

setenv BIG courb24
setenv MEDIUM courb18
setenv SMALL courb14
#
# private aliases
#
alias add 'grep -i \!* /home/marki/misc/stuff/lists/address.tex'
alias addadd 'emacs ~/misc/stuff/lists/address.tex &'
alias addless 'less ~/misc/stuff/lists/address.tex'
alias bckgnd "xv -root -rmode 5 -maxpect -owncmap -quit \!* &"
alias beam_current ssh -n clas10 -l clasrun "'"setup_epics '>&' /dev/null ';' '$APP'/general/strip/strip_beam_simple.csh"'"
alias clas_big "rm -f ~/clas_big.txt ; find /u/group/ -path '/u/group/.snapshot' -prune -o -path '/u/group/clas' -prune -o -group clas -size +2000k -exec ls -ld {} \; > ~/clas_big.txt"
alias colors "more /usr/lib/X11/rgb.txt"
alias control "ssh -n -l root 0 control-panel >& /dev/null &"
alias crib "less /home/marki/misc/crib.txt"
alias cribadd "emacs /home/marki/crib.txt &"
alias cribe "less $HOME/slow/epics_crib.txt"
alias cvs_clas setenv CVSROOT /group/clas/clas_cvs
alias cvs_clasr setenv CVSROOT :pserver:marki@jlabs1.cebaf.gov:/group/clas/clas_cvs
alias cvs_epics setenv CVSROOT /home/epics/cvs
alias cvs_epicsr setenv CVSROOT :ext:marki@clon01.cebaf.gov:/home/epics/cvs
alias cvs_my setenv CVSROOT /home/marki/cvs
alias cvs_myr setenv CVSROOT :pserver:marki@jlabs1.cebaf.gov:/home/marki/cvs
alias cvslogw "rm -f cvslog_\!*.tmp ; cvs log \!* > cvslog_\!*.tmp ; lw cvslog_\!*.tmp"
alias cvstag "cvs log | grep -e release -e Working -e 'total revisions' " \
  "-e === | less"
alias cvsq cvs -n -q update
alias cw 'set cwfile=`date +%s` ; \!* > & $cwfile.tmp ; xterm -title "\!*" -e less $cwfile.tmp &'
alias dial sudo /etc/ppp/ppp-on
alias disk "bdf | grep -i -e scr -e kbytes -e user9"
alias difc 'echo \!*~ \!* ; diff \!*~ \!*'
alias dusort du -r \| sort -k 1nr
alias ecrib "less ~marki/slow/epics_crib.txt"
alias ecribadd "x ~marki/slow/epics_crib.txt"
alias emb "emacs -fn -adobe-courier-bold-r-normal--24-240-75-75-m-150-hp-roman8"
alias en "ps -u marki | grep emacs | wc"
alias en1 "enscript -MLetter -i0.5i"
alias en1d "enscript -MLetter -DDuplex:true -i0.5i"
alias en2 "enscript -MLetter -2r"
alias en2d "enscript -MLetter -2r -DDuplex:true"
alias enslide "enscript -MLetter -f Courier18"
alias enscrip "enscript -MLetter -p enscript.tmp -i0.5i"
alias eq "x ~marki/slow/epics_questions.txt"
alias errchk "grep -i -e error -e '\*\*'"
alias gr "grep -i"
alias grepcache "strings ~/.netscape/cache/index.db | grep -i \!* | more -e"
alias hangup sudo /etc/ppp/ppp-off
alias hgrep "history | grep -i"
alias hits 'cat /var/log/httpd/access_log | grep -v node | grep -v claspc2 | grep -v "\.gif" | grep -v "\.jpg" | grep -v "\.net" | grep -v "\.com"'
alias logbook pushd /usr/local/src/logbook \; ./logbook \; popd
alias lprdup "cat /home/marki/misc/prologue_duplex.txt \!* | lpr"
alias lps 'lpsta $LPDEST'
alias lpsta "lpstat -r -a\!* -p\!* -o\!*"
alias lpcolor "lp -dpscolor1"
alias lscl "ls -Ral | grep -e '\.tmp' -e \~ -e '\.aux' -e '#' -e '\.dvi' -e 'last\.kumac' -e 'paw\.metafile' -e 'a\.out' -e 'HBOOK_FILE' -e 'core' -e '\.o' -e 'ftn' | sort -k 5nr | more -e"
alias lsb "ls -RalF | sort -k 5nr | more -e"
alias lsd "ls -F \!* | grep /"
alias lsl "ls -laF \!* | more -e"
alias lss "ls -laF \!* | sort -k5nr | more -e"
alias lst "ls -laFt \!* | more -e"
alias lsx "ls -aF \!* | grep \*"
alias lsf "ls -F" # stick this after the other ls's
alias lw "xterm -title \!* -e less \!* &"
alias manw "xterm -title '"'man \!*'"' -e man \!* &"
alias mycal 'ssh -l marki -n claspc2.cebaf.gov ical &'
alias netscap "netscape -install http://claspc2.cebaf.gov/~marki/ > & /dev/null &"
alias news "xrn -nntpServer news.cebaf.gov &"
alias pstop "ps -efo 'user pid ppid pcpu pmem vsz comm' | sort -k 4,4rn | head ; ps -efo 'user pid ppid pcpu pmem vsz comm' | sort -k 5,5rn | head"
alias pu "pushd"
alias rmi "rm -i"
alias sd "setenv DISPLAY \!*':0.0'"
alias setup_epics \
    source /home/epics/R3.13.0.beta11/epicsB/prod/scripts/setup_epics
alias shenv "printenv | grep -i"
alias soup xv /home/marki/misc/soup.gif
alias spe "source ~marki/bin/spe"
alias staff "grep -i \!* /tmp/staff.txt"
alias sstaff ssh jlaba2 staff
alias suterm "xterm -e su &"
alias todo "emacs ~/misc/stuff/lists/todo.txt &"
alias topm "ps -efo 'user pid ppid pcpu pmem vsz comm' | sort -k 4,4rn | head"
alias tsadd "x $HOME/misc/stuff/lists/timesheet.txt"
alias turnoff sudo /sbin/shutdown -h now
alias vu "vuepad"
alias wea "telnet downwind.sprl.umich.edu 3000"
alias windows sudo /sbin/shutdown -r now
alias xwm "rm -f /tmp/ssh-agent_wm.log ; exec ssh-agent fvwm95-2 > & /tmp/ssh-agent_wm.log"
alias xh "xhost cebaf1 cebaf2 cebafb cebafe cebafh opspare viper.princeton.edu puphed.princeton.edu bnlku7.phy.bnl.gov bnlku10.phy.bnl.gov puhep1.princeton.edu clon00 clon01 dev02 clas10"
alias xload_hp "ssh -n \!* /usr/contrib/bin/X11/xload > & /dev/null &"
alias xmm "xmodmap -e 'keycode 16 = Escape'" # make <F1> into <escape>
alias xn "emacs -nw"
alias xr "chmod -w \!* ; emacs -name \!* \!* ; chmod +w \!* &"
alias xstart "rm -f /tmp/ssh-agent.log ; exec ssh-agent startx > & /tmp/ssh-agent.log"
alias xstartd "dial ; xstart"
alias xt "xterm -ls -vb -n $USER@$HOST -title $USER@$HOST &"
alias xtb "xterm -fn -adobe-courier-bold-r-normal--24-240-75-75-m-150-hp-roman8 &"
alias xtbnl "xterm -fn -adobe-courier-bold-r-normal--18-180-75-75-m-110-iso8859-1 &"
#
# CLAS software
#
if ($HOST != clas10 && $HOST != claspc1.cebaf.gov) then
    if ($HOST == claspc2.cebaf.gov || $HOST == localhost.localdomain \
	|| $HOST == claslap2) \
	setenv CLAS_BUILD /home/claslib/builds/PRODUCTION
    setup_clas
    if ($HOST == claspc2.cebaf.gov || $HOST == localhost.localdomain) \
	setenv CLAS_PARMS /home/claslib/parms
endif
setenv TOP_DIR /scratch/$USER/top_dir
echo TOP_DIR = $TOP_DIR
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

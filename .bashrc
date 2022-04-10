# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
set -o noclobber
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
# non-generic path additions
PATH=$HOME/git/time-history-plots/scripts:$HOME/git/hd_singularity/scripts:$HOME/git/gluex_install:$PATH
export PATH
export BEACH=47.133.86.121
export HDSVN=https://halldsvn.jlab.org/repos
export HISTCONTROL=erasedups
export HISTTIMEFORMAT="%d/%m/%y %T "
export HOUSE=108.39.47.132
export P12SVN=https://phys12svn.jlab.org/repos
export EDITOR=vi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

shopt -s direxpand

# User specific aliases and functions
# aliases
alias backup_status="find /travel/backup/renee/ -maxdepth 2 -name backup_date -exec ls -l {} \;"
alias bcf="bc /home/marki/.bcrc"
alias big_xclock="LC_ALL=C xclock -digital -norender -update 1 -strftime '%a %b %d %l:%M:%S %p' -fn -*-*-*-r-*--34-*-*-*-p-*-*-* &"
alias cppv="cp -pv"
alias cpv="cp -v"
alias cvsq="cvs -n -q update"
alias declf="eval `declare -F`"
alias del="rm -iv"
alias di="dirs -v"
alias gfa="git fetch --all"
alias h=history
alias hg="history | grep -i"
alias interactiveq="[[ $- == *i* ]] && echo 'Interactive' || echo 'Not interactive'"
alias lssh="ssh -t -p9001 localhost ssh -YA"
alias loginq="shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'"
alias lorentz="ssh -t -p9001 localhost"
alias lorentz_ssh="ssh -t -L9001:localhost:9001 login.jlab.org \
      ssh -t -L9001:localhost:22 lorentz"
alias lorentz_vnc="ssh -t -L5901:localhost:54061 login.jlab.org \
      ssh -t -L54061:localhost:5901 lorentz"
alias lorentz_vnc2="ssh -t -L5902:localhost:54062 login.jlab.org \
      ssh -t -L54062:localhost:5902 lorentz"
alias lorentz_vnc3="ssh -t -L5903:localhost:54063 login.jlab.org \
      ssh -t -L54063:localhost:5903 lorentz"
alias mvv="mv -v"
alias pu=pushd
alias po=popd
alias rm_empty_dir="find . -type d -empty -exec rmdir -v {} \;"
alias rsync_oasis="rsync -ruvt --delete --links -e 'ssh -p9002' localhost:/cvmfs/oasis.opensciencegrid.org/gluex/group/ /travel/gluex/group/"
alias sing_c7="singularity exec --cleanenv --bind /data /data/gluex/singularity/gluex_centos-7.7.1908_sng3.8_gxi2.30.sif bash"
alias sing_c8="singularity exec --cleanenv --bind /data /data/gluex/singularity/gluex_centos-8.4.2105_sng3.8_gxi2.28.sif bash"
alias sing_u20="singularity exec --cleanenv --bind /data /data/gluex/singularity/gluex_ubuntu.focal-20200925_sng3.8_gxi2.29.sif bash"
alias shenvni="printenv | grep"
alias shenv="printenv | grep -i"
alias sshya="ssh -YA"
alias svnq="svn status -u"
alias unixtime="date +%s"
# functions
e() {
    emc.sh $1 >& /dev/null &
}
enw() {
    emacs -nw $1
}
ev() {
    echo "$1"
    evince "$1" >& /dev/null &
}
findgrepni() {
    find . -type f -exec bash -c "file {} | grep -l text > /dev/null" \; -exec grep -l $1 {} \; -exec echo ---------- \; -exec grep -C3 $1 {} \; -exec echo ========== \;
}
findgrep() {
    find . -type f -exec bash -c "file {} | grep -l text > /dev/null" \; -exec grep -il $1 {} \; -exec echo ---------- \; -exec grep -C3 -i $1 {} \; -exec echo ========== \;
}
gitq() {
    git status
    git branch -vv
    git remote -v
    git stash list
}
gsetup() {
    gt=$1
    . $gt/gluex_env_boot.sh
    gxenv
}
humantime() {
    date --date=@"$@"
}
lsa() {
    ls -aF "$@"
}
lsd() {
    ls -laFd "$@" | more
}
lsl() {
    ls -laF "$@" | more
}
lst() {
    ls -laFt "$@" | more
}
lw() {
    xterm -fn 10x20 -T $1 -e less $1 &
}
psg() {
    ps auxw | grep -i $1 | grep -v 'grep '
}
trash() {
    mv -v "$@" ~/.local/share/Trash/files/
}
vncs() {
    vncserver -geometry 2304x1296 :$1
}
usb_dirty_bytes() {
    echo $((16*1024*1024)) > /proc/sys/vm/dirty_background_bytes
    echo $((48*1024*1024)) > /proc/sys/vm/dirty_bytes
}
if [ `hostname` == "markdesk4.itodomain" ]
then
    # echo .bashrc: on markdesk4
    if [ -d "/.singularity.d" ]
    then
	source /group/halld/Software/build_scripts/gluex_env_boot_jlab.sh
    else
	source /beach/gluex_top/gluex_env_boot.sh
    fi
elif [ `hostname` == "markdesk5.itodomain" ]
then
    export SCR=/data/scratch
    if [ -d "/.singularity.d" ]
    then
	if [ -f /etc/redhat-release ]
	then
	    if grep -lq "CentOS Linux release 7" /etc/redhat-release
	    then
		source /data/gluex/gluex_top_centos7/gluex_env_boot.sh
		export PS1="[\u@\h/singC7 \W]\$ "
	    elif grep -lq "CentOS Linux release 8.2." /etc/redhat-release
	    then
		source /data/gluex/gluex_top_centos8/gluex_env_boot.sh
		export PS1="[\u@\h/singC8 \W]\$ "
	    elif grep -lq "CentOS Linux release 8.4." /etc/redhat-release
	    then
		source /data/gluex/gluex_top_centos8_gcc8.4/gluex_env_boot.sh
		export PS1="[\u@\h/singC8 \W]\$ "
	    elif grep -lq "Fedora release 33" /etc/redhat-release
	    then
		source /data/gluex/gluex_top_fedora33/gluex_env_boot.sh
		export PS1="[\u@\h/singF33 \W]\$ "
	    fi
	elif [ -f /etc/lsb-release ]
	then
	    . /etc/lsb-release
	    export PS1="[\u@\h/$DISTRIB_CODENAME \W]\$ "
	else
	    echo nothing sourced
	fi
    else
	source /data/gluex/gluex_top/gluex_env_boot.sh
	xrdb -load ~/.Xdefaults
    fi
elif [ `hostname` == "markdesk4" ]
then
    export SCR=/home/scratch
    source /home/gluex/gluex_top/gluex_env_boot.sh
elif [ `hostname` == "ZEEMAN" ]
then
    source /home/marki/gluex_top/gluex_env_boot.sh
else
    # echo .bashrc: assuming jlab
    source /group/halld/Software/build_scripts/gluex_env_boot_jlab.sh
    export SOFT=/group/halld/Software
    export WEB=/group/halld/www/halldweb/html
    eval `/home/marki/bin/addpath.pl -b /site/bin`
    export SCR=/u/scratch/$USER
fi

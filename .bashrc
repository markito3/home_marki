# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
export HISTTIMEFORMAT="%d/%m/%y %T "

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

shopt -s direxpand

# User specific aliases and functions
# aliases
alias cppv="cp -pv"
alias cpv="cp -v"
alias cvsq="cvs -n -q update"
alias del="rm -iv"
alias di="dirs -v"
alias gxc="singularity shell --cleanenv --bind /travel/gluex/group/halld:/group/halld /beach/singularity/containers/gluex_centos7.7.simg"
alias hg="history | grep -i"
alias interactiveq="[[ $- == *i* ]] && echo 'Interactive' || echo 'Not interactive'"
alias loginq="shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'"
alias lorentz="ssh -p9001 localhost"
alias lorentz_ssh="ssh -t -L9001:localhost:9001 login.jlab.org \
      ssh -t -L9001:localhost:22 lorentz"
alias lorentz_vnc="ssh -t -L5901:localhost:54061 login.jlab.org \
      ssh -t -L54061:localhost:5901 lorentz"
alias lorentz_vnc2="ssh -t -L5902:localhost:54062 login.jlab.org \
      ssh -t -L54062:localhost:5902 lorentz"
alias mvv="mv -v"
alias pu=pushd
alias po=popd
alias rsync_oasis="rsync -ruvt --delete --links -e 'ssh -p9002' localhost:/cvmfs/oasis.opensciencegrid.org/gluex/group/ /travel/gluex/group/"
alias scosg16_ssh="ssh -t -L9002:localhost:9002 login.jlab.org \
      ssh -t -L9002:localhost:22 scosg16"
alias shenv="printenv | grep -i"
alias sshya="ssh -YA"
alias svnq="svn status -u"
# functions
e() {
    emacs $1 >& /dev/null &
}
enw() {
    emacs -nw $1
}
ev() {
    echo "$1"
    evince "$1" >& /dev/null &
}
findgrep() {
    find . -type f -exec grep -il $1 {} \; -exec echo ---------- \; -exec grep -i $1 {} \; -exec echo ========== \;
}
gitq() {
    git status
    git branch -vv
    git remote -v
    git stash list
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
    xterm -T $1 -e less $1 &
}
psg() {
    ps auxw | grep -i $1 | grep -v 'grep '
}
trash() {
    mv -v "$@" ~/.local/share/Trash/files/
}
vncs() {
    vncserver -geometry 1820x880 :$1
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
else
    # echo .bashrc: not on markdesk4
    source /group/halld/Software/build_scripts/gluex_env_boot_jlab.sh
fi

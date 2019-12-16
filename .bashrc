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

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias cvsq="cvs -n -q update"
alias gitq="git status \; git branch -vv \; git remote -v"
alias lorentz="ssh -p9001 localhost"
alias lorentz_ssh="ssh -t -L9001:localhost:9001 jlab.jlab.org \
      ssh -t -L9001:localhost:22 lorentz"
alias lorentz_vnc="ssh -t -L5901:localhost:54061 jlab.jlab.org \
      ssh -t -L54061:localhost:5901 lorentz"
alias mvv="mv -v"
alias cppv="cp -pv"
alias cpv="cp -v"
alias pu=pushd
alias po=popd
e() {
    emacs $1 >& /dev/null &
}
ev() {
    echo "$1"
    evince "$1" >& /dev/null &
}
lst() {
    ls -laFt $1 | more
}
lw() {
    xterm -T $1 -e less $1 &
}
psg() {
    ps auxw | grep -i $1 | grep -v 'grep '
}

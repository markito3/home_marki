e() {
    emacs $1 >& /dev/null &
}
alias gitq="git status \; git branch \; git remote -v"
alias lorentz_vnc="ssh -t -L5901:localhost:54061 jlab.jlab.org ssh -t -L54061:localhost:5901 lorentz"
alias pu=pushd
alias po=popd

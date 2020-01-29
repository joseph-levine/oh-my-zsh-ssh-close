fpath+="${0:h}/src"

ssh-close () {
    ssh -S ~/.ssh/$1 -O exit $1
}

ssh-close-all() {
    if test -n "$(find ~/.ssh -maxdepth 1 -name 'socket*' -print -quit)"
    then
        for socket in "$HOME"/.ssh/socket*
        do
            bn=$(basename "$socket")
            ssh -S "$socket" -O exit "$bn"
        done
    fi
}

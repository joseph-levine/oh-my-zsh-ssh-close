fpath+="${0:h}/src"

ssh-close () {
    ssh -S "$HOME/.ssh/$1" -O exit "$1"
}

ssh-close-all() {
    any_open_connections=$(find "$HOME/.ssh" -maxdepth 1 -name 'socket*' -print -quit)
    if test -n "$any_open_connections"
    then
        for socket in "$HOME"/.ssh/socket*
        do
            bn=$(basename "$socket")
            ssh -S "$socket" -O exit "$bn"
        done
    fi
}

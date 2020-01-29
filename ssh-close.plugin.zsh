fpath+="${0:h}/src"

ssh-close () {
    ssh -S ~/.ssh/$1 -O exit $1
}

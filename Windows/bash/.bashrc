pandoc_html () {
    pandoc -s --self-contained -t html5 -c ~/.pandoc/github.css $@
}

function wincmd() {
    CMD=$1
    shift
    $CMD $* 2>&1 | iconv -f cp932 -t utf-8
}
alias ping='wincmd ping'

function wincmd() {
    CMD=$1
    shift
    $CMD $* 2>&1 | iconv -f cp932 -t utf-8
}
alias java='wincmd java'

function wincmd() {
    CMD=$1
    shift
    $CMD $* 2>&1 | iconv -f cp932 -t utf-8
}
alias javac='wincmd javac'

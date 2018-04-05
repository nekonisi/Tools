pandoc_html () {
    pandoc -s --self-contained -t html5 -c ~/.pandoc/github.css $@
}

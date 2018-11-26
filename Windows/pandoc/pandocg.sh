#!usr/bin/bash

# 実行時に指定された引数の数をチェックする

function argCountCheck() {
if [ $1 -gt 2 ]; then
echo "引数の数が多すぎます" >&2
exit 1
elif [ $1 -lt 1 ]; then
echo "引数の数が少なすぎます" >&2
exit 2
else
:
fi
}

function fileFormatCheck() {
extension1=${1##*.}
extension2=${2##*.}

if [ ${extension1} != md ]; then
echo "第一引数にはmdファイルを指定してください" >&2
exit 3
fi

if [ exprt($3) -eq 2 ]; then
if [ !${extension2} != html ]; then
echo "第二引数はhtml形式で指定してください" >&2
exit 4
fi
fi
}

function fileExistCheck() {
if [ ! -f $1 ]; then
echo ${1}が存在しません。
exit 5
fi
}

argCountCheck $#
fileFormatCheck $1 $2 $#
fileExistCheck $1

if [ $# == 1 ]; then
pandoc $1 --self-contained --toc --metadata pagetitle=${1} -t html5 --template ~/.pandoc/template.html -c ~/.pandoc/template.css -o ${1%.*}.html
else [ $# == 2 ];
pandoc $1 -s --self-contained --toc --metadata pagetitle=${1} -t html5 --template ~/.pandoc/template.html -c ~/.pandoc/template.css -o ${2}.html
fi

exit 0

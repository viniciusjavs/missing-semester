#!/usr/bin/env bash

#1
ls -a
ls -lh
ls -ltc
ls -lahtc --color=always

#2
marco() {
    marco_dir=$(pwd)
}

polo() {
    cd "$marco_dir" || return
}

#3
./runner.sh

#4
find . -regextype posix-extended -iregex '.*\.(html|htm)' -print0 | xargs -0 zip all_html.zip && zip -sf all_html.zip

#5
find . -type f -name '*' -print0 | xargs -0 ls -ltc

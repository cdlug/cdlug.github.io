#!/bin/bash
today(){
    date +"%Y-%m-%d"
}

gettitle(){
    tdef="Untitled$RANDOM by `getuser`"
    (>&2 echo -e "    \033[1mUsage:\033[0m $0 the title string")
    echo ${args:-$tdef}
}
getfname(){
    echo $@|sed -e 's@\s\+@_@g'
}
getuser(){
    git config user.name
    [ $? -ne 0 ] && echo $USER
}
initpost(){
    ptitle=`gettitle`
    fname=`getfname $ptitle`
    pfile=$pdir/`today`-$fname.$ext
    echo $pfile
    cat >>$pfile<<CDLUG
---
layout: post
title: $ptitle
author: `getuser`
---

## $ptitle

CDLUG
}

#main
args=$@
pdir=_posts
ext=md
initpost
$EDITOR "$pfile"
git status -s $pdir

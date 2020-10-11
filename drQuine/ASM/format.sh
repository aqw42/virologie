#! /bin/sh

cat $1 | sed s/$/$$/g | sed s/\"/%2\$c/g | sed ':a;N;$s/\n/%2\$c/g' 
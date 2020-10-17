#! /bin/sh

dos2unix $1
echo $(sed s/%/%%/g $1 | sed s/\"/%2\$c/g | sed \a\%1\$c | tr -d '\n')

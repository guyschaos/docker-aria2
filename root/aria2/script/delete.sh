#!/bin/bash

downloadpath='/downloads'

filepath=$3
rdp=${filepath#${downloadpath}/}
path=${downloadpath}/${rdp%%/*}
dirpath=${filepath%/*}

echo "Called with num [$2] filepath [$3] rdp [$rdp] path [$path] dirpath [$dirpath]" >> /config/log.txt

if [ $2 -eq 0 ]
    then
        exit 0
elif [ "$path" = "$filepath" ] && [ $2 -eq 1 ]
    then
        [ -e "$filepath".aria2 ] && rm -vf "$filepath".aria2 "$filepath"
        exit 0
elif [ "$path" != "$filepath" ] && [ $2 -gt 1 ]
    then
        [ -e "$dirpath".aria2 ] && rm -vrf "$dirpath".aria2 "$dirpath"
        exit 0
elif [ "$path" != "$filepath" ] && [ $2 -eq 1 ]
    then
        [ -e "$dirpath".aria2 ] && rm -vf "$dirpath".aria2 "$dirpath"
        [ -e "$filepath".aria2 ] && rm -vf "$filepath".aria2 "$filepath"
        exit 0
fi

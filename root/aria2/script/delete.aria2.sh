#!/bin/bash

echo "on-download-complete : [$1],[$2],[$3];"

downloadpath='/downloads'

filepath=$3
rdp=${filepath#${downloadpath}/}
path=${downloadpath}/${rdp%%/*}
dirpath=${filepath%/*}

echo "filepath : [$filepath];"
echo "rdp : [$rdp];"
echo "path : [$path];"
echo "dirpath : [$dirpath];"

if [ $2 -eq 0 ]
    then
        exit 0
elif [ "$path" = "$filepath" ] && [ $2 -eq 1 ]
    then
        [ -e "$filepath".aria2 ] && rm -vf "$filepath".aria2
        echo "move [$filepath] to COMPLETED;"
        mv "$filepath" /downloads/COMPLETED
        exit 0
elif [ "$path" != "$filepath" ] && [ $2 -gt 1 ]
    then
        [ -e "$dirpath".aria2 ] && rm -vf "$dirpath".aria2
        echo "move [$path] to COMPLETED;"
        mv "$path" /downloads/COMPLETED
        exit 0
elif [ "$path" != "$filepath" ] && [ $2 -eq 1 ]
    then
        [ -e "$filepath".aria2 ] && rm -vf "$filepath".aria2
        # torrent task with folder but only 1 file.
        echo "move [$path] to COMPLETED;"
        mv "$path" /downloads/COMPLETED
        exit 0
fi

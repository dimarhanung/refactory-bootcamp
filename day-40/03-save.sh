#!/bin/bash
filename=$1
cat $filename | while read LINE; do
    IFS='/' read -ra SOURCE <<< $LINE
    file=${SOURCE[-1]}
    data=$(curl -s $LINE)
    echo $data > X.json
    echo "${file}.json created"
done
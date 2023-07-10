#!/bin/bash

for dir in ./*_ar.arreferenceimage
do
    for png in "$dir"/*.png
    do
        echo "Converting $png to HEIC..."
        heic=${png%.*}.heic
        heif-convert "$png" "$heic" -q 50
        rm "$png"
        json="$dir/Contents.json"
        jq '.images[0].filename |= sub(".png"; ".heic")' "$json" > temp && mv temp "$json"
    done
done

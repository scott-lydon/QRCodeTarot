#!/bin/bash

# Part 1: Convert all .png files to .heic
find . -name "*.png" -exec sh -c '
  for img do
    convert "$img" -quality 50 "${img%.png}.heic"
    rm "$img"
  done
' sh {} +

# Part 2: Update Contents.json files
find . -name "Contents.json" -exec sh -c '
  for json do
    jq ".images[0].filename |= sub(\".png\"; \".heic\")" "$json" > temp && mv temp "$json"
  done
' sh {} +

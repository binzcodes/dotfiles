#!/bin/bash

while getopts s:i: flag
do
    case "${flag}" in
        s) startPath=${OPTARG};;
        i) ignoreFolder=${OPTARG};;
    esac
done

find $startPath -mindepth 1 -maxdepth 5 -name "$ignoreFolder" -type d -not -regex ".*$ignoreFolder.*$ignoreFolder.*" | while read fname; do
  echo "" > "$fname/.deja-dup-ignore"
  echo "$fname/.deja-dup-ignore created."
done

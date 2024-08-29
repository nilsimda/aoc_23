#!/usr/bin/env bash
#

preprocessed_f=$(cat $1 | sed -E 's/(one|two|three|four|five|six|seven|eight|nine)(.*)/\1#\2/g;s/one#/1ne/;s/two#/2wo/;s/three#/3hree/;s/four#/4our/;s/five#/5ive/;s/six#/6ix/;s/seven#/7even/;s/eight#/8ight/;s/nine#/9ine/;s/#//g')
preprocessed=$(echo "$preprocessed_f" | sed -E 's/(.*)(one|two|three|four|five|six|seven|eight|nine)(.*)/\1\2#\3/;s/one#/1/;s/two#/2/;s/three#/3/;s/four#/4/;s/five#/5/;s/six#/6/;s/seven#/7/;s/eight#/8/;s/nine#/9/;s/#//g')
echo "$preprocessed" | sed -E 's/^[^0-9]*([0-9]).*([0-9])[^0-9]*$/\1\2/g;s/^[^0-9]*([0-9])[^0-9]*$/\1\1/g' | paste -sd+ - | bc

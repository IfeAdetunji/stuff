#!/bin/bash

messages=(
 "hello >:)"
 "i'm watching you lol"
 "be careful"
 "hahahahahahahahahah"
 "i am all seeing"
 "lol"
)

times=(
    "18:09"
    "18:22"
    "18:37"
    "18:56"
    "19:02"
    "19:11"
)

while true
do
    current_time=$(date +%H:%M)
    if [[ "${times[@]}" =~ "${current_time}" ]]; then
        echo "${messages[$RANDOM % ${#messages[@]}]}"
    fi
    sleep 60
done
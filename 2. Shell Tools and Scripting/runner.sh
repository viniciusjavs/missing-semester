#!/usr/bin/env bash

while ./42.sh &>>'runner.out'
do
    (( n_runs+=1 ))
done

echo ${n_runs:-0}

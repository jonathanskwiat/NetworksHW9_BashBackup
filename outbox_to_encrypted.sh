#!/bin/bash
echo $1
outbox=$1
encrypted=$2
publickey=$3
#echo $outbox $encrypted $publickey
cd outbox
for file in *.txt
do
 # do something on "$file"
 cat "$file"
done

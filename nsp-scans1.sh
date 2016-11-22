#!/bin/bash

#grep -irl "ependencies" --include=*.json .

DIR=/Users/guillermocastellon/Projects/vistacore/rdk

find $DIR -name "*.json" -exec grep -lR "ependencies" {} \; > scan_list.txt

while read line; do
   #echo $line
   sed -n '/ependencies": {/,/},/p' $line >> tmpout.txt
   #sed -e 's/ependencies": {\(.*\)},/\1/' $line >> sample.txt
   #sed '1d;$d' test.txt >> all_list.txt
  
done < scan_list.txt

sed -i.bak '/ependencies": {/d' tmpout.txt
sed -i.bak '/}/d' tmpout.txt


#sed -n '/ependencies": {/,/},/p' bower.json > test.tx
#sed '1d;$d' test.txt

sed 's/"$/",/'g tmpout.txt > sample.txt
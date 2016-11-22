#!/bin/bash

#grep -irl "ependencies" --include=*.json .

TOP_DIR=/Users/guillermocastellon/Projects/vistacore/adk
WORK_DIR=/Users/guillermocastellon/Projects/vistacore/adk/product/production
#WORK_DIR=/var/lib/jenkins/jobs/adk-nsp-scans-build-master/workspace/product/production
#TOP_DIR=/var/lib/jenkins/jobs/adk-nsp-scans-build-master/workspace
TMP_DIR=tmp_files


#rm -rf new_package.json*, nodules.txt*, tmpout.txt* sample.txt, scan_list.txt

rm -rf $TMP_DIR

mkdir $TMP_DIR

cd $TMP_DIR

find $WORK_DIR -name "*.json" -exec grep -lR "ependencies" {} \; > scan_list.txt

while read line; do
   #echo $line
   sed -n '/ependencies": {/,/},/p' $line >> tmpout.txt

done < scan_list.txt

sed -i.bak '/ependencies": {/d' tmpout.txt
sed -i.bak '/}/d' tmpout.txt

#sed '1d;$d' test.txt  - delete first and last line
# add a comma to the last "
sed 's/"$/",/'g tmpout.txt > sample.txt 
# remove the last comma to keep correct syntax
sed '$ s/.$//' sample.txt > nodules.txt

#creating the jason template
cat > new_package.json << EOF

{
"name": "$PROJ",
  "title": "Application Development Kit",
  "artifact-name": "$PROJ",
  "dependencies": {
  }
 }
EOF

#inserting all the modules found into one package.json

sed -i .bak '/ependencies": {/r nodules.txt' new_package.json

cp new_package.json package.json

nsp check 2>&1 | tee "$PROJ"_nsp_results.txt
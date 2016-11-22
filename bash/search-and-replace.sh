#!/bin/bash

SEARCH_DIR=/var/lib/jenkins
#TMP_DIR=tmp_files

#rm -rf new_package.json*, nodules.txt*, tmpout.txt* sample.txt, scan_list.txt

#rm -rf $TMP_DIR

#mkdir $TMP_DIR

#cd $TMP_DIR

find $SEARCH_DIR -name "config.xml" -exec grep -lR "vpc_slave_super_security" {} \; > scanned_list.txt

while read line; do
   #echo $line
   sed -i.bak 's/vpc_slave_super_security/master/g'

done < scan_list.txt


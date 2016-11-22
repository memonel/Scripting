#!/bin/bash

export PATH=$PATH:/usr/share/SCA/bin/

sub_projs=( soap-handler asu osync )

for i in "${sub_projs[@]}"
  do
    echo "Starting the $i download"
    rm -rf list.txt
    touch list.txt

   for file in $(curl -s ${NEXUS_URL}/$i/ |
         grep href |
         sed 's/.*href="//' |
         sed 's/".*//' |
         grep '^[a-zA-Z].*'); do

               for file2 in $(curl -s $file |
                          grep 'jar\|war' |
                          grep 1.3.0 |
                          grep -v md5 |
                          grep -v sha1 |
                          grep href |
                          sed 's/.*href="//' |
                          sed 's/".*//' |
                          grep '^[a-zA-Z].*'); do
                             echo "$file2"
                             echo "$file2" >> list.txt
              done
   done

   curl -O $(tail -n 1 list.txt)

done
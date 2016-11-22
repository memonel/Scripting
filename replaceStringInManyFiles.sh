#!/bin/bash

old_version=Sprint_9e_dev
new_version=Sprint_9f_dev
SearchString="grep -rl $old_version /Users/guillermocastellon/Projects/vistacore"
replace_String="xargs sed -i .bk "s/$old_version/$new_version/g""

echo "grep -rl $old_version /Users/guillermocastellon/Projects/vistacore | xargs sed -i .bk 's/$old_version/$new_version/g'"
$SearchString | $replace_String
#grep -rl $old_version /Users/guillermocastellon/Projects/vistacore | xargs sed -i .bk "'s/$old_version/$new_versiong'"

$SearchString | xargs rm -rf

#sub_projs=( adk rdk ehmp-ui ehmp )

#for i in "${sub_projs[@]}"
# do
#       cd ~/Projects/vistacore/$i
#       git pull
#       echo $i 
#       git commit -a -m"upgrading version"
#       git push
#       #grep -rl Sprint_9e_dev ~/Projects/vistacore | xargs git commit -a -m"upgrading version"
#  done


#https://fortify.vistacore.us/ssc
#http://fortify.vistacore.us:8080/ssc


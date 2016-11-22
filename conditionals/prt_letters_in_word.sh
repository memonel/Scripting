#!/bin/bash

paragraph=(letter word sentence)

for item in ${paragraph[@]}
do
	echo $item

done

##############################################

# num_array=(1 2 3 4 5 6 7 8 9 10)

# for i in ${num_array[@]}
# do
# 	echo $i
# 	if [$i eq 5 ] then
# 		echo "we are half way to 10"
# 	fi

# done

################################################

# for i in {1..10}
# do
#    echo "$i"
#    if $i eq 5 do echo "we are halfway to 10" done
# done


#################################################
#
#  1 way
#
#################################################

start_range=20
end_range=100

#use let to oerate on two variables
let total_range=$end_range-$start_range

#another way to add operate on variables
midway=$((total_range/2))
 
#echo $total_range
#echo $midway

for (( i=$start_range; i<=$end_range; i=i+1 ))
do
	echo -n "$i "
	if [ $i = $((midway+start_range)) ]
	then	
	  echo "We are have way to " $total_range
	fi
done

echo " "

#################################################
#
#  Another way - It only works on BASH 4.X
#
#################################################

#this is for 4.X bash or higher
#for i in {2..15..3}

#this is for < 4.x 
# for i in $(seq 1 2 20)

#   do
#   	echo "$i "
#   done


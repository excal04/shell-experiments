#!/bin/bash

# arrsort.sh: sort array in bash example

read -p "Enter numbers separated with space: " -a nums

echo "array: ${nums[@]}"
echo -n "sorted array (ascending): "
# nums_asc=$(echo ${nums[@]} | tr ' ' '\n' | sort)
nums_asc=($(for i in "${nums[@]}"; do echo $i; done | sort))		# sorts by string val
echo "${nums_asc[@]}"

# now using selection sort, sort in decreasing order
# note: this method uses the numerical value of array elements which is correct
for (( i = 0; i < ${#nums[@]}; i++ )); do
	max=$i
	for (( j = i + 1; j < ${#nums[@]}; j++ )); do
		if (( nums[j] > nums[max] )); then
			max=$j
		fi
	done

	# swap the 2
	temp=${nums[i]}
	nums[i]=${nums[max]}
	nums[max]=$temp

done

echo "sorted array (descending): ${nums[@]}"

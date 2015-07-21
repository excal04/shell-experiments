#!/bin/bash

# longest_str2: gets the longest string in file
# usage: longest_str [<file>...]

for param; do
if [[ -r $param ]]; then
	maxstr=
	maxlen=0
	for i in $(strings $param); do
		if (( ${#i} > maxlen )); then
			maxlen=${#i}
			maxstr=$i
		fi
		# echo "i = $i"
	done
	echo "$param: '$maxstr' ($maxlen characters)"
fi
done

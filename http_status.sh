#!/bin/bash

n=1

while getopts ":status:append:help:" opt; do
	case $opt in
		status|s)
			#turn into function for reusability with checking for specific status only
			while read line; do
				echo "#####################################"
				echo "#"
				echo "#  URL: " $line
				echo "# " $(curl -s -I $line | grep 'HTTP')
				echo "#"
				echo "#####################################"
				echo ""
				sleep 1
			done < $OPTARG
			exit 1
			;;
		append|a)
			#adds https:// to the begin of each line
			sed -i -e 's;^;https://;' $OPTARG
			exit 1
			;;
		help|h)
			echo "		-s [filename]"
			echo "		   Checks HTTP Status for each URL in a text file."
			echo ""
			echo "		-a [filename]"
			echo "		   Appends https:// to the beginning of each line in a text file."
			exit 1
			;;
	esac
done

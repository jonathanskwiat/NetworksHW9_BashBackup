#!/bin/bash

startingDirectory=`pwd`
encrypted=$1
trash=$2
email_list=$3


function mail_it () {
	# mutt -a option attaches file as MIME attachment
	mapfile -t addr < "${email_list}"
	for i in "${addr[@]}"
	do
		mutt -s "Test mail" -a "${filename}"  "${i}" < "Message Body."
		echo $i
	done
}
function check_encrypted() {
	cd $encrypted
	filenameFlag="*.comp"
	for file in *
	do
	if [[ $file == $filenameFlag ]]
	then
         	#echo "Matches!" $file
         	filename=${file%.*}
         	#echo $filename
         	mail_it $filename
		rm "${file}"
		mv "${filename}" "${trash}"
	fi
	done

}
function clean_trash() {
	cd $trash
	# Declare variables as integers
	declare -i since_in_sec
	declare -i month_in_sec
	month_in_sec=2628288
	#For testing
	#month_in_sec=2

	for file in *
	do
		file_creation=`date -r "$file" +%s`;
		time_now=`date +%s`;
		since_in_sec="$[ ${time_now} - ${file_creation}]";
		echo "The time in seconds since ${file} creation is ${since_in_sec}";
		
		if [ "$since_in_sec" -ge "$month_in_sec" ]
		then
			echo "The file is older than a month and is being erased"
			# rm "${file}"
		else
			echo "The file is younger than a monthi and is staying in trash."
		fi
	done
}
check_encrypted
cd $startingDirectory
clean_trash



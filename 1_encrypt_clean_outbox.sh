#!/bin/bash

startingDirectory=`pwd`
publicKey=${startingDirectory}/public_key.asc
echo $startingDirectory

filenameFlag="*.comp"

function copyEncrypt () {
	newFileName=../encrypted/${filename}
	gpg --encrypt --recipient-file "${publicKey}" --output "${newFileName}" "${filename}"
	if [ -s "${newFileName}" ]
	then
		echo "${newFileName} file has some data."
		echo "Placing ${file} flag of completion"
	        cp $file ../encrypted
		echo "Removing file and flag from outbox COMMENTED OUT FOR testing!"
		#rm "${filename}"
		#rm "${file}"

	else
		echo "Encrypted file is empty"
	fi
}

function file-age {
        file_creation=`date -r "$file" +%s`;
        time_now=`date +%s`;

        since_in_sec="$[ ${time_now} - ${file_creation}]";
        echo "The time in seconds since ${file} creation is ${since_in_sec}";
	if [ "$since_in_sec" -ge "$month_in_sec" ]
	then
        	echo "The file is older than a month and is being erased"
	else
        	echo "The file is younger than a month"
	fi

}

# Script Starts
# Harcoded it. Didn't do outbox=$1 etc.
cd outbox
for file in *
do
if [[ $file == $filenameFlag ]] 
then 
	 echo "Matches!" $file 
	 filename=${file%.*}
	 echo $filename
	 copyEncrypt $filename
else 
	 echo "Doesn't match!"
fi
done

# Declare variables as integers
declare -i since_in_sec
declare -i month_in_sec
month_in_sec=2628288
#For testing
#month_in_sec=2

cd ../eraseOutbox
pwd


for file in *
do
if [[ ! $file == $filenameFlag ]] 
then 
	 echo "Found not flag file:  ${file} "
	 file-age $file
else 
	 echo "Found flag file ${file}. Not erasing!"
fi
done


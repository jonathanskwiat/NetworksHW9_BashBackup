#!/bin/bash
startingDirectory=`pwd`
publicKey=${startingDirectory}/public_key.asc
echo $startingDirectory
filenameFlag="*.comp"
function copyEncrypt () {
	newFileName=../encrypted/${filename}.enc
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
# eraseOldFilesOutbox
cd $startingDirectory

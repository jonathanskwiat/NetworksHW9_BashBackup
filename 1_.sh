#!/bin/bash
startingDirectory=`pwd`
publicKey=${startingDirectory}/public_key.asc
echo $startingDirectory
filenameFlag="*.comp"
function copyEncrypt () {
	# encryptExt=".enc"
	# newFileName="$filename$encryptExt"
	newFileName=../encrypted/${filename}.enc
	gpg --encrypt --recipient-file "${publicKey}" --output "${newFileName}" "${filename}"
	if [ -s "${newFileName}" ]
	then
		echo "${newFileName} file has some data."
		echo "Placing ${file} flag of completion"
	        cp $file ../encrypted
		echo "Removing file and flag from outbox commented out for testing!"
		#rm "${filename}"
		#rm "${file}"

	else
		echo "Encrypted file is empty"
	fi
}
	

#echo $outbox $encrypted $publickey
cd outbox
for file in *
do
if [[ $file == $filenameFlag ]]; then 
	 echo "Matches!" $file 
	 filename=${file%.*}
	 echo $filename
	 copyEncrypt
 else 
	 echo "Doesn't match!"
fi
done
cd $startingDirectory

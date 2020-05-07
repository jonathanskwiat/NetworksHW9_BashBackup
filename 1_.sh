#!/bin/bash
startingDirectory=`pwd`
publickey=my_secret
echo $startingDirectory
filenameFlag="*.comp"
function copyEncrypt () {
	#cd "${startingDirectory}"
	encryptExt=".enc"
	newFileName="$filename$encryptExt"
	gpg --encrypt --recipient 'jonathanskwiat@gmail.com' --output "../encrypted/${newFileName}" "${filename}"
	cp $file ../encrypted
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

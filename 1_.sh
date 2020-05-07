#!/bin/bash
startingDirectory=`pwd`
echo $startingDirectory
filenameFlag="*.comp"
function copyEncrypt () {
	#cd "${startingDirectory}"
	pwd
	cp $filename ../encrypted
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

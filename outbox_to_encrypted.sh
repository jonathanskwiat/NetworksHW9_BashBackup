#!/bin/bash
echo $1
outbox=$1
encrypted=$2
publickey=$3
filenameFlag="*.comp"
#echo $outbox $encrypted $publickey
cd outbox
function copy_encrypt() {
	echo $1
}
for file in *
do
if [[ $file == $filenameFlag ]]; then 
	 echo "Matches!" $file 
	 filename=${file%.*}
	 echo $filename
	 copy_encrypt () $file $filename
 else 
	 echo "Doesn't match!"
fi
}
 #cat "$file"
done
greeting () {
  echo "Hello $1"
}

greeting "Joe"

#!/bin/bash
declare -i SINCE_IN_SEC
declare -i MONTH_IN_SEC
MONTH_IN_SEC=2628288
#MONTH_IN_SEC=2
#too_old=1
function file-age {
        FILE_CREATED_TIME=`date -r "$1" +%s`
	echo $FILE_CREATED_TIME
        TIME_NOW=`date +%s`
	echo $TIME_NOW
        echo "$[ ${TIME_NOW} - ${FILE_CREATED_TIME} ]"
}
function file-age2 {
        FILE_CREATED_TIME=`date -r "$1" +%s`;
        TIME_NOW=`date +%s`;
 
        SINCE_IN_SEC="$[ ${TIME_NOW} - ${FILE_CREATED_TIME}]";
	echo $SINCE_IN_SEC;
        echo "$[ ${TIME_NOW} - ${FILE_CREATED_TIME} ]";
}

file-age2 $1
if [ "$SINCE_IN_SEC" -ge "$MONTH_IN_SEC" ]
then
	echo " greater then or equal"
else
	echo "less than"	
fi


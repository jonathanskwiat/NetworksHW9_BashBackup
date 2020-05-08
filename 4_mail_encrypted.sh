#!/bin/bash

encrypted=$1
trash=$2
email_list=$3
email_body=$4

mapfile -t addr < "${email_list}"

function mail_it () {
	for i in "${addr[@]}"
	do
		mutt -s "Test mail" -a "${filename}"  "${i}" < "${email_body}"
		echo $i
	done
}

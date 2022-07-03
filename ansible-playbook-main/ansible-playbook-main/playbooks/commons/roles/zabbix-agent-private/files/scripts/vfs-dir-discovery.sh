/usr/bin/find $1 -type d | \
	/usr/bin/awk \
	'BEGIN {first=1; printf "%s","{\n\t\"data\":[\n"} {if (first != 1) printf "%s",",\n"; first=0; printf "\t\t{\"{#FOLDER_NAME}\":\"%s\"}",$$1} END {print "\n\t]\n}\n"}'


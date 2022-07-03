/usr/bin/find $1 -type f |grep -v .swap | \
	/usr/bin/awk \
	'BEGIN {first=1; printf "%s","{\n\t\"data\":[\n"} {if (first != 1) printf "%s",",\n"; first=0; printf "\t\t{\"{#FILE_NAME}\":\"%s\"}",$$1} END {print "\n\t]\n}\n"}'



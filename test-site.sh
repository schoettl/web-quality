#!/bin/bash
# test-site.sh site [ protocol [ alias ] ]
#

USAGE="test-site.sh site [ protocol [ alias ] ]"
_HOME="$(pwd)"

if [ $# == 0 ]; then
	echo $USAGE
	exit 1
fi

SITE="$1"

if [ $# -ge 2 ]; then
	PROTOCOL="$2"
else
	PROTOCOL=http
fi

if [ $# -ge 3 ]; then
	ALIAS="$3"
else
	ALIAS="$SITE"
fi

SITE_ROOT="$PROTOCOL://$SITE"

# Test files locally
if
	cd "gitreps/$ALIAS" && git pull --ff-only
then
	
	# do tests with files, e.g.
	#find . -name '*.html' , -name '*.htm' -exec ... \;

	cd "$_HOME"
fi

# Test site online
while read URL; do
	checklink "$SITE_ROOT$URL"
	#wget -Ounicorn-result.html "http://localhost:8080/unicorn/check?ucn_task=conformance&ucn_uri=$SITE_ROOT$URL"
	firefox "http://localhost:8080/unicorn/check?ucn_task=conformance&ucn_uri=$SITE_ROOT$URL" &
done < "sites/$ALIAS"

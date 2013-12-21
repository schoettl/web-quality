#!/bin/bash
# test-all-sites.sh
# Test all sites listed in sites/sites.txt using test-site.sh
#

while read SITE PROTOCOL ALIAS; do
	./test-site.sh "$SITE" "$PROTOCOL" "$ALIAS"
done < sites/sites.txt

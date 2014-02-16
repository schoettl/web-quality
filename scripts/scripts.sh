# Find URLs of a site
find . -mindepth 1 -maxdepth 2 -name index.html | sed 's/^\.//' | sed 's/index\.html//'

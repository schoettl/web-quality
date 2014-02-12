Web Quality Assurance
=====================

This is a tool for quality assurance of web sites.

Description
-----------

The scripts must be started with `./script.sh`, i.e. from it's directory.

If you want to test just one site, use `test-site.sh`.  For usage see the script.

If you want to test more than one site, use `test-all-sites.sh`.  The sites to test are listed in `sites/sites.txt`.  Each line has three space-separated columns: site, protocol, alias.  The site is the host part of a URL, optinally folled by the path to the site.  There must not be a trailing slash.  Example: `example.com` or `example.com/myapp`.  The protocol is `http` or `https`.  The alias is a alias for the site, used internally.  It must be a valid filename.

For some tests, the online version of the site is consulted.  This tool assumes a file in `sites/` which name is the site's alias.  The file contains all paths to test, each in one line.  The paths are absolute and start at site level, with a leading slash, e.g. `/` or `/about/`.

For other tests, the files of the site may be required offline.  This tool assumes a git repository in `gitreps/` which name is the site's alias.

Dependencies
------------

* W3C Unicorn (stand-alone version of <http://validator.w3.org/unicorn/>)
* W3C Link Checker (offline version of <http://validator.w3.org/checklink>)
* W3C Markup Validation Service (offline version of <http://validator.w3.org/>) -- really needed?

`sudo apt-get -y install w3c-linkchecker w3c-markup-validator`

For W3C Unicorn, follow the instructions under:
http://code.w3.org/unicorn/wiki/Documentation/Install

Also, git, mercurial, tomcat, ant and ivy are needed:

    sudo apt-get -y install git mercurial tomcat7 ant

Download or build Ivy as described here:
http://ant.apache.org/ivy/download.cgi
Then copy the JAR to `/usr/share/ant/lib` or `~/.ant/lib` (?)

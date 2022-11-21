#!/bin/bash
echo 'https://www.liquidweb.com/kb/troubleshooting-too-many-redirects/'
for domain in $@; do
echo --------------------
echo $domain
echo --------------------
curl -sILk $domain | egrep 'HTTP|Loc' | sed 's/Loc/ -> Loc/g'
echo
done

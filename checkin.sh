#!/bin/sh
username=rashmiagar
#read -p "Password please: " -s pass
git add .
git commit -m "implemented feedback functionality and fixed issues in report"
git push -u origin master
git status -s

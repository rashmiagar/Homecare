#!/bin/sh
username=rashmiagar
#read -p "Password please: " -s pass
git add .
git commit -m "bug fixing, and implement lightbox for login"
git push -u origin master
git status -s

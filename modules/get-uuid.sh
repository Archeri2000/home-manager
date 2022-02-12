#!/bin/sh

file="$HOME"/.uuid

if [ -e $file ]; then
	cat $file
else
	touch $file
	uuidgen >$file
	cat $file
fi

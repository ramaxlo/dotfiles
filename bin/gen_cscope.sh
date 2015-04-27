#!/bin/sh

find . -name "*.[ch]" -print -o -name "*.cpp" -print -o -name "*.cc" -print > cscope.files
cscope -b -q
cscope -d

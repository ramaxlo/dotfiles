#!/bin/sh

find . -name "*.[ch]" -print -o -name "*.cpp" -print -o -name "*.cc" -print > gtags.files
gtags -f gtags.files
gtags-cscope -d

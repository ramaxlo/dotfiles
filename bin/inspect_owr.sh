#!/bin/sh

gst-inspect-1.0 --gst-plugin-path=~/cerbero/dist/linux_x86_64/lib/gstreamer-1.0 $* | less

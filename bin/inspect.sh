#!/bin/sh

gst-inspect-1.0 --gst-plugin-path=/usr/lib/x86_64-linux-gnu/gstreamer-1.0 $* | less

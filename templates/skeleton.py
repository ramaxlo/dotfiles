#!/usr/bin/env python3

import os, sys
import argparse

def checkargs(args):
    return True

if __name__ == '__main__':

    desc = 'The sample program'
    p = argparse.ArgumentParser(description=desc)
    p.add_argument('--arg1', help='The sample option')
    p.add_argument('pos', help='The positional argument')
    args = p.parse_args()

    if not checkargs(args):
        sys.exit(1)

#!/usr/bin/env python3

import os, sys
import subprocess
import argparse

# Add your own WireGuard VPN settings.
vpns = {
    'us': '',
    'jp': '',
}

def do_op(op, region):
    if not region:
        print('No config for the region', file=sys.stderr)
        return False

    cmd = 'sudo wg-quick %s %s' % (op, region)

    try:
        subprocess.check_call(cmd, shell=True)
    except subprocess.CalledProcessError as e:
        print('Fail to run: %s' % str(e))
        return False

    return True

if __name__ == '__main__':
    desc = 'Script to automate VPN connection'
    p = argparse.ArgumentParser(description=desc)
    p.add_argument('region', help='VPN region', choices=['us', 'jp'])
    p.add_argument('operation', help='Operation of VPN', choices=['up', 'down'])
    args = p.parse_args()

    if not do_op(args.operation, vpns[args.region]):
        sys.exit(1)

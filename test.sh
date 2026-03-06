#!/usr/bin/env bash
# check_snap.sh

if grep -q 'snap' ./*.txt 2>/dev/null; then
  exit 1    # found at least one matching line
else
  exit 0    # no matches in any *.txt file
fi
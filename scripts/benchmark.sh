#!/bin/bash

set -e

command=".build/release/advent"
if [ $# -ne 0 ]; then
  command="$command $*"
fi

hyperfine \
  --setup "swift build -c release" \
  --warmup 5 \
  "$command"

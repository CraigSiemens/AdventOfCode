#!/bin/bash

set -e

hyperfine \
  --setup "swift build -c release" \
  --warmup 5 \
  ".build/release/advent \"$*\""

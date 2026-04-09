#!/bin/sh
set -e

TF_BIN_PATH="$1"

[ -z "$TF_BIN_PATH" ] && { echo "Usage: $0 <tf-bin-path>" >&2; exit 1; }
#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

cd "$HOME"
./post-init.sh

exec "$@"

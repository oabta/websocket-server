#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail


cd /var/www/html

declare -a start_flags=("artisan" "reverb:start")
start_flags+=("$@")

echo "** Starting Reverb websocket server **"
php "${start_flags[@]}"

#!/bin/bash

set -o errexit
set -o nounset

cd /var/www/html
echo "** Running laravel migrations **"
yes Y | php artisan migrate --force | xargs echo 2>&1
echo "** laravel migrations completed **"
cd -

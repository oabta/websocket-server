#!/bin/bash

set -o errexit
set -o nounset

cd /var/www/html
echo "** Running laravel migrations **"
yes Y | php artisan migrate --force
echo "** laravel migrations completed **"
cd -

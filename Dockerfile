FROM php:8.3-cli

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libpq-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_pgsql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create oabta system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -d /home/oabta oabta
RUN mkdir -p /home/oabta/.composer && \
    chown -R oabta:oabta /home/oabta

COPY .  /var/www/html
RUN mv /var/www/html/docker/* /home/oabta/
RUN chmod 755 -R /home/oabta/
RUN cd /var/www/html && composer install

EXPOSE 8080
# Set working directory
WORKDIR /var/www/html

USER oabta

ENTRYPOINT [ "/home/oabta/entrypoint.sh" ]
CMD [ "/home/oabta/run.sh" ]

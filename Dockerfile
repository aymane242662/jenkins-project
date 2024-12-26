# Étape 1 : Image de base
FROM php:8.2-apache

# Étape 2 : Installation des dépendances PHP
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    && docker-php-ext-install zip pdo pdo_mysql

# Étape 3 : Copier les fichiers de l'application
COPY . /var/www/html/

# Étape 4 : Configurer les permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Étape 5 : Configurer Apache
EXPOSE 80

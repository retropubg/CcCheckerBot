FROM php:7.4-apache

# Instalar extensiones necesarias
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Copiar archivos del proyecto al contenedor
COPY . /var/www/html/

# Configurar permisos
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Exponer el puerto 80
EXPOSE 80

# Comando para ejecutar Apache
CMD ["apache2-foreground"]

# Archivo Procfile
RUN echo "web: apache2-foreground" > /Procfile

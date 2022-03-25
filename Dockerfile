#Obtemos la imagen de php en la version 8.1.1 con apache.
FROM php:8.0.2-apache

#actualizamos e instalamos la imagen de php en la version 8.1.1 con apache.
#y lo ejectuamos con -y para que los paquetes de instalacion que soliciten una confirmacion de ejecucion, lo omitan
#Lo demás es para instalar las extensiones de comunicacion con docker,php y mysql
RUN apt-get update && apt-get install -y \
&& docker-php-ext-install mysqli pdo pdo_mysql 

#instalamos composer (Composer es un sistema de gestión de paquetes para programar en PHP el cual provee los formatos estándar necesarios para manejar dependencias y librerías de PHP)
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#dar permisos especiales de escritura para que nos pueda redirigir a la ruta que le indicamos en en el archivo docker-compose.yml
RUN a2enmod rewrite

#le damos permisos a la carpeta www, lavarel necesita crear unos archivo log para almacenar datos o imagenes y evitar errores de permisos
RUN chmod 777 -R -c /var/www
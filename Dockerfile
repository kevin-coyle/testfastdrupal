FROM drupal:8
ADD ./run.sh /run.sh


# Drush installation
RUN apt-get update -y
RUN apt-get install wget -y
RUN wget http://files.drush.org/drush-unstable.phar
RUN chmod +x drush-unstable.phar
RUN mv drush-unstable.phar /usr/local/bin/drush

# Composer
RUN wget https://getcomposer.org/composer.phar
RUN chmod +x composer.phar
RUN mv composer.phar /usr/local/bin/composer
# Drupal Console
RUN curl https://drupalconsole.com/installer -L -o drupal.phar
RUN mv drupal.phar /usr/local/bin/drupal
RUN chmod +x /usr/local/bin/drupal
RUN apt-get install mysql-client -y
ADD ./app/html/modules /var/www/html/modules
ADD ./app/html/themes /var/www/html/themes
ADD ./settings/settings.php /var/www/html/sites/default/settings.php
CMD ["/run.sh"]

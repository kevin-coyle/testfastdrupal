#!/bin/bash
if [[ $environment == "local" ]]; then
  cp -R /var/www/html /app
fi


apache2-foreground

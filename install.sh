#mettre à jour le système et installer les dépendances

sudo apt update && sudo apt install -y php php-cli php-mbstring php-xml php-zip unzip curl
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Créer un projet API Symfony
composer create-project symfony/skeleton form_api
cd form_api
composer require symfony/orm-pack symfony/maker-bundle symfony/security-bundle symfony/validator

# Installer Symfony CLI
curl -sS https://get.symfony.com/cli/installer | bash
sudo mv ~/.symfony*/bin/symfony /usr/local/bin/symfony

# Lancer le serveur de développement Symfony
symfony server:start
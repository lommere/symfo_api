#mettre à jour le système et installer les dépendances

sudo apt update && sudo apt install -y php php-cli php-mbstring php-xml php-zip unzip curl mariadb-server php-mysql
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Créer un projet API Symfony
composer create-project symfony/skeleton form_api
cd form_api
composer require symfony/orm-pack symfony/maker-bundle symfony/security-bundle symfony/validator

# Configurer MariaDB
sudo mysql -u root -e "CREATE DATABASE app;"
sudo mysql -u root -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON app.* TO 'admin'@'localhost';"
sudo mysql -u root -e "FLUSH PRIVILEGES;"




# Installer Symfony CLI
curl -sS https://get.symfony.com/cli/installer | bash
sudo mv ~/.symfony*/bin/symfony /usr/local/bin/symfony

# modifier le fichier .env pour se connecter à la base de données
sed -i 's|DATABASE_URL=.*|DATABASE_URL="mysql://admin:admin@127.0.0.1:3306/app?serverVersion=mariadb-10.5.9&charset=utf8mb4"|' .env


# Lancer le serveur de développement Symfony
symfony server:start

# Installer le MakerBundle
composer require symfony/maker-bundle --dev

# Créer une entité Person
php bin/console make:entity Person


# Créer une migration
php bin/console make:migration

# Exécuter la migration pour créer le schéma de la base de données
php bin/console doctrine:migrations:migrate --no-interaction

#mettre à parser
composer require phpstan/phpdoc-parser:^1.10
composer update api-platform/core --with-dependencies



# Installer API Platform
composer require api

# Configurer l'entité Person comme ressource API , modifier , ajouter les annotations suivantes
#use ApiPlatform\Metadata\ApiResource;
#use Doctrine\ORM\Mapping as ORM;
#[ORM\Entity]
#[ApiResource]

#modifier les opérations de l'API
# #[ApiResource(
#     operations: [
#         new \ApiPlatform\Metadata\GetCollection(
#             uriTemplate: '/voir_gendarmes',
#             name: 'get_person_list'
#         ),
#         new \ApiPlatform\Metadata\Post(
#             uriTemplate: '/ajouter_gendarmes',
#             name: 'create_person'
#         ),
#         new \ApiPlatform\Metadata\Get(
#             uriTemplate: '/selection_gendarme/{id}',
#             name: 'get_person'
#         ),
#         new \ApiPlatform\Metadata\Delete(
#             uriTemplate: '/supprimer_gendarme/{id}',
#             name: 'delete_person'
#         )
#     ]
# )]



#pour tester l'API faire un serveur web et creer un fichier un formulaire html en methode post pour ajouter un gendarme
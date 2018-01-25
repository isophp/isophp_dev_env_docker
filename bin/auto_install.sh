# install docker and docker-composer
# composer install
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

git clone https://github.com/isophp/isophp.git application

mkdir -p  ./docker/node_app/application/ManagerPlatform/
cp application/ManagerPlatform/package.json ./docker/node_app/application/ManagerPlatform/

mkdir -p  ./docker/app/application/
cp application/composer.json ./docker/app/application/

sudo docker-composer build app && sudo docker-composer build node_app
sudo docker-composer up app && sudo docker-composer up node_app
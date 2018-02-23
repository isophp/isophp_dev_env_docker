git clone https://github.com/isophp/isophp.git application

mkdir -p  ./docker/node_app/application/ManagerPlatform/
cp application/ManagerPlatform/package.json ./docker/node_app/application/ManagerPlatform/

mkdir -p  ./docker/app/application/
cp application/composer.json ./docker/app/application/

cp variables.env.example variables.env

echo '127.0.0.1 devel.isophp.cn' |sudo tee -a /etc/hosts

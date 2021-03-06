#!/usr/bin/env bash

# Add the code to Vagrantfile
# config.vm.provision :shell, path: "bootstrap.sh"

# change source mirror
cd /etc/apt/
mv sources.list sources.list.bak
bash -c "cat /vagrant/sources.list.mirror sources.list.bak > sources.list"

# apt-get update and upgrade
apt-get update -y
apt-get upgrade -y

# hostname
echo 'vagrant' > /etc/hostname
hostname -F /etc/hostname

# install build tools
apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev python-dev libffi-dev libcurl4-openssl-dev

# install git, redis-server, mysql-server
apt-get install -y git redis-server libmysqlclient-dev mysql-server 

# install postgresql, nginx
# apt-get install -y postgresql-server nginx

# install pyenv
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
echo 'export PATH="/home/vagrant/.pyenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
source ~/.bash_profileifconfig

# use China pip source
mkdir ~/.pip
bash -c "cat /vagrant/pip.conf > ~/.pip/pip.conf"

# install python, use qiuniu CDN moirrors, Very Fast in China!!!
export PYTHON_BUILD_MIRROR_URL="http://pyenv.qiniudn.com/pythons/" 
pyenv install 3.5.0

# make develop folder, use Python 2.7.10, named '~/www', and Actived
cd ~
pyenv virtualenv 3.5.0 www
pyenv activate www

# install python requirements
cat > ~/requirements << __EOF__
redis
mysql-python
tornado
wtforms
pynsq
__EOF__
pip install -r ~/requirements

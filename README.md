# Vagrantfile

方便使用，居家旅行，开发测试环境必备的初始化文件！

本配置文件采用官方的 box 镜像 `ubuntu/trusty64`，使用前先运行 `vagrant box add ubuntu/trusty64` 进行添加。

由于中国大陆的 `vagrant box` 源下载速度极慢，所以可以考虑使用清华 TUNA 源代替

```
#
# ubuntu 14.04 LTS/amd64
# Vagrantfile 对应 config.vm.box = "ubuntu/trusty64"
#
vagrant init ubuntu/trusty64
vagrant box add https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box --name ubuntu/trusty64
vagrant up

#
# ubuntu 16.04 LTS/amd64
# Vagrantfile 对应 config.vm.box = "ubuntu/xenial64"
#
vagrant init ubuntu/xenial64
vagrant box add https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/xenial/current/xenial-server-cloudimg-amd64-vagrant.box --name ubuntu/xenial64
vagrant up

#
# ubuntu 18.04 LTS/amd64
# Vagrantfile 对应 config.vm.box = "ubuntu/bionic"
#
vagrant init ubuntu/bionic
vagrant box add https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/bionic/current/bionic-server-cloudimg-amd64-vagrant.box 
--name ubuntu/bionic
vagrant up
```

## 文件说明：

* `Vagrantfile`：Vagrant 的配置文件
* `bootstrap.sh`：镜像初始化后自动运行的脚本，顺带说明，此脚本只会在第一次运行`vagrant up`的时候运行，之后不会自动运行！
* `sources.list.mirror`：Ubuntu APT 源镜像服务器，此处使用阿里云的镜像服务器在中国大陆内进行加速
* `pip.conf`：Python PyPI 源镜像服务器，此处使用豆瓣的镜像服务器在中国大陆内进行加速

环境版本：`Vagrant 2.7.*`， `VirtualBox 6.0.*`

## `bootstrap.sh` 文件说明：

需要单独说明一下 `bootstrap.sh`这个文件的内容，内容分为几个部分，大体上是
1. 系统设置，如设置 APT 源镜像服务器等，`resolvconf`等
2. 安装包设置，这个根据自己需要定制，通常我需要安装 `mysql-server`，`redis-server` 等
3. 开发环境设置，这个同样需要根据自己定制，我主要用`python`，所以本初始化文件里，自动安装好 `pyenv`供你使用，这里的`PyPI`源使用阿里云的源，更新速度快，如果想自己定制，可以参考 `https://www.pypi-mirrors.org/` 来选择自己需要的PyPI 源
4. 个人设置，这里是纯粹个人的设置，怎么需要，怎么喜欢，自己来

## 备注

这是我个人使用的 `vagrantfile`，自己方便着想，如果需要可以自行定制使用。谢谢！

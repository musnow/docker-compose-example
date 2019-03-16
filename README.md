# docker-compose-example

这是一个使用 docker-compose 的示例，我们可以用他扩展想要的服务流程

# 如何使用

首先我们需要先安装 docker，docker 现在已经将产品分为 ce 和 ee 两个版本，我们这边选择安装 ce 即可。

我这里使用 centos 7 进行示例，如果你使用别的发行版本请参考官方文档

1.系统更新

```
yum update -y
```

2.安装 docker
Docker 官方提供了一个存储库。我们可以使用他进行安装

```
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce
```

现在可以启动 docker

```
systemctl start docker
```

我们可以测试一下 docker 是否可用

```
docker run hello-world
```

然后就可以设置成开机启动了

```
systemctl enable docker

```

3.安装 Docker-compose

```
curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

4.启动

```
git clone https://github.com/musnow/docker-compose-example.git
cd docker-compose-example
./start.sh
```

# 参考文章

https://docs.docker.com/compose/
https://github.com/docker/compose/releases/
https://www.vultr.com/docs/deploy-a-php-application-using-docker-compose

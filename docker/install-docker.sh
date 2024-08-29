#!/bin/bash

# 第一步：设定安装镜像
echo "设定安装镜像源为清华大学镜像..."
export DOWNLOAD_URL="https://mirrors.tuna.tsinghua.edu.cn/docker-ce"

# 第二步：脚本一键安装
echo "开始一键安装 Docker..."
wget -O- https://gitee.com/tech-shrimp/docker_installer/releases/download/latest/linux.sh | sudo -E sh

# 第三步：更改 Docker 镜像源
echo "更改 Docker 镜像源..."
sudo tee /etc/docker/daemon.json > /dev/null <<EOF
{
  "registry-mirrors": ["https://docker.cau-ghr.tech"]
}
EOF

# 第四步：重启 Docker 服务
echo "重启 Docker 服务..."
sudo systemctl restart docker

echo "Docker 安装和配置完成！"
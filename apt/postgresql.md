**1:下载验证完整性的`密钥`**
```
curl -fsSL https://mirrors.tuna.tsinghua.edu.cn/postgresql/repos/apt/ACCC4CF8.asc |
sudo tee /etc/apt/trusted.gpg.d/postgresql.asc > /dev/null
```

**2.导入清华大学`Postgresql APT`镜像源**
```
sudo sh -c '
  echo "deb https://mirrors.tuna.tsinghua.edu.cn/postgresql/repos/apt/ \
  $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/postgresql.list
'
```

**3.更新源并安装**
```
sudo apt update
sudo apt install postgresql-17
```

**4.启动**
```
sudo systemctl start postgresql
# 验证
sudo systemctl status postgresql
```

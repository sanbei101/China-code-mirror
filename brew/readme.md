### 设置安装的镜像源
```bash
# -U 的意思是全局变量,重启依然生效
# -x 是让所有程序都可以访问到变量,相当于环境变量
set -Ux HOMEBREW_API_DOMAIN https://mirrors.ustc.edu.cn/homebrew-bottles/api
set -Ux HOMEBREW_BOTTLE_DOMAIN https://mirrors.ustc.edu.cn/homebrew-bottles
```

### 创建`brew`专用用户(`brew`不允许使用`root`用户安装)
```bash
# 创建一个名为 brew 的新用户
# -m 选项：创建用户的同时为其创建主目录
# -s /usr/bin/fish 选项：将用户的默认 shell 设置为 Fish shell
sudo useradd -m -s /usr/bin/fish brew

# 为用户 brew 设置密码
# echo "brew:brew" 输出用户名和密码，格式为 "用户名:密码"
# chpasswd 命令会从标准输入读取用户名和密码，然后更新用户的密码
echo "brew:brew" | sudo chpasswd

# 将用户 brew 添加到 sudo 用户组
# -a 选项：表示追加，即不覆盖用户原有的用户组信息
# -G sudo 选项：将用户添加到 sudo 用户组，这样该用户就可以使用 sudo 命令获取管理员权限
sudo usermod -aG sudo brew
```

### 运行中科大镜像安装脚本
```bash
/bin/bash -c "$(curl -fsSL https://mirrors.ustc.edu.cn/misc/brew-install.sh)"
```

### 将`brew`添加到`fish`路径中
```bash
# HOMEBREW_PREFIX 是 Homebrew 的根目录
set -Ux HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew";
# 每个软件包会以其名称和版本号为子目录存放在该目录下
set -Ux HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar";
# 存储了 Homebrew 的核心逻辑,包含实现软件包安装更新,依赖管理等功能的代码
set -Ux HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew";
# -U 对所有用户生效
# -m 若指定的路径已经存在于 PATH 中,会将其移动到 PATH 列表的前面,确保这些目录中的可执行文件具有更高的执行优先级
fish_add_path -Um "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin";
```

## 使用 Git 克隆 Github 仓库时的网络问题解决方案

当使用 `Git` 来克隆 `Github` 上的仓库时，有时候会因为网络环境的问题导致克隆失败。这个时候我们可以使用`insteadOf` 来解决这个问题。


``` shell
git config --global url."https://github-speed.gzh031.workers.dev/https://github.com".insteadOf "https://github.com"
```

这个命令就在克隆的仓库前面加上了`镜像`前缀



**验证生效**
``` shell
git config --global --list
```


## 加速 Github 其他资源网络解决方案

### 在`Bash`环境下

可以使用`alias`来解决这个问题,复制以下命令到Bash,即可更改`wget`默认将`github`加上前缀下载地址`github.cau-ghr.tech`

``` shell
alias wget='function _wget(){ 
  for arg in "$@"; do 
    if [[ "$arg" == https://github.com* ]]; then 
      arg="https://github-speed.gzh031.workers.dev/$arg"; 
    fi; 
    args+=("$arg"); 
  done; 
  command wget "${args[@]}"; 
  unset args; 
}; _wget'
```

### 在`fish`环境下

由于`fish`不支持`alias`,可以使用`fish`自带的fuction来配置,将以下命令复制到`fish`配置文件中`~/.config/fish/config.fish`

``` shell
function wget
    set args
    for arg in $argv
        if string match -r '^https://github\.com' $arg
            set arg "https://github-speed.gzh031.workers.dev/$arg"
        end
        set args $args $arg
    end
    command wget $args
end
```
然后再让配置文件生效
``` shell
source ~/.config/fish/config.fish
```

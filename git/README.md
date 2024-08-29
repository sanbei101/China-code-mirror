## 使用 Git 克隆 Github 仓库时的网络问题解决方案

当使用 Git 来克隆 Github 上的仓库时，有时候会因为网络环境的问题导致克隆失败。这个时候我们可以使用`insteadOf` 来解决这个问题。


``` shell
git config --global url."https://github.cau-ghr.tech/".insteadOf "https://github.com/"
```

这个命令就在克隆的仓库前面加上了`镜像`前缀



**验证生效**
``` shell
git config --global --list
```

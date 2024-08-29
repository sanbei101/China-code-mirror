默认的`Bash`没有记忆和补全功能,所以切换默认的shell为`fish`,这样可以提高效率,并且`fish`的语法更加简洁,易于记忆


## 安装`fish`
``` shell
sudo apt install fish
```

## 切换默认shell
``` shell
chsh -s (which fish)
```

然后重启(重新连接)`终端`即可
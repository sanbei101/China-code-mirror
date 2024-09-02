# uv
**`uv`是一个很好用的python包管理工具,可以很好的替代pip**

## 安装
```shell
pip install uv
```
## 配置镜像源
```toml
[tool.uv]
index-url = "https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple"
```
**踩过一个坑**:[UV does not respect pip mirror](https://github.com/astral-sh/uv/issues/6925)

## 用法
### 想要安装某个库
```shell
uv add <package>
```
### 想要运行某个库
```shell
uv run <package> +具体的命令
```
比如当我想要运行`fastapi dev main.py`的时候
我就要
```shell
uv run fastapi dev main.py
```

如果觉得不方便,可以在终端激活`venv`环境
```shell
source ./.venv/bin/
```

## uvx的使用

`uvx`是`uv tool run`的别名,可以快速运行一些检查工具如`ruff`,但是`tool`工具不遵循项目级的配置文件,配置镜像需要在
`~/.config/uv/uv.toml`配置

```toml
index-url = "https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple"
```

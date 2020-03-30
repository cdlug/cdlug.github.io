---
layout: post
title: python pypi 镜像
author: haobug
---

<!--
http://mirrors.aliyun.com/pypi/simple/  aliyun mirror is not stable some how
-->

* 中国科学技术大学 
```
https://pypi.mirrors.ustc.edu.cn/simple/
```
* 清华大学
```
https://pypi.tuna.tsinghua.edu.cn/simple/
```
* 豆瓣(douban) 
```
https://pypi.douban.com/simple/
```

### 使用方法Usage
```bash
pip install -i https://pypi.tuna.tsinghua.edu.cn/ pip 
```
* https://mirrors.tuna.tsinghua.edu.cn/help/pypi/
* https://mirrors.163.com/.help/pypi.html


### 写在配置文件里
1. Linux/MacOS 用户将它命名为 `pip.conf`，Windows 用户将它命名为 `pip.ini` 。 文件中写如下内容：
```conf
[global]timeout = 60
index-url = https://pypi.doubanio.com/simple
```
  **注意：** 如果使用http链接，需要指定trusted-host参数

```conf
[global]timeout = 60
index-url = http://pypi.douban.com/simple
trusted-host = pypi.douban.com
```

2. 将该文件放置在指定位置
  - Linux 下指定位置为 ```$HOME/.pip/pip.conf``` 或者 ```$HOME/.config/pip/pip.conf```
  - MacOS 下指定位置为 ```$HOME/Library/Application Support/pip/pip.conf``` 或者 ```$HOME/.pip/pip.conf```
  - Windows下指定位置为 ```%APPDATA%\pip\pip.ini``` 或者 ```%HOME%\pip\pip.ini```
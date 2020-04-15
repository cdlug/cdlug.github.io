---
title: "使用 Hugo 和更新 CDLUG 说明"
date: 2020-04-08T17:54:49+08:00
slug: hugo-post-guide
description: "主要介绍 Hugo 的一些基本使用，还有如何协作更新、发表文章"
author: "Too"

comment: false
toc: true
autoCollapseToc: true
postMetaInFooter: true

isCJKLanguage: true

---

在 [@QuantumGhost][1] 和 [@haobug][2] 的大力推动下，换用了 [Hugo][3] 作为 CDLUG 站点的生成系统，各项内容逐步完善中。这里主要介绍 Hugo 的一些基本使用，还有如何协作更新、发表文章。

<!--more-->


## 增加新文章流程
这里列出大概流程，具体操作见后面说明
1. 初次使用，需要先 fork 到自己的 GitHub 仓库，然后克隆该仓库到本地
2. 使用 `hugo` 指令创建 `.md` 文件
3. 本地测试预览
4. 提交修改，push 到 GitHub 你的仓库
5. 发起到 CDLUG 仓库的 pull request
6. Review 之后，merge 到 master，[Netlify][4] 会检测到新的版本，自动更新 [cdlug.org][5]


## Hugo 的基本使用
这里只列出基本的几个操作，更多使用详见[Hugo中文文档][3]
1. Clone 仓库，注意有 submodule	
   ```bash
   $ git clone --recursive <project url>
   ```
2. 创建新文章
   ```bash
   $ hugo new post/some-content.md
   ```
3. 运行预览（使用 even 主题）
   ```bash
   $ hugo server -D 
   ```
   {{% warning %}}
   需要注意，确保有 even 主题存在，否则运行看到的预览将是空白。如果 Clone 的时候忘记使用 recursive 参数，可以执行如下操作
   ```bash
   git submodule init
   git submodule update
   ```
   {{% /warning %}}
   
   ### 关于 even 主题的一些坑
   {{% note %}}
   - 新版的 Hugo 需要设置 `[markup.goldmark.renderer]` 才能使用 admonition
   - admonition 块如果顶格（即有缩进的话）会导致 div 没正常关闭
   - Flowchart 那些我测试似乎是不生效的
   {{% /note %}}


## 文章的格式和建议
### Front Matter 数据设置
建议参考 [even 主题的文档][6] 和 [Hugo 文档 Front Matter][7]。

在仓库内 `archetypes` 目录里有两个文件会在 `hugo new` 的时候使用到，其中
- `archetypes/default.md` 是默认会使用的文件
- `archetypes/even_default_mod.md` 是根据 even 主题提供的默认模版的修改，可以作参考用

## GitHub 协作
- Clone 仓库
   ```bash
   $ git clone --recursive <project url>
   ```
- Review PR
  ```bash
   $ git remote add cdlug https://github.com/cdlug/cdlug.github.io/
   $ git remote update cdlug
   $ git fetch cdlug pull/38/head:localTest
   $ git checkout localTest
   ```

## 参考资料
- [even 主题的文档][6]
- [Hugo中文文档][3]
- [Check out pull requests locally][8]
- [Host on Netlify | Hugo](https://gohugo.io/hosting-and-deployment/hosting-on-netlify/)
- [搭建博客 ( freenom + github + netlify + hugo ( extended version ) ) - 个人文章 - SegmentFault 思否](https://segmentfault.com/a/1190000020197430)

[1]:	https://github.com/QuantumGhost
[2]:	https://github.com/haobug
[3]:	https://www.gohugo.org/
[4]:	https://www.netlify.com/
[5]:	https://cdlug.org
[6]:	https://github.com/olOwOlo/hugo-theme-even/blob/master/README-zh.md
[7]:	https://www.gohugo.org/doc/content/front-matter/
[8]:	https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/checking-out-pull-requests-locally

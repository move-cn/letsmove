# Git入门到精通笔记

🧑‍💻 作者：gracecampo
## 概述

Git 的核心优势在于其分布式架构，每个开发者都拥有完整的代码仓库副本，这使得代码的同步和协作变得更加高效。

Git 提供了强大的分支管理功能，支持快速迭代和并行开发。

通过使用 Git，开发者能够更好地管理代码版本，提高开发效率，确保项目的稳定性和可维护性。

## Git的安装步骤
Git 是一个分布式版本控制系统，用于跟踪文件的更改，并协助多人协同工作

安装 Git
Windows 平台：

从 Git 官网下载安装程序：https://git-scm.com/download/win

运行下载的安装程序，按照提示完成安装过程。

macOS 平台：

使用 Homebrew（如果尚未安装，请访问 https://brew.sh/ 安装）：

```bash
brew install git
```
或者从 Git 官网下载安装程序：https://git-scm.com/download/mac

打开.dmg 文件，双击打开.pkg 文件，按照提示完成安装过程。

Linux 平台：

使用包管理器安装 Git，例如在 Debian/Ubuntu 系统上：

```bash
sudo apt-get update
sudo apt-get install git
```
在 CentOS/RHEL 系统上：
```bash
sudo yum install git
```
要验证 Git 是否已正确安装并配置，请在终端或命令提示符中输入以下命令：
```bash
git --version
```
如果显示 Git 的版本信息，说明安装成功。

以上就是 Git 的安装与配置过程。接下来，您可以开始使用 Git 管理项目了。

配置个人信息
```bash
git config --global user.email "your.email@example.com"
git config --global user.name "Your Name"
```
## 基本操作

初始化仓库与项目创建

git init 是 Git 版本控制系统的初始化命令，用于在当前目录下创建一个新的 Git 仓库

git commit 是 Git 版本控制系统中用于创建新提交（commit）的命令

```bash
mkdir myproject && cd myproject
git init && echo "# My Project" > README.md && git add .
git commit -m "Initial commit with README"
```
查看项目状态

git status 是 Git 版本控制系统中用于查看当前工作目录状态的命令

```bash
git status
```
文件的添加与提交
git add 是 Git 版本控制系统中用于将文件或目录从工作目录添加到暂存区的命令
```bash
echo "Hello, Git!" > example.txt
git add example.txt && git commit -m "Add example.txt"
```
版本历史的回溯
git log 是 Git 版本控制系统中用于查看提交历史的命令

执行此命令后，Git 会按照提交时间的倒序（最新的提交在最前面）显示提交历史。每个提交的信息包括提交哈希、作者、日期和提交消息。

```bash
git log
git checkout HEAD~1
```
分支管理
分支的优势与使用场景创建、切换与删除分支的实用技巧

git checkout 是一个非常强大的 Git 命令，用于切换分支、恢复工作目录文件、创建新分支等。

基本用法:
切换到指定分支:
```bash
git checkout -b <new_branch_name>
```

创建并切换到新分支
```bash
git checkout -b <new_branch_name>
```

git merge 是 Git 版本控制系统中的一个重要命令，用于将两个或多个分支的更改合并到一个分支中。

这个命令常用于将多个开发者的工作成果合并到主分支，或者将一个功能分支的代码合并到主分支进行测试或发布。

基本语法
```bash
git merge <branch-name>
```
其中 <branch-name> 是你想要合并到的当前分支的分支名。

使用场景

功能分支合并：开发者在功能分支上进行开发，完成后将功能分支合并到主分支。修复分支合并：在修复分支上修复了主分支的 bug 后，将修复分支合并回主分支。

常见选项

--no-commit：合并但不自动创建合并提交，允许你在提交前进一步修改。

--no-ff：即使可以执行快进合并（fast-forward merge），也强制创建一个新的合并提交。

--squash：将指定分支的所有提交压缩成一个单独的提交，然后合并到当前分支。

假设你有两个分支：main 和 feature，你想将 feature 分支的更改合并到 main 分支。

切换到 main 分支：
```bash
git checkout main
```


拉取最新的 main 分支代码（可选，但推荐）

git pull 是 Git 版本控制系统中用于从远程仓库获取最新更改并将其合并到当前分支的命令
```bash
git pull origin main
```
合并 feature 分支：
```bash
git merge feature
```
注意事项

合并前确保你的工作目录是干净的，没有未提交的更改。

合并后及时推送更改到远程仓库。

在合并复杂分支或大型项目时，建议先在测试环境中验证合并结果。

远程仓库操作

远程仓库的创建与管理推送、拉取与克隆的策略
```bash
git remote add origin https://github.com/username/repo.git
git push -u origin master
git pull origin master
git clone https://github.com/username/repo.git
```
## 团队协作
推送与拉取在团队协作中的作用分支策略在团队开发中的应用
高级操作
标签管理的实用技巧
```bash
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```
## 忽略文件的策略
在项目根目录下创建.gitignore文件
```bash
*.log
node_modules/
```

💧  [HOH水分子公众号](https://mp.weixin.qq.com/s/d0brr-ao6cZ5t8Z5OO1Mog)

🌊  [HOH水分子X账号](https://x.com/0xHOH)

📹  [课程B站账号](https://space.bilibili.com/3493269495352098)

💻  Github仓库 https://github.com/move-cn/letsmove
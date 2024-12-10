# Git 入门到精通全套教程 - 学习笔记

## 目录

1. [Git 官网介绍](#git-官网介绍)
2. [概述](#概述)
   - [版本控制介绍](#版本控制介绍)
   - [分布式版本控制 VS 集中式版本控制](#分布式版本控制-vs-集中式版本控制)
   - [发展历史](#发展历史)
   - [Git 工作机制与代码托管平台](#git-工作机制与代码托管平台)
3. [Git 安装](#git-安装)
4. [Git 基本命令](#git-基本命令)
   - [配置用户信息](#配置用户信息)
   - [初始化仓库](#初始化仓库)
   - [查看仓库状态](#查看仓库状态)
   - [暂存、提交与版本管理](#暂存-提交与版本管理)
5. [分支管理](#分支管理)
   - [分支的创建与切换](#分支的创建与切换)
   - [合并分支与解决冲突](#合并分支与解决冲突)
6. [团队协作](#团队协作)
7. [GitHub 集成](#github-集成)
8. [IDEA 集成](#idea-集成)
9. [码云与 GitLab](#码云与-gitlab)
10. [总结](#总结)

---

## Git 官网介绍

Git 是一款免费的分布式版本控制系统，支持在本地和远程同步版本变更。它最初由 Linus Torvalds 创建，适合各类协作项目的管理。Git 的官方网站为 [https://git-scm.com](https://git-scm.com)。

---

## 概述

### 版本控制介绍

版本控制系统（VCS）可以记录文件随时间的变化历史，使团队成员能够回溯项目任意版本，特别是在多人协作时有助于管理代码变化。

### 分布式版本控制 VS 集中式版本控制

- **集中式版本控制**：依赖中央服务器存储所有代码版本，用户必须连入服务器才能协作。
- **分布式版本控制**：每个开发者拥有完整的仓库副本，可以在本地管理、更新和回退版本。

### 发展历史

Git 由 Linus Torvalds 于 2005 年发布，随着开源软件的发展，Git 逐渐成为开源社区的标准。

### Git 工作机制与代码托管平台

Git 使用快照记录文件，支持快速创建和管理分支。代码托管平台（如 GitHub、Gitee、GitLab）提供便捷的仓库托管、协作功能。

---

## Git 安装

1. 在官网下载安装：[https://git-scm.com/downloads](https://git-scm.com/downloads)
2. 使用命令行验证安装：

   ```bash
   git --version
   ```

3. 配置用户信息：

   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```

---

## Git 基本命令

### 配置用户信息

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

可通过 `--global` 参数设置全局用户名和邮箱。

### 初始化仓库

在项目根目录下初始化 Git 仓库：

```bash
git init
```

初始化后，Git 会创建一个 `.git` 文件夹，用于存储本地库的所有信息。

### 查看仓库状态

查看当前工作区与暂存区状态，包括文件的改动、添加、删除等：

```bash
git status
```

### 暂存、提交与版本管理

1. 添加文件到暂存区：

   ```bash
   git add <filename>
   git add .  # 添加所有改动
   ```

2. 提交到本地库：

   ```bash
   git commit -m "提交描述信息"
   ```

3. 查看提交日志：

   ```bash
   git log  # 显示详细的提交日志
   git log --oneline  # 简略显示
   ```

4. 查看提交的差异：

   ```bash
   git diff  # 显示工作区与暂存区的差异
   git diff --staged  # 显示暂存区与本地库的差异
   ```

---

## 分支管理

### 分支的创建与切换

分支使得开发多个功能独立进行，避免主分支的代码冲突和不稳定。

1. 查看当前分支：

   ```bash
   git branch
   ```

2. 创建分支：

   ```bash
   git branch <branch-name>
   ```

3. 切换分支：

   ```bash
   git checkout <branch-name>
   ```

4. 创建并切换新分支：

   ```bash
   git checkout -b <branch-name>
   ```

### 合并分支与解决冲突

1. 合并分支：

   切换到主分支并合并：

   ```bash
   git checkout main
   git merge <branch-name>
   ```

2. 解决冲突：

   Git 会标记冲突位置，手动编辑并解决冲突后：

   ```bash
   git add <filename>
   git commit -m "解决冲突描述"
   ```

---

## 团队协作

Git 提供分布式版本控制，适用于不同场景的协作。

### 团队内协作

1. 创建远程仓库并推送：

   ```bash
   git remote add origin <repository-url>
   git push -u origin main
   ```

2. 拉取远程仓库更新：

   ```bash
   git pull origin main
   ```

### 跨团队协作

1. Fork 项目：在 GitHub 上 fork 他人的项目，建立自己版本的副本。
2. 提交 Pull Request：在自己的项目仓库修改后，发起 Pull Request 请求，将代码合并回原始项目。

---

## GitHub 集成

1. 创建远程仓库并设置别名：

   ```bash
   git remote add origin <repository-url>
   ```

2. 推送代码：

   ```bash
   git push -u origin main
   ```

3. 克隆远程仓库：

   ```bash
   git clone <repository-url>
   ```

4. SSH 免密登录：

   ```bash
   ssh-keygen -t rsa -C "your.email@example.com"
   ```

   将生成的公钥添加到 GitHub 账户中。

---

## IDEA 集成

1. 设置 Git：在 IDEA 设置中指定 Git 安装路径。
2. 创建本地仓库：在 IDEA 中点击 `Git > Enable Version Control Integration` 以初始化本地仓库。
3. 添加和提交：右键文件或项目，选择 `Git > Commit` 提交变更。
4. 分支管理：在 IDEA 的 Git 工具窗口中可以创建、切换、合并分支。
5. 推送与拉取：在 IDEA 中可以方便地将项目推送到远程仓库或拉取更新。

---

## 码云与 GitLab

### 码云

1. 注册并创建远程仓库：Gitee 是国内常用的代码托管平台。
2. IDEA 集成 Gitee：在 IDEA 中通过 `VCS > Gitee` 集成管理。

### GitLab

1. 安装 GitLab：GitLab 支持自建服务器，适合企业内部使用。
2. 创建仓库并设置访问权限：管理员可以为用户和团队分配仓库权限，满足内网环境下的协作需求。

> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH_QR.jpg)
# letmove_notes

## task1 报错篇

### 网络不好，无法下载依赖

```powershell
Failed to build Move modules: Failed to resolve dependencies for package 'task1'

Caused by:
    0: Fetching 'Sui'
    1: Failed to fetch to latest Git state for package 'Sui', to skip set --skip-fetch-latest-git-deps | Exit status: exit code: 128.
```

解决方法(个人认为魔法比较好用）：

1.  使用终端魔法，去Clash(window)中复制` powershell` 魔法后，再次部署
2. 将`Move.toml`中的 [dependencies]
   Sui = { git = "https://github.com/MystenLabs/sui.git" 的`github`替换为`gitee`

### gas不够（命令行中大概这么个意思）

解决方法：

1. 浏览器领水 http://getsui.com/address 将`address`替换为命令行输入`sui client active-address`后生成的活跃地址。
2. 找朋友给你发点，白嫖（bushi

### 模块名称错误

```powershell
error[E03001]: address with no value
  ┌─ \\?\D:\letsmove\mover\404ll\code\task1\sources\hello_move.move:1:8
  │
1 │ module hello_move ::hello {
  │        ^^^^^^^^^^ address 'hello_move' is not assigned a value. Try assigning it a value when calling the compiler

```

解决方法：将`module hello_move ::hello` 的第一个`hello_move`替换成Move.toml中显示的名称

例：

[package]

name = "task1"
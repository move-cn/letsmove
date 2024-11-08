# HOHMove 共学*Task1*小白向（mac 版）

![海报](assets/%E6%B5%B7%E6%8A%A5.webp)
![HOH](assets/HOH.webp)

> Move 共学由 HOH 社区、HackQuest、OpenBuild、KeyMap 联合发起。共学营集齐了多位 Move 语言领域内的专业导师，帮助新手小白快速了解 Move 语言及应用于 Web3 开发。

本教程面向新手，从 github 注册和 git 安装，到 SUI 安装和合约部署，最后到发起 PR，领取 20RMB 等值 Token，即使没有任何编程基础也能快速上手，有基础的同学可以跳着看。

## Git 安装、配置及 Fork 仓库

### Git 安装

如果你没有 github 账号请先[注册](https://github.com/signup?ref_cta=Sign+up&ref_loc=header+logged+out&ref_page=%2F&source=header-home)

首先下载[git 安装器](https://sourceforge.net/projects/git-osx-installer/)

双击安装

![git安装器](assets/git%E5%AE%89%E8%A3%85%E5%99%A8.png)

如果出现以下提示

![git安装器提示](assets/git%E5%AE%89%E8%A3%85%E5%99%A8%E6%8F%90%E7%A4%BA.png)

则点击左上角 🍎-系统设置-隐私与安全性-仍要打开
![仍要打开](assets/%E4%BB%8D%E8%A6%81%E6%89%93%E5%BC%80.png)

之后一直点击下一步即可。

最后打开终端(启动台-其他)，输入`git --version` ，出现版本号即为安装成功
![](assets/17309791005505.jpg)

### Git 配置

在终端中输入如下命令配置用户名和邮箱
`git config --global user.name "Rex"`
`git config --global user.email "77777777@qq.com"`

接着运行以下命令生成密钥

`ssh-keygen -t rsa -C "这里换上你的邮箱"`

连续按 4 次回车直到出现以下内容

![](assets/17309795538266.jpg)

运行`cat /Users/你的用户吗/.ssh/id_rsa.pub`，并复制返回的整段字符串

![](assets/17309797553250.jpg)

打开 github，点击右上角头像-settings

![](assets/17309798163460.jpg)
点击`SSH and GPG keys`

![](assets/17309799204616.jpg)

点击`New SSH key`

![](assets/17309799587486.jpg)

将刚刚复制的`id_rsa.pub`内容粘贴到 Key 中。
![](assets/17309800089746.jpg)

添加后出现以下内容即可

![](assets/17309801426835.jpg)

### Fork Letsmove 仓库

打开 letsmove 的仓库：https://github.com/move-cn/letsmove

点击右上角的 Fork 并创建

![](assets/17309803115291.jpg)
![](assets/17309803305969.jpg)

复制 ssh clone 链接，注意一定要 Clone 自己 fork 后的仓库，而不是原始的仓库，连接应该是这样的
`git@github.com:你的Github id/letsmove.git`
![](assets/17309804296562.jpg)

命令行运行
`git clone git@github.com:你的Github id/letsmove.git`

由于仓库比较大，Clone 速度比较慢，如果速度太慢或出现掉线，可以在终端使用代理，一般的代理工具都能一键复制代理命令。
例如 V2rayU 的代理命令为
`export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;export ALL_PROXY=socks5://127.0.0.1:1080`
其它工具的端口可能不一样
![](assets/17309808100155.jpg)
后续出现任何网络问题都可以尝试终端代理

运行 Clone 命令后出现以下内容即可

![](assets/17309812821822.jpg)

## SUI 钱包安装

下载浏览器钱包：https://chromewebstore.google.com/detail/sui-wallet/opcgpfmipidbgpenhmajoajpbobppdil

下载完成后，打开钱包，点击 More Options
![](assets/17309869442078.jpg)

点击 Create a new Passphrase Account
![](assets/17309870194835.jpg)

输入密码后，点击创建钱包
![](assets/17309870759559.jpg)

可以点击小眼睛查看助记词，并用小纸条抄写妥善保管
![](assets/17309871125119.jpg)

钱包界面如下所示，可以把地址复制出来
![](assets/17309872219682.jpg)

## SUI CLI 安装

### 安装 Homebrew

运行以下命令进行安装
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

以上命令同样可能出现网络问题，同样可以使用终端代理，见`Fork Letsmove仓库`章节

安装完成后输入`brew -v`，出现版本号即安装成功
![](assets/17309823331723.jpg)

### 安装 SUI CLI

运行`brew install sui`

安装完成后输入`sui --version`验证是否安装成功
![](assets/17309826065160.jpg)

## 编写 HelloWorld

### 下载 VSCode

VSCode:https://code.visualstudio.com/

我用 VSCode 比较习惯，还可以用[RustRover](https://www.jetbrains.com/ides/)

打开 VSCode，点击`Open Folder`打开刚刚 Clone 的文件夹

![](assets/17309819552118.jpg)

复制 mover/001 文件夹，并重命名为你的`Github id`

![](assets/17309828365586.jpg)
![](assets/17309828977090.jpg)

打开最外面的 readme.md

![](assets/17309873748869.jpg)

将你的钱包地址、github id 填进去，并认真填写个人简介

点击菜单栏的 Terminal - New Terminal 创建终端
![](assets/17309829659055.jpg)

输入`sui --version`，把版本号填到 task1 中，记得前面要改成[x]，不然之后提 PR 可能会被打回哟。

![](assets/17309875217001.jpg)
![](assets/17309878265612.jpg)

截图的路径最好检查一下是否正确，可以下载一个 markdown 插件，然后通过右上角进行预览，确保图片正确显示

![](assets/17309880055624.jpg)

![](assets/17309880337385.jpg)

使用 cd 命令进入到你刚刚复制的文件夹中
`cd mover`
`cd 你的Github id`
![](assets/17309830900740.jpg)

cd 到 code 中`cd code`
并运行`sui move new task1`

![](assets/17309832701576.jpg)

打开 task1.move

![](assets/17309833849361.jpg)

将内容替换为以下代码，记得将输出内容替换成你的 github id

```rust
module task1::hello ;

use std::ascii::{String, string};
use sui::object::{Self, UID};
use sui::transfer::transfer;
use sui::tx_context::{TxContext};

public struct Hello has key {
    id: UID,
    say: String
}

fun init(ctx: &mut TxContext) {
    let hello_move = Hello {
        id: object::new(ctx),
        say: string(b"你的github id"),
    };
    transfer(hello_move, ctx.sender());
}

```

![](assets/17309834612703.jpg)

如果没有语法高亮的话，可以安装 move 插件

![](assets/17309835104639.jpg)

效果是这样的

![](assets/17309835429778.jpg)

回到终端，cd 到`task1`，运行`sui client publish `

第一次启动 Sui 客户端时，如果没有 client.yaml 文件，控制台会显示以下消息：

`Config file ["<PATH-TO-FILE>/client.yaml"] doesn't exist, do you want to connect to a Sui Full node server [y/N]?`

按下 y 然后按 Enter 键。然后，进程会请求 RPC 服务器的 URL：

`Sui Full node server URL (Defaults to Sui Testnet if not specified) :`

出现一下提示，输入 0 就好
`Select key scheme to generate keypair (0 for ed25519,1 for seop256k1, 2: for secp256r1):`

第一次运行会提示 gas 不足

![](assets/17309845491120.jpg)

运行`sui client faucet`领取测试水

![](assets/17309849432342.jpg)

运行`sui client gas`，有余额即可
![](assets/17309849758874.jpg)
然后重新运行`sui client publish `

如果出现以下 502 错误
![](assets/17309851211963.jpg)

则可以换一个 RPC 节点

`sui client new-env --alias suiscan-testnet --rpc https://rpc-testnet.suiscan.xyz:443`
`sui client switch --env suiscan-testnet`

成功运行`sui client publish`后，会显示以下内容

![](assets/17309861103068.jpg)

往上拉可以找到交易哈希，复制下来

![](assets/17309861436383.jpg)

打开 SUI 的区块链浏览器：https://suivision.xyz/

切换到 Testnet
![](assets/17309881816400.jpg)

搜索刚刚的交易哈希
![](assets/17309882611955.jpg)

点击 Changes

![](assets/17309883169404.jpg)

往下拉，复制 package 的 id
![](assets/17309883378988.jpg)

填到 readme 里面
![](assets/17309883748991.jpg)

点击刚刚的 package id，查看 Code，把这一页截图保存，放到 readme 中

![](assets/17309884510231.jpg)

![](assets/17309885209478.jpg)

至此所有的 task 已经完成。

## 提交 PR，拿奖励啦

返回到 letsmove 文件夹

![](assets/17309888372191.jpg)

依次输入以下命令上传代码

`git add .`
`git commit -m "task1"`
`git push`

![](assets/17309890083501.jpg)

回到 fork 的 github 仓库，点击 Contribute-Open pull request 创建 PR
![](assets/17309890539301.jpg)
写好标题，创建 PR
![](assets/17309891393660.jpg)

![](assets/17309891952110.jpg)

把 PR 链接发到群里进行接龙，可以等着拿奖励啦

![](assets/PR.png)

又要到饭啦

![](assets/17309912666039.jpg)

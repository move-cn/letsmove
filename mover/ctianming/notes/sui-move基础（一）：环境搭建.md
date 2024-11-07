title: sui-move基础（一）：环境搭建

# sui-move基础（一）：环境搭建

这里仅以ubuntu系统为例，我的环境是wsl2：

### wsl2

System:
  Host: universe Kernel: 5.15.153.1-microsoft-standard-WSL2 x86_64 bits: 64
    Desktop: N/A Distro: Ubuntu 22.04.4 LTS (Jammy Jellyfish)

个人比较推荐wls2下进行编程，毕竟已经遭受过windows安装的环境过多而导致C盘爆炸这样的惨痛经历（TAT）。如何安装wsl2，网上已经有了足够多的教程，大家可以各作参考。

这里给几个我曾遇见的问题：

1. 确保自己的windows许可证起码是专业版，网上有许多野生的windows许可证，实在找不到的话可以淘宝买一个，但别买贵了，最多最多五块钱

2. 如果遇到了安装wsl2时系统发生回滚的问题，可能是hyper-v无法开启，保存以下代码为 `hyper-v.cmd` 并运行：

   ```cmd
   pushd "%~dp0"
   dir /b %SystemRoot%\servicing\Packages\*Hyper-V*.mum >hyper-v.txt
   for /f %%i in ('findstr /i . hyper-v.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
   del hyper-v.txt
   Dism /online /enable-feature /featurename:Microsoft-Hyper-V-All /LimitAccess /ALL
   ```

3. 另外，千万记得保存wsl2虚拟机示例到D盘，否则就防止C盘压力继续增大的目的来说算是白装了。。。

## 注册钱包

以下内容来自letsmove项目(https://github.com/move-cn/letsmove)的task1

*钱包*是进入 Web3 世界大门的钥匙，*钱包*能够很好管理你的账户信息和链上的资产。

*  [Sui Wallet](https://chrome.google.com/webstore/detail/opcgpfmipidbgpenhmajoajpbobppdil)  |    [教程-如何开始使用Sui钱包](https://mp.weixin.qq.com/s/-_hCFUO-62hv9amPzmJdeg)
*  [Suiet Wallet](https://chrome.google.com/webstore/detail/suiet-sui-wallet/khpkpbbcccdmmclmpigdgddabeilkdpd)   |  [教程-如何获取Suiet钱包](https://suiet.app/blog/what-is-suiet-sui-wallet-how-to-use-sui-wallet)
*  [Ethos Wallet](https://ethoswallet.xyz/)
   当你注册好钱包就可以开启 Web3 之旅了，接下来介绍参与方式。

### sui安装

我以官方文档为例，官方文档使用了 `Homebrew` 来进行 sui 环境的安装，运行以安装Homebrew（需要科学上网）：

```cmd
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

如果遇到缓存空间不足的问题，例如：

```bash
error: RPC failed; curl 92 HTTP/2 stream 0 was not closed cleanly: CANCEL (err 8)
error: 2912 bytes of body are still expected
fetch-pack: unexpected disconnect while reading sideband packet
fatal: early EOF
fatal: fetch-pack: invalid index-pack output
Failed during: /usr/bin/git fetch --quiet --progress --force origin
```

在 `https://github.com/Homebrew/brew/releases/latest` 中找到tar.gz，复制链接，例如：`https://github.com/Homebrew/brew/archive/refs/tags/4.4.4.tar.gz`运行：

```bash
curl -L https://github.com/Homebrew/brew/archive/refs/tags/4.4.4.tar.gz -o brew-4.4.4.tar.gz //下载
tar -xzvf brew-4.4.4.tar.gz //解压
mkdir -p /home/amyseer/.linuxbrew 
mv brew-4.4.4/* /home/amyseer/.linuxbrew/
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.profile
source ~/.profile
```

随后验证安装：

```bash
brew
```

确认Homebrew安装完成后进行 sui 环境的安装：

```bash
brew install sui
```

随后验证安装：

```bash
sui
```

对于从二进制安装sui，则与上面安装Homebrew的步骤差不多，区别只是你需要寻找的是sui的发行版。更多安装方法可参考：https://docs.sui.io/guides/developer/getting-started/sui-install

从 cargo 安装要求有rust和cargo环境，可以直接参考rust官方文档https://www.rust-lang.org/zh-CN/tools/install。

### 连接到 sui 网络

没什么可多说的，建议直接参考：

sui测试网络：https://docs.sui.io/guides/developer/getting-started/connect

sui本地网络：https://docs.sui.io/guides/developer/getting-started/local-network

### 获取 sui Tokens

之前你已经在连接 sui 测试网络时运行了：

```bash
sui client
```

运行完成后你获得了一个地址<WALLET ADDRESS>和12个助记词

现在只需： 
1. 加入 Sui Discord: https://discord.gg/sui
2. 完成身份验证步骤
3. 进入对应的 #devnet-faucet 或 #testnet-faucet 频道
4. 输入 !faucet <WALLET ADDRESS>

### move开发环境

在这里申明，建议安装rust环境，直接参考rust官方文档即可。

根据个人爱好和使用感受，vscode + rust-analyzer对rust的支持相当不错，这也是官方推荐的编辑器。

而 move 在 vscode 同样有相应的插件，只需安装 VS Code `Move` 插件 [教程](https://learnblockchain.cn/article/8210)

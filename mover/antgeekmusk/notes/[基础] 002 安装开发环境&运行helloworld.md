> 本文章是一篇实战,描述如何将一个helloworld程序部署到sui链上去
>



学习文档 :  [https://github.com/hoh-zone/move-bootcamp/tree/main/01_hello](https://github.com/hoh-zone/move-bootcamp/tree/main/01_hello)



一些文档资源

+ [什么是Move](https://mp.weixin.qq.com/s/MEZXP8l8x67lBDZWQsgg8g)
+ [什么是智能合约](https://mp.weixin.qq.com/s/5yQuNUsa0lt-krJint_lkw)
+ [钱包和区块链浏览器](https://mp.weixin.qq.com/s/9Zc2u5l8c1LiatNNEkN_Ow)

# 一.安装环境
## 1.安装sui cli
> sui cli 就是move语言的编译器
>



### mac 安装
[安装 brew](https://brew.sh/)

```go
brew install sui
```



### windows安装
[安装choco](https://chocolatey.org/)

```go
choco install sui
```



### docker 镜像安装
pull 镜像

```go
  docker pull mysten/sui-tools:devnet
```

运行容器

```go
  docker run --name suidevcontainer -itd mysten/sui-tools:devnet

  docker exec -it suidevcontainer bash
```



## 2.校验sui cli是否安装成功
```go
sui --version
```

输出

```go
sui 1.37.1-homebrew
```





## 3.安装Sui钱包
到chrome 应用商店  : [https://chromewebstore.google.com/?hl=zh-CN](https://chromewebstore.google.com/?hl=zh-CN)

搜索sui,然后安装如图上的插件



![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730986145539-b9b76dc2-1fef-4a00-929d-0793c18a7350.png)



点击添加拓展程序 跳转到了如下页面

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730986683183-beef692f-f599-45b2-9ec1-f9dbf0af672b.png)

点击 More Options

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730986764435-a1419a12-ecd4-4c0a-a36c-33c8c13ef279.png)

点击 Create a new Passphrase Account 然后输入密码创建钱包



![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730986909408-81ca2cbf-a312-43fb-9c7a-6416072135c7.png)

创建完账户后会有一个助记词,这个助记词可以用来恢复密码,所以不要把这个泄露给任何人!!!

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730987024943-56a2bf67-4d5e-4821-a213-ff9fb45daa02.png)

新创建的钱包里面一分钱没有的

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730987108380-ff301615-678f-417c-8819-88337ef8750a.png)

## 4.安装开发工具RustRover
下载链接 : [https://www.jetbrains.com/zh-cn/rust/download/#section=mac](https://www.jetbrains.com/zh-cn/rust/download/#section=mac)



安装的时候选择非商用即可

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730987962229-bdbab01b-a0be-4f39-ab94-8aed6328ba24.png)



安装sui插件

RustRover --> Settings --> Plugins --> 搜sui --> install --> restart

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730992975490-91a613e9-e8d6-4220-b3d9-3cddc6b054ed.png)

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730993027954-93bc161a-c6e6-4134-a5d9-b9555717109b.png)





# 二.开发第一个项目helloworld
创建一个工作目录以后代码放这里

```shell
mkdir sui
cd sui
```



创建项目

```shell
sui move new hellomove

ll hellomove
```

创建好的目录结构

> Move.toml # 这是一个清单文件
>
> sources # 源码放这里
>
> tests # 测试文件  

>



用编译器RustRover打开项目

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730992781432-4e973398-0ea4-49e3-ae62-9bd84fee8974.png)



修改hellomove文件

```shell
module hellomove::hello ;

use std::ascii::{String, string};
use sui::object::{Self, UID};
use sui::transfer::transfer;
use sui::tx_context::{TxContext};

public struct Hello has key {
    id: UID,
    say: String
}

fun init(ctx: &mut TxContext) {
    let hellomove = Hello {
        id: object::new(ctx),
        say: string(b"move"),
    };
    transfer(hellomove, ctx.sender());
}

```



发布程序到链上(默认是测试网)

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730994120763-a144b013-2233-41b3-8f50-9ed40208c33c.png)



注意这里要链接到github下载依赖,如果没有代理就可以修改如下地方改成gitee

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730994194901-84e798df-2a84-4a59-a452-d247fb9805fb.png)



但是会发现有个新的报错

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730994300889-3eca678c-6a09-48d2-8631-188f836c26eb.png)

```shell
Cannot find gas coin for signer address 0x085b474a5b222bc015ac0ae5ee62034d645662b2431ca831674a43f650613e60 with amount sufficient for the required gas budget 10770400. If you are using the pay or transfer commands, you can use pay-sui or transfer-sui commands instead, which will use the only object as gas payment.
```



大概意思就是发布的时候你的钱不够,和传统的web2项目不一样,web3发布项目是要收费的,但是我们不能说开发还要付费吧,所以测试网有专门的测试币可以使用,可以通过一个叫做水龙头faucet的地方获取



通过水龙头获取钱

```shell
sui client faucet
```

输出

```shell
Request successful. It can take up to 1 minute to get the coin. Run sui client gas to check your gas coins.
```



查看当前有多少钱

```shell
sui client gas
```

输出

```shell
╭────────────────────────────────────────────────────────────────────┬────────────────────┬──────────────────╮
│ gasCoinId                                                          │ mistBalance (MIST) │ suiBalance (SUI) │
├────────────────────────────────────────────────────────────────────┼────────────────────┼──────────────────┤
│ 0x5df0f6ea03eb2ced0521d0b3d0dd427f7fca59b6577b6f00930f5c5eaeb1e123 │ 1000000000         │ 1.00             │
╰────────────────────────────────────────────────────────────────────┴────────────────────┴──────────────────╯

```

可以看到现在有1个sui



重新发布,其中看到如下记过就是成功了

```shell
(base) ➜  hellomove sui client publish

UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hellomove
...
Successfully verified dependencies on-chain against source.
Transaction Digest: HiqfA36kqMr4MHSHbbGCC5KJJixXRDjEQJni7fUhBtGy
...
```





通过区块链浏览器查看发布效果

+ [https://suiscan.xyz/](https://suiscan.xyz/)
+ [https://suivision.xyz/](https://suivision.xyz/) 



切换到测试网,默认进去是主网

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730995027113-4f3ec44f-ec66-46fe-9c0b-4b2e94e851e2.png)



搜索一下刚刚控制台打印的hash

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730994984809-0ea5c5be-f721-46f3-8e3f-d1dad2cb13b8.png)



可以看到有一条交易

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730995066620-45a67d7c-0037-40c3-9f8a-ba3bfcee521d.png)



查看代码

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730995188345-0f313907-45b3-48c8-9945-6141d11ef6e0.png)

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730995199734-f7878630-88ef-4226-adf5-0586582a9c66.png)



# 参考
[https://github.com/hoh-zone/move-bootcamp/tree/main/01_hello](https://github.com/hoh-zone/move-bootcamp/tree/main/01_hello)


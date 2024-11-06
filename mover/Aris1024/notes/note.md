# Move共学笔记

---

#### 2024-11-06

##### 学习内容 

- 加入社交群 `完成`
- 完成Sui钱包安装 `完成`
- 完成Sui CLI安装 `完成`
- 完成获取测试网络SUI学习 `完成`
- 完成Sui浏览器学习 `完成`
- Hello Move 合约必须包含自己github id 输出内容是 `github id` `完成`
- 提交Sui Cli的版本ID: `完成`
- 提交`Hello Move`合约发布`package id` `完成`
- 提交安装好浏览器钱包的截图到 `images` `完成` (我这里改成了 assets 目录,因为 images 字面意义是图片,有可能放其他资源文件,所以改成 assets 更有意义一些)

1. 安装

    - 去 sui [官网安装教程](https://docs.sui.io/guides/developer/getting-started/sui-install) 有几种方式,这里选择 GitHub 的[二进制文件安装](https://docs.sui.io/guides/developer/getting-started/sui-install#install-binaries)

    - ![image-20241106165657426](assets/image-20241106165657426.png)

    - 因为是第一次学习,所以使用 testnet 即可,[GitHub 地址](https://github.com/MystenLabs/sui/releases)

    - ![image-20241106165854805](assets/image-20241106165854805.png)

    - 下载以后,进入本地用户目录,创建 sui 目录,把刚刚的压缩包放入,并解压

    - ![image-20241106170058045](assets/image-20241106170058045.png)

    - 打开终端,进入上面的 ~/sui/sui-testnet-v1.37.1-macos-x86_64目录获得路径

    - ![image-20241106170205406](assets/image-20241106170205406.png)

    - 我使用的是 bash,所以打开 ~/.bash_profile,进行配置,具体配置项

        - Add the folder containing the extracted files to your `PATH` variable. To do so, you can update your `~/.zshrc` or `~/.bashrc` to include the location of the Sui binaries. If using the suggested location, you type `export PATH=$PATH:~/sui` and press Enter.
        - Start a new terminal session or type `source ~/.zshrc` (or `.bashrc`) to load the new `PATH` value.

    - 根据安装文档的提示,在.bash_profile添加如下配置

    - ![image-20241106170348281](assets/image-20241106170348281.png)

    - 执行 `sui --vesion` 展示出版本号即可

    - ![image-20241106173307418](assets/image-20241106173307418.png)

        

2. 配置 sui client

    - 为了辅助学习,我在创建了 HOH.Move 目录,开始测试 sui 相关指令
    - 配置 sui client [文档地址](https://docs.sui.io/guides/developer/getting-started/connect#configure-sui-client)
    - ![image-20241106173647117](assets/image-20241106173647117.png)
    - `sui client`
    - ![sui_client命令](assets/1_sui_client命令.png)

3. sui client 指令

    - 使用前,避免网络问题引起,请开启代理,我这里使用终端命令(请根据你的客户端进行配置)
        - `export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890`
    -  `sui client envs` 展示所有环境,我当前只有 testnet(List all Sui environments)
    - `sui client addresses` 获取钱包地址 (Obtain the Addresses managed by the client)
    - `sui client balance` 获取钱包余额
    - `sui client balance` 领水 1SUI
    - ![领水](assets/2_领水.png)

4. 创建 hello_move 项目

    - 创建 task1 目录,执行命令 `sui move new hell_move`
    - [参考文档地址](https://docs.sui.io/guides/developer/first-app/write-package)
    - ![image-20241106181718758](assets/image-20241106181718758.png)
    - 使用命令 `sui move new -h` 查看使用方法
    - 指定项目到 当前 task1 目录,所以,进入该目录,执行 `sui move new hello_move -p ./`这样就不会创建 hello_move 层级目录, 少一个目录更清晰一些

5. build,test and public a package

    - [参考文档连接](https://docs.sui.io/guides/developer/first-app/build-test)
    - 修改代码
        - ![image-20241106182256637](assets/image-20241106182256637.png)
    - 编译 package
        - `sui move build`
        - ![image-20241106182525632](assets/image-20241106182525632.png)
    - 测试 package
        - `sui move test`
        - ![image-20241106182610308](assets/image-20241106182610308.png)
    - 发布 package
        - [参考文档链接](https://docs.sui.io/guides/developer/first-app/publish)
        - `sui client publish`
        - ![image-20241106183535884](assets/image-20241106183535884.png)

6. 区块链浏览器

    - 把上面 发布 package 得到的交易哈希(Transaction Digest `A8gt8SWxCGaZxqZRYqitozgFD5SfbpgrECCxwNAeZqnm` )放入sui 区块链浏览器中
    - [浏览器地址](https://suivision.xyz/) 注意需要点击右上角切换成 testnet [测试网地址](https://testnet.suivision.xyz/)
    - ![image-20241106183915506](assets/image-20241106183915506.png)
    - 查看交易详情,获取 packageid
        - ![image-20241106184545297](assets/image-20241106184545297.png)
<<<<<<< HEAD
下载sui编译器（下载mainnet的： sui-mainnet-v1.37.4-windows-x86_64.tgz）
https://github.com/MystenLabs/sui/releases

下载完成之后解压在一个文件夹里面，然后把这个文件夹地址添加到环境变量的 path里面去
安装完成之后在控制台输入  sui --version
显示版本则安装完成

创建项目
新建一个文件夹
打开控制台  cd到文件夹里面
然后输入命令  sui  move new hello_move
可以看见文件夹里面已经有项目文件夹了
然后打开rustrover 用 编辑器打开这个文件夹就可以开始编辑代码了


在编辑器中安装插件
可pycharm很像
在seting --- >plugins--->搜索sui--->如果有这个就下载直接安装


如果没有就在网页下载，然后手动安装：
https://plugins.jetbrains.com/plugin/23301-sui-move-language/reviews
右上角齿轮点击---》install  plugins from disk --->


因为rustrover没办法下载以前的版本所以我下载了这个
https://www.jetbrains.com/idea/download/other.html
2023版本的
然后插件 貌似可以了

Generated new keypair and alias for address with scheme "ed25519" [hungry-cyanite: 0x4a8ff94757bdcc3e50a36f2c006c25f5cf53b90cad39393d5821caf34c4419d8]
Secret Recovery Phrase : [foil trumpet lemon fix foam candy cage dentist trigger true retire switch]



一  设置代理
如果你刚刚复制了hello_move会发现有很多错误
第一个你需要安装git  
下载链接https://git-scm.com/downloads/win
安装的时候 在勾选界面停留下，多勾选两个，或者next也行，一路next 就行，
安装git 之后 在控制台输入

git --version
如果出现版本就安装完成
如果没有就配置下环境变量，我是一次性安装完成的

之后在编辑器这里控制台设置下代理，因为开了vpn的缘故，我用的是clash，所以

windows用户设置git代理

git config --global http.proxy http://127.0.0.1:7890
git config --global https.proxy http://127.0.0.1:7890

配置环境变量的代理（可选）
set HTTP_PROXY=http://127.0.0.1:7890
set HTTPS_PROXY=http://127.0.0.1:7890


配置 Sui 的代理
HTTP_PROXY=http://127.0.0.1:7890 HTTPS_PROXY=http://127.0.0.1:7890 sui client publish


然后运行sui client publish 会报错

这是因为生成的账户中没有gas费用
运行   sui client faucet
领取水

运行sui client gas
可以查看账户余额

继续运行 sui client publish
可以看到有一个txhash 然后复制 去suiscan.io去查看一下




提交作业
首先需要安装git bash ,window系统直接下载安装即可
https://git-scm.com/downloads/win
​
安装之后需要设置代理，因为开了clash
git config --global http.proxy http://127.0.0.1:7890
git config --global https.proxy http://127.0.0.1:7890
​
保存在c盘的用户哪里，有一个letmove文件夹


=======
下载sui编译器（下载mainnet的： sui-mainnet-v1.37.4-windows-x86_64.tgz）
https://github.com/MystenLabs/sui/releases

下载完成之后解压在一个文件夹里面，然后把这个文件夹地址添加到环境变量的 path里面去
安装完成之后在控制台输入  sui --version 
显示版本则安装完成 

创建项目
新建一个文件夹
打开控制台  cd到文件夹里面 
然后输入命令  sui  move new hello_move
可以看见文件夹里面已经有项目文件夹了
然后打开rustrover 用 编辑器打开这个文件夹就可以开始编辑代码了


在编辑器中安装插件
可pycharm很像 
在seting --- >plugins--->搜索sui--->如果有这个就下载直接安装


如果没有就在网页下载，然后手动安装：
https://plugins.jetbrains.com/plugin/23301-sui-move-language/reviews
右上角齿轮点击---》install  plugins from disk --->


因为rustrover没办法下载以前的版本所以我下载了这个
https://www.jetbrains.com/idea/download/other.html 
2023版本的
然后插件 貌似可以了

下载sui编译器（下载mainnet的： sui-mainnet-v1.37.4-windows-x86_64.tgz）
https://github.com/MystenLabs/sui/releases

下载完成之后解压在一个文件夹里面，然后把这个文件夹地址添加到环境变量的 path里面去
安装完成之后在控制台输入  sui --version 
显示版本则安装完成 

创建项目
新建一个文件夹
打开控制台  cd到文件夹里面 
然后输入命令  sui  move new hello_move
可以看见文件夹里面已经有项目文件夹了
然后打开rustrover 用 编辑器打开这个文件夹就可以开始编辑代码了


在编辑器中安装插件
可pycharm很像 
在seting --- >plugins--->搜索sui--->如果有这个就下载直接安装


如果没有就在网页下载，然后手动安装：
https://plugins.jetbrains.com/plugin/23301-sui-move-language/reviews
右上角齿轮点击---》install  plugins from disk --->


因为rustrover没办法下载以前的版本所以我下载了这个
https://www.jetbrains.com/idea/download/other.html 
2023版本的
然后插件 貌似可以了
>>>>>>> 7840fa7b71a95307e1a783c7c0aa9a92a7cdc65c

##   01 hello move  
- [] package id: 0x14438265c2836a22b73c5bdd2b94d551d573e3a8c66607278ea20832152a51d4
- 日志：
mac使用brew安装，没有什么问题。
build和publish时，因为用了最新版的sui，需要先把toml文件的`edition = "2024.alpha"`注释打开。
task1使用`sui move new hello_move`创建项目，使用了`struct`创建结构体，`has key`表示拥有key abllity，
通过`init`函数部署合约时自动调用，实例化Hello结构体，并通过`transfer`方法将实例化的结果传递给调用者。
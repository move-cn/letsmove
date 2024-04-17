##   01 hello move  

[x] 日志：

mac安装sui 直接使用brew安装 1.23.0版本，然后配置测试rpc地址， sui client new-env --alias <ALIAS> --rpc <RPC>，
然后通过sui client switch --env testnet 切换到测试网，然后通过sui client new-address <KEY_SCHEME>创建一个本地钱包，
保存好助记词，然后在sui钱包插件上领点测试币,然后通过sui move new task_1 创建move项目。

创建出的项目需要在sources下创建一个move文件，创建一个Hello结构体，has key表示拥有key ablity，每次实例化Hello结构体都会通过
object::new(ctx)创建一个新的id，init方法会在部署时触发。

最后先通过sui move build构建 看有没有问题，没问题后通过sui client publish --gas-budget 100000000部署到测试网。

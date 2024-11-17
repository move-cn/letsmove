# task1
1. sui安装
sui --version

2. 安装IDE，vscode插件

3. 安装钱包


4. 运行hello_move
创建项目
```shell
sui move new hello_move
```
发布上链
`cd hello_move`

sui move build
sui move test

查看当前地址
```shell
sui client addresses
```

获取测试sui
```shell
sui client faucet
```

查看余额
```shell
sui client gas
```

部署合约
```shell
sui client publish --gas-budget 100000000
```



事务数据、事务效果、事务块事件、对象更改和余额更改
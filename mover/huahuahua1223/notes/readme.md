# task1
1. 创建项目
```shell
sui move new hello_move
```
2. 发布上链
`cd hello_move`

sui move build
sui move test

```shell
sui client addresses
sui client publish --gas-budget 100000000
```
事务数据、事务效果、事务块事件、对象更改和余额更改
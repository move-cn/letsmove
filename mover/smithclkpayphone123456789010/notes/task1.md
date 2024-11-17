## 外部笔记链接: https://learnblockchain.cn/article/9911

`sui client active-address`   查看自己的地址

`sui client faucet`    请求测试币

`sui client gas`         查看余额

`sui move new hello_move`   创建一个.move项目，名称为hello_move

`sui client publish`          将一个新的智能合约包（package）发送到sui区块链上

##  *package（智能合约包）*

  package是存储智能合约的容器，sui client publish会将package发送到sui区块链上，等于说将你的智能合约部署到了链上，部署上链的合约可以被其他账户调用

  假设你已经编写了一个包含智能合约模块的 Rust 或 Move 文件，你可以通过以下步骤来**发布它**：\

 `sui client publish --path /path/to/your/package`

 - `--path` 后面是你合约包所在的目录路径。
 - 该命令会在区块链上创建一个新的合约包并返回相应的 `packageID`，你可以使用这个 ID 来在未来的操作中引用该合约包。


## *packageid（智能合约包的id）*

智能合约包的唯一标识，其他账号可以通过id来查看调用包中的合约



## *transaction digest（交易摘要）*

每一笔交易的唯一标识
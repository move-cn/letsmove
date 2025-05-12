# Sui Move
## task 01
Sui 命令行的使用：
- sui client -V
- sui client publish
- sui move new
- sui move build
- sui keytool list
- sui keytool import
Sui概念：
**Transaction Data**
- Transaction Digest类似于以太坊的TxHash
- Transaction Kind: Programmable、TransferObject、PaySui、SplitCoin、MergeCoins
- Input Objects: 该task中只用到了Pure Arg
- Commands：Publish、TransferObjects
**Transaction Effects**
- Epoch: 交易执行的纪元编号。在 Sui 中，纪元是一个时间段。
- Created Objects: ID唯一标识、Version版本号、Digest对象的哈希（来确定完整性）
- Mutated Objects
- Gas Object
- Gas cost summary: storage cost、computation cost、storage rebate、non-refundable storage fee
- Transaction Dependencies
**Object Changes**
- Created Objects: hello对象、upgradeCap对像
- Mutated Objects: SuiCoin对象
- Published Objects: 发布的package（即合约）
**Balance Changes**
- CoinType: 0x2 SUI


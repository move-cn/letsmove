## 1. 新建合约

`sui move new task_two`
合约内容[task2_faucet_coin.move](../code/task2_faucet_coin.move)

## 2. 发布 faucet_coin 合约

```bash
sui client publish --gas-budget=50000000
```

之后在终端查看发布后的 PackageID，计作`obj_1`

## 3. mycoin_coin 合约

相同步骤，发布后查看终端，找到`ObjectType: 0x2::coin::TreasuryCap`开头的这一段，记录下`ObjectID`,计作`obj_2`。

```bash
ObjectID: 0x8d900f465f22d9185c445d7b0a9374dd444a653138f06ebc1d1e144bcefe433f
。。。省略
ObjectType: 0x2::coin::TreasuryCap<0x2d132ce774d7a7063ee2cd79c729dc939719c4bfc80a34d3e015c599c4095f8d::my_coin::MY_COIN>
```

## 4. 转账到指定账户

```bash
sui client call --function mint --module my_coin --package  <obj_1> --args <obj_2> 2024000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 90000000
```

执行之后，记录该交易 hash。

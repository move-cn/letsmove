# Task 2 - sui coin

## 创建并项目
### 新建项目
```bash
sui move new task2
```

### 构建、发布
```bash
sui move build
sui client publish --gas-budget=50000000 
```

输出：
```
    packageid： 0xfc3cb012ecc8ff1a204023d037dbdce3f6460d239dba26786bc82815709ab8df
    MYCoin TreasuryCap: 0x635fc49ed3656fe222b7fc5796e094f6e5ea19772585377a90b5c05a62d86cb0
    FaucetCoin TreasuryCap: 0x91bbd46b77a5e952ac948046337f01ec15465e327f14c63808ee0fa49323f6c9
```

## mint&转账
### mint
```bash
sui client call --function mint --module mycoin --package 0xfc3cb012ecc8ff1a204023d037dbdce3f6460d239dba26786bc82815709ab8df --args 0x635fc49ed3656fe222b7fc5796e094f6e5ea19772585377a90b5c05a62d86cb0 100000000000 0xc6f35ca58036272619a15c49f4815f378688729b87c2e1d220661a78be431813 --gas-budget 50000000

sui client call --function mint --module faucet_coin --package 0xfc3cb012ecc8ff1a204023d037dbdce3f6460d239dba26786bc82815709ab8df --args 0x91bbd46b77a5e952ac948046337f01ec15465e327f14c63808ee0fa49323f6c9 100000000000 0xc6f35ca58036272619a15c49f4815f378688729b87c2e1d220661a78be431813 --gas-budget 50000000
```

### 给老板发点MYCoin
```bash
sui client call --function mint --module mycoin --package 0xfc3cb012ecc8ff1a204023d037dbdce3f6460d239dba26786bc82815709ab8df --args 0x635fc49ed3656fe222b7fc5796e094f6e5ea19772585377a90b5c05a62d86cb0 100000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000
```
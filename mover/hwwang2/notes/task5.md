# Task 5 - sui swap

## 新建项目
新建项目
```bash
sui move new task5
```

构建、发布
```bash
sui move build
sui client publish --gas-budget=50000000 
```

输出：
```
    packageid： 0xc2a78d59125c1127a51f1911531134720337a3387a4b7719f458fe2403d9c01b
    admin-cap： 0x79e0f09b498e22495b1be8c4d72df1b2bf98b89fd3d6722d96c632e29491fe43
```

## 初始化&swap
```bash
# 查下自己的零钱
sui client balance
# 查看账户 https://suiscan.xyz/testnet/account/0xc6f35ca58036272619a15c49f4815f378688729b87c2e1d220661a78be431813
# FAUCETCoin 0xfc3cb012ecc8ff1a204023d037dbdce3f6460d239dba26786bc82815709ab8df::faucet_coin::FAUCET_COIN
# MYCoin 0xfc3cb012ecc8ff1a204023d037dbdce3f6460d239dba26786bc82815709ab8df::mycoin::MYCOIN

# 初始化，要放点钱进去
sui client call --function initialize --module my_swap --package 0xc2a78d59125c1127a51f1911531134720337a3387a4b7719f458fe2403d9c01b --args 0x79e0f09b498e22495b1be8c4d72df1b2bf98b89fd3d6722d96c632e29491fe43 0x532ccc5cc72827c19ba09dba406362fddda92520a19820e35366ab064b52bf36 0x34c0d1ee26582b7ecb89f8a38ff388c42d63ec99a09aa47a355531e7e38b55d4 100 --type-args 0xfc3cb012ecc8ff1a204023d037dbdce3f6460d239dba26786bc82815709ab8df::faucet_coin::FAUCET_COIN 0xfc3cb012ecc8ff1a204023d037dbdce3f6460d239dba26786bc82815709ab8df::mycoin::MYCOIN --gas-budget 50000000

# 返回HouseData 0xcc3cab29a7237d1b95ce95928648e083f5cc790e2ab7993cafdc232e77e1c4ff

# 设置rate
sui client call --function set_rate --module my_swap --package 0xc2a78d59125c1127a51f1911531134720337a3387a4b7719f458fe2403d9c01b --args 0x79e0f09b498e22495b1be8c4d72df1b2bf98b89fd3d6722d96c632e29491fe43 0xcc3cab29a7237d1b95ce95928648e083f5cc790e2ab7993cafdc232e77e1c4ff 1000 --type-args 0xfc3cb012ecc8ff1a204023d037dbdce3f6460d239dba26786bc82815709ab8df::faucet_coin::FAUCET_COIN 0xfc3cb012ecc8ff1a204023d037dbdce3f6460d239dba26786bc82815709ab8df::mycoin::MYCOIN --gas-budget 50000000

# 换零钱
sui client split-coin --amounts 1000 --coin-id 0x59a2efbc7c625a15bd34611ddcdf173f736e889301f5e642669310335ddf7590 --gas-budget 50000000

#swapForB 
sui client call --function swapForB --module my_swap --package 0xc2a78d59125c1127a51f1911531134720337a3387a4b7719f458fe2403d9c01b --args 0x5115bef68352152d6d93161efb7c8e64e43d18e451ff22f9a853fa89804a81e5 0xcc3cab29a7237d1b95ce95928648e083f5cc790e2ab7993cafdc232e77e1c4ff --type-args 0xfc3cb012ecc8ff1a204023d037dbdce3f6460d239dba26786bc82815709ab8df::faucet_coin::FAUCET_COIN 0xfc3cb012ecc8ff1a204023d037dbdce3f6460d239dba26786bc82815709ab8df::mycoin::MYCOIN --gas-budget 50000000

# 刷新账户页面https://suiscan.xyz/testnet/account/0xc6f35ca58036272619a15c49f4815f378688729b87c2e1d220661a78be431813 能看到已经兑换出去了

# 取回钱

```

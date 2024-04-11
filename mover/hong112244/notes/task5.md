# Task 5 - 实现一个最简单的swap

主要功能是不依赖于第三方的物品交换，且在交换完成前，不允许对物品就行修改（知识点：dof, lock, escrow）

## 创建并项目
### 新建项目
```bash
sui move new myswap
```

### 构建、发布
```bash
sui move build
sui client publish --gas-budget=50000000 
```
得到结果：

packageid: 0x7f65c11f34a281ac3f64f99a24868e2ac76e7936befd7d0c8c47140f90c405a3

## 做交换
使用之前发布的nft合约，两个账户分别生成两个nft
### 账户准备
```bash
#两个nft:
#账户1/nft： 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 / 0xf04791a9191dc941fff2f987a9083f85f51eb72d8160005f6c581c079d4d91ff
#账户2/nft： 0xdca8c3f2d0089fd22e1951efb16bb38278ce56171a2c9d2f1bba0f67a0fd5a1e / 0xbdc039d437346f7208ce0bd2a2672dd3f33be7a72eb10f4dd32f2a0948326b20
```

### 交换
```bash
# 主账号锁定object
sui client call --function lock --module lock --package 0x7f65c11f34a281ac3f64f99a24868e2ac76e7936befd7d0c8c47140f90c405a3 --type-args 0x99f5ca55304382c18102ee89f9cc626f4c3160ac72e63211dc3d5e2eb279c450::devnet_nft::DevNetNFT --args 0xf04791a9191dc941fff2f987a9083f85f51eb72d8160005f6c581c079d4d91ff --gas-budget 50000000

# 得到 shared lock 和 key
# lock: 0xf531cd06d17a83ac1eb49be1359026023064cad710a1c2a8b7c2b52d5c288361 ObjectType: 0x7f65c11f34a281ac3f64f99a24868e2ac76e7936befd7d0c8c47140f90c405a3::lock::Locked<0x99f5ca55304382c18102ee89f9cc626f4c3160ac72e63211dc3d5e2eb279c450::devnet_nft::DevNetNFT>
# key: 0x45fc7b2f0cd3cfda73c26d4fa3ef197669f123218703bb76f66ef5d358a568dc ObjectType: 0x7f65c11f34a281ac3f64f99a24868e2ac76e7936befd7d0c8c47140f90c405a3::lock::Key 

# 切换账户， 创建交易
sui client switch --address 0xdca8c3f2d0089fd22e1951efb16bb38278ce56171a2c9d2f1bba0f67a0fd5a1e
# 账户2 创建交易请求
sui client call --function create --module escrow_swap --package 0x7f65c11f34a281ac3f64f99a24868e2ac76e7936befd7d0c8c47140f90c405a3 --type-args 0x99f5ca55304382c18102ee89f9cc626f4c3160ac72e63211dc3d5e2eb279c450::devnet_nft::DevNetNFT --args 0xbdc039d437346f7208ce0bd2a2672dd3f33be7a72eb10f4dd32f2a0948326b20 0x45fc7b2f0cd3cfda73c26d4fa3ef197669f123218703bb76f66ef5d358a568dc 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 --gas-budget 50000000

# 得到

# 切换账户，完成交易
sui client switch --address 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897
sui client call --function swap --module escrow_swap --package 0x7f65c11f34a281ac3f64f99a24868e2ac76e7936befd7d0c8c47140f90c405a3 --type-args 0x99f5ca55304382c18102ee89f9cc626f4c3160ac72e63211dc3d5e2eb279c450::devnet_nft::DevNetNFT 0x99f5ca55304382c18102ee89f9cc626f4c3160ac72e63211dc3d5e2eb279c450::devnet_nft::DevNetNFT --args 0xc9e1363163477ea2174f75f399763910c16f4d273f006e165e72178cff56ffc8 0x45fc7b2f0cd3cfda73c26d4fa3ef197669f123218703bb76f66ef5d358a568dc 0xf531cd06d17a83ac1eb49be1359026023064cad710a1c2a8b7c2b52d5c288361 --gas-budget 50000000


# 查看新的归属
sui client object 0xf04791a9191dc941fff2f987a9083f85f51eb72d8160005f6c581c079d4d91ff
sui client object 0xbdc039d437346f7208ce0bd2a2672dd3f33be7a72eb10f4dd32f2a0948326b20
```

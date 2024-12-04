### 用户准备
```
╭─────────┬────────────────────────────────────────────────────────────────────┬────────────────╮
│ alias   │ address                                                            │ active address │
├─────────┼────────────────────────────────────────────────────────────────────┼────────────────┤
│ Alice   │ 0x726354d2a0bfe6c411eaba7e6fad764eb081a37f553381b849b6533669ef1908 │                │
│ Bob     │ 0x802e0a55ad2837418bcc7bdfea39b0bddcbceb4bc68f263c50a50ccd7eb4650e │                │
│ Manager │ 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 │ *              │
╰─────────┴────────────────────────────────────────────────────────────────────┴────────────────╯
```
### 添加变量
```
PS C:\Users\dell> $MANAGER = "0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669"
PS C:\Users\dell> $ALICE = "0x726354d2a0bfe6c411eaba7e6fad764eb081a37f553381b849b6533669ef1908"
PS C:\Users\dell> $BOB = "0x802e0a55ad2837418bcc7bdfea39b0bddcbceb4bc68f263c50a50ccd7eb4650e"
```

### 部署合约
在Manager用户下发布合约
package_id:0xf737d38fa798d32dd0eeac709cbb3786ee4e0e9d3b6c6f55f7a35308bfce88ec
```
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xf737d38fa798d32dd0eeac709cbb3786ee4e0e9d3b6c6f55f7a35308bfce88ec                 │
│  │ Version: 1                                                                                    │
│  │ Digest: BtZkWLgMjWj5MYYqf3cEQSBauAgVWBxpPAkELekjCdmL                                          │
│  │ Modules: tic_tac_toc                                                                          │
│  └──                                                                                             │
```
记录到环境变量中
```
PS C:\Users\dell> $PACKAGE_ID = "0xf737d38fa798d32dd0eeac709cbb3786ee4e0e9d3b6c6f55f7a35308bfce88ec"
```
### 创建游戏
在Manager用户下创建游戏
```
sui client call --package $PACKAGE_ID --module tic_tac_toc --function create_game --args $ALICE $BOB --gas-budget 30000000
```
```shell
│ Created Objects:                                                                                             │
│  ┌──                                                                                                         │
│  │ ObjectID: 0x0fd55bb2bcef4ab23e66651421f72339df6e91f29e0f1537a5e7d69b082256c2                              │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                │
│  │ Owner: Account Address ( 0x802e0a55ad2837418bcc7bdfea39b0bddcbceb4bc68f263c50a50ccd7eb4650e )             │
│  │ ObjectType: 0xf737d38fa798d32dd0eeac709cbb3786ee4e0e9d3b6c6f55f7a35308bfce88ec::tic_tac_toc::MarkMintCap  │
│  │ Version: 1223436                                                                                          │
│  │ Digest: DzmCp5zEswpksqyYB795vuxdZqaJwqN9ZdTsAnTJhNMw                                                      │
│  └──                                                                                                         │
│  ┌──                                                                                                         │
│  │ ObjectID: 0x20ca1ada3981e2971dff530affc8f9d802d33b2ca0cd7b14ae3138f9df6fb7f0                              │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                │
│  │ Owner: Account Address ( 0x726354d2a0bfe6c411eaba7e6fad764eb081a37f553381b849b6533669ef1908 )             │
│  │ ObjectType: 0xf737d38fa798d32dd0eeac709cbb3786ee4e0e9d3b6c6f55f7a35308bfce88ec::tic_tac_toc::MarkMintCap  │
│  │ Version: 1223436                                                                                          │
│  │ Digest: 5qBMPc4PRcUXjXvsJ3UMq4fwGCeaSqEY62QtBeXZ6m5f                                                      │
│  └──                                                                                                         │
│  ┌──                                                                                                         │
│  │ ObjectID: 0xaf79b272508d11dc2032f7c47a159f168657e1f3e5d697ed3aa6a8d3701f1ed3                              │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )             │
│  │ ObjectType: 0xf737d38fa798d32dd0eeac709cbb3786ee4e0e9d3b6c6f55f7a35308bfce88ec::tic_tac_toc::TicTacToe    │
│  │ Version: 1223436                                                                                          │
│  │ Digest: 6yF2QjgXBGSmp6XnxDvcgiV66mmr1pGjbEubZMfWz8v3                                                      │
│  └──                                                                                                         │
```
添加到环境变量中
```shell
PS C:\Users\dell> $GAME = "0xaf79b272508d11dc2032f7c47a159f168657e1f3e5d697ed3aa6a8d3701f1ed3"
PS C:\Users\dell> $MARK_MINT_CAP_ALICE_X = "0x20ca1ada3981e2971dff530affc8f9d802d33b2ca0cd7b14ae3138f9df6fb7f0"
PS C:\Users\dell> $MARK_MINT_CAP_BOB_O = "0x0fd55bb2bcef4ab23e66651421f72339df6e91f29e0f1537a5e7d69b082256c2"
```
查看游戏
```shell
PS C:\Users\dell> sui client object $GAME
```
```shell
 o_address   │  0x802e0a55ad2837418bcc7bdfea39b0bddcbceb4bc68f263c50a50ccd7eb4650e           
 x_address   │  0x726354d2a0bfe6c411eaba7e6fad764eb081a37f553381b849b6533669ef1908           
```
### 玩家创建标记对象
切换到Alice
```shell
PS C:\Users\dell> sui client switch --address Alice
Active address switched to 0x726354d2a0bfe6c411eaba7e6fad764eb081a37f553381b849b6533669ef1908
PS C:\Users\dell> sui client addresses
╭─────────┬────────────────────────────────────────────────────────────────────┬────────────────╮
│ alias   │ address                                                            │ active address │
├─────────┼────────────────────────────────────────────────────────────────────┼────────────────┤
│ Alice   │ 0x726354d2a0bfe6c411eaba7e6fad764eb081a37f553381b849b6533669ef1908 │ *              │
│ Bob     │ 0x802e0a55ad2837418bcc7bdfea39b0bddcbceb4bc68f263c50a50ccd7eb4650e │                │
│ Manager │ 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 │                │
╰─────────┴────────────────────────────────────────────────────────────────────┴────────────────╯
```
```
sui client call --package $PACKAGE_ID --module tic_tac_toc --function send_mark_to_game --args $MARK_MINT_CAP_ALICE_X $MANAGER 0 0 --gas-budget 30000000
```
```
│ Created Objects:                                                                                             │
│  ┌──                                                                                                         │
│  │ ObjectID: 0x514faafd18727d70d57020aa687b0bbf3c7ec91a53a8bf19feb69023662332cb                              │
│  │ Sender: 0x726354d2a0bfe6c411eaba7e6fad764eb081a37f553381b849b6533669ef1908                                │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )             │
│  │ ObjectType: 0xf737d38fa798d32dd0eeac709cbb3786ee4e0e9d3b6c6f55f7a35308bfce88ec::tic_tac_toc::Mark         │
│  │ Version: 1223437                                                                                          │
│  │ Digest: GDF11VAmxfeKtHaSPcWBFJXarBxg2ZjNvTGq2NagD4ta                                                      │
│  └──                                                                                                         │
```
记录玩家Alice的x的mark_id
```
PS C:\Users\dell\Desktop> $MARK_ALICE_X = "0x514faafd18727d70d57020aa687b0bbf3c7ec91a53a8bf19feb69023662332cb"
```
切到Manager
```shell
PS C:\Users\dell\Desktop> sui client call --package $PACKAGE_ID --module tic_tac_toc --function place_mark --args $GAME $MARK_ALICE_X --gas-budget 10000000
```

## 交替出棋····
### Bob 出棋
切换到Bob
```
PS C:\Users\dell\Desktop> sui client call --package $PACKAGE_ID --module tic_tac_toc --function send_mark_to_game --args $MARK_MINT_CAP_BOB_O $MANAGER 1 2 --gas-budget 30000000
```
记录玩家Bob的o的mark_id
```
PS C:\Users\dell\Desktop> $MARK_BOB_O = "0xcd0ee1d6529bfd9a60507de15d14bab03d8b2c75e6c2a3207b5337071d3cbe30"
```
切到Manager
```shell
PS C:\Users\dell\Desktop> sui client call --package $PACKAGE_ID --module tic_tac_toc --function place_mark --args $GAME $MARK_BOB_O --gas-budget 10000000
```
### Alice 出棋
切换到Alice
```shell
PS C:\Users\dell\Desktop> sui client call --package $PACKAGE_ID --module tic_tac_toc --function send_mark_to_game --args $MARK_MINT_CAP_ALICE_X $MANAGER 1 1 --gas-budget 30000000
```
记录玩家Alice的x的mark_id
```shell
PS C:\Users\dell\Desktop> $MARK_ALICE_X = "0xc6757ac47440d6b1f76aed1a36401edc04a6b8021e097ddbb2b8b3aea015fdd4"
```
切到Manager
```shell
PS C:\Users\dell\Desktop> sui client call --package $PACKAGE_ID --module tic_tac_toc --function place_mark --args $GAME $MARK_ALICE_X --gas-budget 10000000
```
### Bob 出棋
切换到Bob
```shell
PS C:\Users\dell\Desktop> sui client call --package $PACKAGE_ID --module tic_tac_toc --function send_mark_to_game --args $MARK_MINT_CAP_BOB_O $MANAGER 0 1 --gas-budget 30000000
```
记录Bob的Mark_Id
```shell
PS C:\Users\dell\Desktop> $MARK_BOB_O = "0x9a781cb3dc8ccabe941b6a1efa93e9b138fdfff50e92d5723c148a15b54f26cf"
```
切换到Manager
```shell
sui client call --function place_mark --package $PACKAGE_ID --module tic_tac_toc --args $GAME $MARK_BOB_O --gas-budget 10000000
```

### Alice 出棋（最后一棋）
切换到Alice
```shell
PS C:\Users\dell\Desktop> sui client call --package $PACKAGE_ID --module tic_tac_toc --function send_mark_to_game --args $MARK_MINT_CAP_ALICE_X $MANAGER 2 2 --gas-budget 30000000
```
记录玩家Alice的x的mark_id
```shell
PS C:\Users\dell\Desktop> $MARK_ALICE_X = "0xabc0a831526eb070803b680bd9be07b2eaf613c974bed67d52be7b3d3d5e4d00"
```
切换到Manager
```shell
PS C:\Users\dell\Desktop> sui client call --package $PACKAGE_ID --module tic_tac_toc --function place_mark --args $GAME $MARK_ALICE_X --gas-budget 10000000
```
# 冠军诞生
```shell
│ Created Objects:                                                                                           │
│  ┌──                                                                                                       │
│  │ ObjectID: 0xfc0fdc5f356c6160ae302516ce1d3e568fd5ae4539acf411aa02d330c6b54e67                            │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                              │
│  │ Owner: Account Address ( 0x726354d2a0bfe6c411eaba7e6fad764eb081a37f553381b849b6533669ef1908 )           │
│  │ ObjectType: 0xf737d38fa798d32dd0eeac709cbb3786ee4e0e9d3b6c6f55f7a35308bfce88ec::tic_tac_toc::Trophy     │
│  │ Version: 1223442                                                                                        │
│  │ Digest: 65p2h37APNCokrFpN7TrwrXKVrasHZwc8XvaYJ4tfK4c                                                    │
│  └──                                                                                                       │
```

# 删除游戏
切换到Manager
```shell
PS C:\Users\dell\Desktop> sui client call --function delete_game --package $PACKAGE_ID --module tic_tac_toc --args $GAME --gas-budget 10000000
Transaction Digest: 3KmMmUsUTFiQKaKWuSvFkJbytmkNd1ispc9ffiwiqFYc
```
查找游戏
```shell
PS C:\Users\dell\Desktop> sui client object $GAME
[warn] Client/Server api version mismatch, client api version : 1.22.0, server api version : 1.23.1
Internal error, cannot read the object: Object has been deleted object_id: 0xaf79b272508d11dc2032f7c47a159f168657e1f3e5d697ed3aa6a8d3701f1ed3 at version: SequenceNumber(1223443) in digest o#7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz
```
游戏已删除

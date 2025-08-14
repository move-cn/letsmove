# Task 3 - sui nft

## 新建项目
新建项目
```bash
sui move new task3
```

构建、发布
```bash
sui move build
sui client publish --gas-budget=50000000 
```

输出：
```
    packageid： 0xe4e1fb9a8bf5dc2017f7ca6d7f4181b1fe7067578495e2ef612d82f6ab87c510
```

## mint&transfer
```bash
#铸造
sui client call --function mint_to_sender --module my_nft --package 0xe4e1fb9a8bf5dc2017f7ca6d7f4181b1fe7067578495e2ef612d82f6ab87c510 --args "avatar1" "twitter avatar1" "https://pbs.twimg.com/profile_images/1769108278531821569/ZOQ0Mrx5_200x200.jpg" --gas-budget 50000000

#查看object信息
sui client object 0x5f3697378f9fbb03eee8449bfe67ed9dbfd3a839a6c9fc66534c8cdfa89a8496

sui client call --function mint_to_sender --module my_nft --package 0xe4e1fb9a8bf5dc2017f7ca6d7f4181b1fe7067578495e2ef612d82f6ab87c510 --args "avatar2" "twitter avatar2" "https://pbs.twimg.com/profile_images/1306422968680148993/PvueXOSO_normal.jpg" --gas-budget 50000000

#0x643e08ae93ad3656f127efe6323528010267edd0ba3b73759678ccfda32f052c
# 把avatar2转给0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
sui client call --function transfer --module my_nft --package 0xe4e1fb9a8bf5dc2017f7ca6d7f4181b1fe7067578495e2ef612d82f6ab87c510 --args 0x643e08ae93ad3656f127efe6323528010267edd0ba3b73759678ccfda32f052c 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

# 查看归属
sui client object 0x643e08ae93ad3656f127efe6323528010267edd0ba3b73759678ccfda32f052c
```

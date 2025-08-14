## task3

```
packedid = 0xfca9480f818801238579b88466c23376c18db6203d634729b9c87e185dde0cc2
TO_ADDRESS=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
name = "ocrand demo"
url = "https://github.com/Ocrand/ocrand.github.io/blob/main/css/images/banner.jpg"
```

发送nft

```
sui client call --package 0xfca9480f818801238579b88466c23376c18db6203d634729b9c87e185dde0cc2 --module my_nft --function mint_to_sender --args "ocrand demo" "blockchain is fun" "https://github.com/Ocrand/ocrand.github.io/blob/main/css/images/banner.jpg" --gas-budget 50000000
```

```
#构造
sui client call --package 0xfca9480f818801238579b88466c23376c18db6203d634729b9c87e185dde0cc2 --module my_nft --function mint_to_sender --args "ocrand demo" "blockchain is fun" "https://github.com/Ocrand/ocrand.github.io/blob/main/css/images/banner.jpg" --gas-budget 50000000

#查看object信息
sui client object 0xfc5150ef30efddc92a3fef45a5b88f758502bc9b4e28568423ab07066e59690c

#0x643e08ae93ad3656f127efe6323528010267edd0ba3b73759678ccfda32f052c
# 把ocrand demo转给0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
sui client call  --package 0xfca9480f818801238579b88466c23376c18db6203d634729b9c87e185dde0cc2 --function transfer --module my_nft --args 0xfc5150ef30efddc92a3fef45a5b88f758502bc9b4e28568423ab07066e59690c 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

# 查看归属
sui client object 0x643e08ae93ad3656f127efe6323528010267edd0ba3b73759678ccfda32f052c
```


##Package ID: 0xd092b6a785ba47f7c158b8f22e62c733227646e05350e604437a304f8059d531
##mint nft
sui client call --function mint --module display_nft  --package 0xd092b6a785ba47f7c158b8f22e62c733227646e05350e604437a304f8059d531 --args "BOOM" "https://avatars.githubusercontent.com/u/36094328?v=4"

##transfer nft to another address
sui client transfer --object-id 0x2c58a784423a64ae68e0814d166a543d7d37a032f5dae0a7452253cbc030c7dd --to 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

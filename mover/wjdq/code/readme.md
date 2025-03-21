sui client call --package 0x2 --module coin --function mint_and_transfer \
--type-args 0xe4678e82a0fd385064989fa25e9175168baa2a3a00509b6d0cdbe6257059e6a2::wjdq_coin::WJDQ_COIN \
--args 0x0a622f2f2c3d4991545429a0e84f9b8ed6ecc6fdf73fb2f7e38ec4646b7072c8 1000000000
0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0xe4678e82a0fd385064989fa25e9175168baa2a3a00509b6d0cdbe6257059e6a2::wjdq_faucet::WJDQ_FAUCET \
--args 0xfad6d63eeb8a50d5353b068612bbe9c2091a7bd83220f93700e8d4d37195f955 10000000000
0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

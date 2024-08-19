#!/bin/bash

wallet=0xfd72aa1c93c65b9487ca060a32bff2851624117d35078f54618384b1e0d16849

#sui client publish --skip-dependency-verification
AdminCap=0x78d382617454da07f45ac6b6b5ca0b200272509a9c0edbab04663ff8604997ba
PackageID=0xdf519760886ddb5b03c7db25f0acb0204d24d27c9d06946f78f50384014ac7aa
Bank=0x920a94b692a81f0888eb7adc70e6a26d1cb775a4c45ed7ce9e562eac6347ae77


# Get USD (m4sk93_coin)
#sui client call --function mint --module m4sk93_coin --package 0x38974bd3a9dad0e8274024b49642e2f0fa94fc4889219791e3742c8730528fd0\
#                --args 0x5eeffd6ca1fb38d63701ea8e1a3c1f3bff348441aec0a1eeae45f023eb62d120 10000000000 $wallet --gas-budget 5000000
#
usd=0x710395d1fd052e4070e41362618f41eb9b6d1b4216f08f02ac638a43484668be

# Get RMB (m4sk93_faucet_coin)
#sui client call --function mint --module m4sk93_faucet_coin --package 0xe799e4d1324db8877c827cb4ca78dc065a8f9ef70fbe705e4c8c37250e195982\
#                --args 0xaa6391b1bd2e95cd3d10418c540c79c4aac371677aa9e4c6f54c6551a48cc38e 10000000000 $wallet --gas-budget 5000000
rmb=0xdb85d130dc40cc1d3265aa2f6972b433bc4c682648a82535e1356459c1e3ccf1

# deposit RMB & USD
#sui client call --package $PackageID \
#                --module m4sk93_swap \
#                --function deposit_RMB \
#                --args $Bank $rmb \
#                --gas-budget 5000000
#
#
#sui client call --package $PackageID \
#                --module m4sk93_swap \
#                --function deposit_USD \
#                --args $Bank $usd \
#                --gas-budget 5000000

# Get USD to swap
#sui client call --function mint --module m4sk93_coin --package 0x38974bd3a9dad0e8274024b49642e2f0fa94fc4889219791e3742c8730528fd0\
#                --args 0x5eeffd6ca1fb38d63701ea8e1a3c1f3bff348441aec0a1eeae45f023eb62d120 200000000 $wallet --gas-budget 5000000

usd200=0x4203e4aec8b9c0868ce8021175e6e083fd0a5555b3b8b090ee5442b7d5bea2bd

# swap usd to rmb
#sui client call --package $PackageID \
#                --module m4sk93_swap \
#                --function swap_usd2rmb \
#                --args $Bank $usd200 \
#                --gas-budget 5000000
#https://suiscan.xyz/mainnet/tx/9atm2zXNF2PEwfq5jUMvQLM3VwmGx4XuzQdvLdRLZmRS
rmb1400=0x8e8e05df3921e89cdd1cb36ebb6801361248a0567ea0238f0c9e8266075d7520

# swap rmb to usd
sui client call --package $PackageID \
                --module m4sk93_swap \
                --function swap_rmb2usd \
                --args $Bank $rmb1400 \
                --gas-budget 5000000
https://suiscan.xyz/mainnet/tx/7hGAPDFroEq2d81Haw7yGn2kXQ2YxkotCjkNHZJRe6oy
# final usd: 0x7fded1bd15480b4b18fa1a9355a0a1a9694c033cdb1e2dd9b456ac416c2780a0

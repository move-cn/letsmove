# testnet package id: 0x586cd3af1a22322f864d4f97aeb94287918e4e8cfe5f82906419ecef0e2df04a
# testnet cap id: 0x32a2791d9b178437818860007013a5c4250cf771b2091c04267c46a604e88718
# mainnet package id: 0x0e603bb721b3b1c12aeb5e7e0240c9ff5e2779092e0961455ee93669c78123d0
# mainet cap id: 0xf970dde8a8ebccca86f7d042e27aa2ec0366fcb3b263b99a7d1c12fb9e492216

# testnet
# sui client call  \
# --package 0x586cd3af1a22322f864d4f97aeb94287918e4e8cfe5f82906419ecef0e2df04a \
# --module faucetcoin \
# --function mint \
# --args 0x32a2791d9b178437818860007013a5c4250cf771b2091c04267c46a604e88718 2000 0xd0ebca2f6c037a5dbc4ff544900d63eb822376d5d7b3d16de88c3d2e8e4dd73a


# miannet
sui client call  \
--package 0x0e603bb721b3b1c12aeb5e7e0240c9ff5e2779092e0961455ee93669c78123d0 \
--module faucetcoin \
--function mint \
--args 0xf970dde8a8ebccca86f7d042e27aa2ec0366fcb3b263b99a7d1c12fb9e492216 $1 0xd0ebca2f6c037a5dbc4ff544900d63eb822376d5d7b3d16de88c3d2e8e4dd73a
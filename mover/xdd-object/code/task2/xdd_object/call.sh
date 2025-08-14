sui client call --package 包名 --module 模块名 --function 方法名 --args 权限id(TreasuryCap对应的id) 金额


sui client call --package 0xba67f9e412da95fa110516926ce34257b1f988240ec2f6fd08fbe512c8ce45a8 --module xdd_object --function mint_xdd_object --args 0xc93bc1e5ef92f68148a602b53dc65d39a3cf6e6a18d9cf6337e6de5c340a7ce5 1000000000000




#铸币，只有自己有权限
sui client call --package 0x2 --module coin --function mint_and_transfer \
 --type-args 0x7e81cbf616ef12f9049ede655c0d9ee31283fbe8f15067f749b010c40c280d76::usd::USD \
 --args 0x8ea7753c31670fe2ab6042901c13ed2b174b420ee09b7f16482531080cef831b 10000000000 0x0c651eb9cd6ffa4928b5a9481f09591834a68f452cfbb8932cd6ac3643a61eb2

#usd
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args 0x7e81cbf616ef12f9049ede655c0d9ee31283fbe8f15067f749b010c40c280d76::usd::USD  --args 0x8ea7753c31670fe2ab6042901c13ed2b174b420ee09b7f16482531080cef831b 10000000000 0x0c651eb9cd6ffa4928b5a9481f09591834a68f452cfbb8932cd6ac3643a61eb2

#铸币，所有人都有权限
#sui client call --package 包名 --module 模块名 --function 方法名 --type-args 币种 --args 权限id(TreasuryCap对应的id) 金额 地址

sui client call --package 0x2 --module coin --function mint_and_transfer --type-args 0x5eb4ac5d056728b852c659eb39c3cccc787568727f66ae246095530dcb17da80::rmb::RMB  --args 0x302296d929561950c86c95f7b5df3c7c89288dd72f2adbda8c5e8a3a8570ae4d 10000000000 0x0c651eb9cd6ffa4928b5a9481f09591834a68f452cfbb8932cd6ac3643a61eb2




# 正式环境
sui client call --package 0x2cdd34202d285b2f4579955b57cb29cfd1c7ac9178cdc0d8424e47eb0c7a4016 --module xdd_object --function mint_xdd_object --args 0xd0df52564401b64c96a88f29751297cf8213658800a427e7c2a78b57d6ecf5ac 100000000000



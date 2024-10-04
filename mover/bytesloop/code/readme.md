
- 创建项目 - sui move new hello_move
- 发布上链 - sui client publish 
- 调用合约 - sui client call --package 0x90f7990609a98035510af1a81f183f77c8d1c8bfd11148fc33b4a7d78d96c25d --module task1_hello_bytesloop --function init 
- 铸造BMC代币 - sui client call --package 0x603c23f1529f80fe07aa0f0e63c42780de82f2d18089f6369519b4886efa22c6 --module byte_move_coin --function mint  --args 0xc3a7d9817d8792302abd2f77122be820e633c423cfc1a8428dbc8f912014fcbc 10000 0x51479dc0018ee6664b280c84b55dc31dad66911067968a4e0b4685314b183d56 (小数位是2, 10000最后会等于 100)
- 铸造BFC代币 - sui client call --package 0x603c23f1529f80fe07aa0f0e63c42780de82f2d18089f6369519b4886efa22c6 --module byte_faucet_coin --function mint  --args 0x07f35029c8458cb5b8c6628574a03b8ab07aed0bd58005f2d44f202e978306c7 10000 0x51479dc0018ee6664b280c84b55dc31dad66911067968a4e0b4685314b183d56 (在线领取 https://suiscan.xyz/testnet/object/0x603c23f1529f80fe07aa0f0e63c42780de82f2d18089f6369519b4886efa22c6/contracts)
- mint nft - sui client call --package 0x193452b4288caed0e35a8a1470753d722e41ece22d8da082183179fd2896db83 --module bytesloop_nft --function mint  --args BYTESLOOPNFT "https://avatars.githubusercontent.com/u/2389412?v=4"

## task4_move_game

- 发布上链 - sui client publish  --skip-dependency-verification
- PackageID: 0x7797f82b4284b393f7a4add26439cc8bac3147bd96a4d077fed33cecc41c4c36
- AdminCap: 0x6e0d14106ec3f628773c815396765ac2cf7cdcf13d462902c2295db9c49c4a5a
- Game: 0xc90108000890fe94cf334ffa7808c624c845a3408cd449c9910d8f32a7858481
- Get Faucet Coin: sui client call --package 0x7797f82b4284b393f7a4add26439cc8bac3147bd96a4d077fed33cecc41c4c36 --module bytesloop_game --function get_faucet_coin --args 0x07f35029c8458cb5b8c6628574a03b8ab07aed0bd58005f2d44f202e978306c7 1000000000 
- Deposit: sui client call --package 0x7797f82b4284b393f7a4add26439cc8bac3147bd96a4d077fed33cecc41c4c36 --module bytesloop_game --function deposit --args 0xc90108000890fe94cf334ffa7808c624c845a3408cd449c9910d8f32a7858481 0xb0cb8b97e8f8b807f98ee9e66bf254348d504cc7792f393b66033a764f206254 500000000 
- Play:　sui client call --package 0x7797f82b4284b393f7a4add26439cc8bac3147bd96a4d077fed33cecc41c4c36 --module bytesloop_game --function play --args 2 0xc90108000890fe94cf334ffa7808c624c845a3408cd449c9910d8f32a7858481 0x9c76d90e10a99159ead35857ce08cc76008bd3ad9bfa608acc223597d862bf10 0x6 


## task5_move_swap

- 发布上链 - sui client publish  --skip-dependency-verification
- PackageID: 0x29cd0bf0b0cc54132acbf0cdae4bd21ce15e29a46d9acd2fcecdbca85d8c7258
- AdminCap: 0xe775fbed2789ec27c709d5fe84c16bd8ed07271250e55650b77380856b6897d3
- Bank: 0x3ada5d09b7132bf3582fb7f7a13dab8f1c9a65d97000fdec6d70ddbdee51c4dc

- 获取并存入1亿USD和1亿RMB
- Get USD (byte_move_coin) - sui client call --package 0x603c23f1529f80fe07aa0f0e63c42780de82f2d18089f6369519b4886efa22c6 --module byte_move_coin --function mint --args 0xc3a7d9817d8792302abd2f77122be820e633c423cfc1a8428dbc8f912014fcbc 10000000000 0x51479dc0018ee6664b280c84b55dc31dad66911067968a4e0b4685314b183d56 --gas-budget 5000000
- USD ObjectID - 0xe1908265b80b72542d1374af2d0b781d397cc88cc42a6df8d7e5a0fc7f13736a
- Get RMB (byte_faucet_coin) - sui client call --package 0x603c23f1529f80fe07aa0f0e63c42780de82f2d18089f6369519b4886efa22c6 --module byte_faucet_coin --function mint --args 0x07f35029c8458cb5b8c6628574a03b8ab07aed0bd58005f2d44f202e978306c7 10000000000 0x51479dc0018ee6664b280c84b55dc31dad66911067968a4e0b4685314b183d56 --gas-budget 5000000
- RMB ObjectID - 0x8f4b44726d2a83223db2e4316c2431d597703e9037b9fcad6efe7af2ca999785
- Deposit USD - sui client call --package 0x29cd0bf0b0cc54132acbf0cdae4bd21ce15e29a46d9acd2fcecdbca85d8c7258 --module bytesloop_swap --function deposit_USD --args 0x3ada5d09b7132bf3582fb7f7a13dab8f1c9a65d97000fdec6d70ddbdee51c4dc 0xe1908265b80b72542d1374af2d0b781d397cc88cc42a6df8d7e5a0fc7f13736a --gas-budget 5000000
- Deposit RMB - sui client call --package 0x29cd0bf0b0cc54132acbf0cdae4bd21ce15e29a46d9acd2fcecdbca85d8c7258 --module bytesloop_swap --function deposit_RMB --args 0x3ada5d09b7132bf3582fb7f7a13dab8f1c9a65d97000fdec6d70ddbdee51c4dc 0x8f4b44726d2a83223db2e4316c2431d597703e9037b9fcad6efe7af2ca999785 --gas-budget 5000000

- Get USD to swap - sui client call --package 0x603c23f1529f80fe07aa0f0e63c42780de82f2d18089f6369519b4886efa22c6 --module byte_move_coin --function mint --args 0xc3a7d9817d8792302abd2f77122be820e633c423cfc1a8428dbc8f912014fcbc 200000000 0x51479dc0018ee6664b280c84b55dc31dad66911067968a4e0b4685314b183d56 --gas-budget 5000000 (
Object ID - 0xd6240a8aa63169c0fdc868fc30ff45312c1aa56fcfd6b2249547182e59183468)
- swap usd to rmb - sui client call --package 0x29cd0bf0b0cc54132acbf0cdae4bd21ce15e29a46d9acd2fcecdbca85d8c7258 --module bytesloop_swap --function swap_usd2rmb --args 0x3ada5d09b7132bf3582fb7f7a13dab8f1c9a65d97000fdec6d70ddbdee51c4dc 0xd6240a8aa63169c0fdc868fc30ff45312c1aa56fcfd6b2249547182e59183468 --gas-budget 5000000
- https://suiscan.xyz/testnet/tx/C3znaEcZTqiqtaVCfwMxip7DvbkhCewYcDkYiaT1wgMF  RMB ObjectID: 0xe7ef4ecfc81cb4b5f1da57963b9c9e3b37a4e921c9ea5d16bbab312e2776abd1
- swap rmb to usd - sui client call --package 0x29cd0bf0b0cc54132acbf0cdae4bd21ce15e29a46d9acd2fcecdbca85d8c7258 --module bytesloop_swap --function swap_rmb2usd --args 0x3ada5d09b7132bf3582fb7f7a13dab8f1c9a65d97000fdec6d70ddbdee51c4dc 0xe7ef4ecfc81cb4b5f1da57963b9c9e3b37a4e921c9ea5d16bbab312e2776abd1 --gas-budget 5000000
- https://suiscan.xyz/testnet/tx/9zr3rEQabQfyn94gFZtEDM6SUUqgd32ftgkKVzdWiU9o  USD ObjectID: 0xd57fd1ecf6f9957ddd4ae9745454ce471dabf037c636616bf941d8da154dae6b


## task7_move_ctf_check_in

- check_in.move - https://github.com/move-cn/letsmove-ctf/blob/main/src/01_check_in/check_in/sources/check_in.move
- 合约部署地址: https://testnet.suivision.xyz/package/0x60695ee31f93add1f79909c884a55dff7e5f140bbd2e495819966bd2f7971d42
- FlagStr: https://testnet.suivision.xyz/object/0x011f9404e6f167e549b617a53eea058029167a2beac26c624cbc3550e04b5ad2 (rW~-fs`.8E:-E'7LZWqCj5) 每次执行成功都会更新FlagStr
- random: 0x8
- github id: bytesloop
- CLI call: sui client call --package 0x60695ee31f93add1f79909c884a55dff7e5f140bbd2e495819966bd2f7971d42 --module check_in --function get_flag --args "rW~-fs`.8E:-E'7LZWqCj5" "bytesloop" 0x011f9404e6f167e549b617a53eea058029167a2beac26c624cbc3550e04b5ad2 0x8 --gas-budget 10000000


## task8_move_ctf_pow

- lets_move.move - https://github.com/move-cn/letsmove-ctf/blob/main/src/02_lets_move/lets_move/sources/lets_move.move
- 合约部署地址: https://testnet.suivision.xyz/package/0x097a3833b6b5c62ca6ad10f0509dffdadff7ce31e1d86e63e884a14860cedc0f
- Challenge Object: https://testnet.suivision.xyz/object/0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9 (uMKz'lr#*kw][z/CAvOZ)
- random: 0x8
- github id: bytesloop
- CLI call: sui client call --package 0x097a3833b6b5c62ca6ad10f0509dffdadff7ce31e1d86e63e884a14860cedc0f --module lets_move --function get_flag --args 6d2f21242436127de875 "bytesloop" 0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9 0x8 --gas-budget 10000000
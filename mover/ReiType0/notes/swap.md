## 5

`testnet`

sui client publish --gas-budget 200000000

export COIN_TYPE=0xe9cdb5b80e106d019280abbe2279b0c1016bbe7f50c9efb6d67341268e8ec4b1::reitype0_coin::REITYPE0_COIN

export FAUCET_TYPE=0xe9cdb5b80e106d019280abbe2279b0c1016bbe7f50c9efb6d67341268e8ec4b1::reitype0_faucet_coin::REITYPE0_FAUCET_COIN

export TASK5_PACKAGE_ID=0x9677604e30d41a9aff4183402a711b32805fe1d483537bc8964ed5acdeb7b995

export TASK2_PACKAGE_ID=0xe9cdb5b80e106d019280abbe2279b0c1016bbe7f50c9efb6d67341268e8ec4b1

export FAUCET_TREA_ID=0x9c20de70705a79609a6c4670e1a167b554a7361e999cbdc772121176ae2f9ac1

export COIN_TREA_ID=0x14508f4839a22560b7d11c7701c87b6e51997ad7c09ccff7b83768cd3dbf45e8

export MY_ADDRESS=0x408c61cb7202b236832bfb88ac559574062dedff254d4a567fe405b3564598c2

sui client call --gas-budget 7500000 --package $TASK2_PACKAGE_ID --module reitype0_coin --function mint --args $COIN_TREA_ID 1000 $MY_ADDRESS

export COIN_ID_1=0xc4003ba010f91ebd9f416df76808e93db9f467e665120a89345621e98abe5130

sui client call --gas-budget 7500000 --package $TASK2_PACKAGE_ID --module reitype0_faucet_coin --function mint --args $FAUCET_TREA_ID 1000 $MY_ADDRESS

export FAUCET_ID_1=0x2b825b163276a2d3c426c5e4ac9c0062f2410000fd3dbc816c1d1ea4fabf1203

sui client call --gas-budget 7500000 --package $TASK5_PACKAGE_ID --module reitype0_swap --function create_pool --type-args $COIN_TYPE $FAUCET_TYPE --args $COIN_ID_1 $FAUCET_ID_1

export POOL_ID=0x312449ab71239b753b3f483d372a46b965cb2908fe8348e998cf23246debfbc6

sui client call --gas-budget 7500000 --package $TASK2_PACKAGE_ID --module reitype0_coin --function mint --args $COIN_TREA_ID 1000 $MY_ADDRESS

export COIN_ID_2=0x84b88b31797c6f938bee454d5fbd91abb161dec2f7af4eebc10992f9a701bd21

sui client call --gas-budget 7500000 --package $TASK5_PACKAGE_ID --module reitype0_swap --function swap_a_to_b --type-args $COIN_TYPE $FAUCET_TYPE --args $POOL_ID $COIN_ID_2

check the swap transaction at [2omAj625enpfrwAyF4UUKeYfvnsLMPrsU45zo1ySfPue](https://testnet.suivision.xyz/txblock/2omAj625enpfrwAyF4UUKeYfvnsLMPrsU45zo1ySfPue)

after test passed on test net, next redo it on mainnet

`mainnet`

sui client publish --gas-budget 200000000

export COIN_TYPE=0xf834ecdcd1be5361d6aebbf79c58ce43eb1cae67939cc1d0713562f28225cc3a::reitype0_coin::REITYPE0_COIN

export FAUCET_TYPE=0xf834ecdcd1be5361d6aebbf79c58ce43eb1cae67939cc1d0713562f28225cc3a::reitype0_faucet_coin::REITYPE0_FAUCET_COIN

export TASK2_PACKAGE_ID=0xf834ecdcd1be5361d6aebbf79c58ce43eb1cae67939cc1d0713562f28225cc3a

export FAUCET_TREA_ID=0x49257cfc700e40537c40f06d68a6bf046dde78a3659a666dc7144e8940427224

export COIN_TREA_ID=0xd3dd0a75d40f55081c8c1b37b788e49c793faebd234a6b8f6919230b3590eb9d

export TASK5_PACKAGE_ID=0x0be58ebe0778486302657e16d516ec3501a0318dedf8d37f12ae0eea1867d721

export MY_ADDRESS=0x408c61cb7202b236832bfb88ac559574062dedff254d4a567fe405b3564598c2

sui client call --gas-budget 7500000 --package $TASK2_PACKAGE_ID --module reitype0_coin --function mint --args $COIN_TREA_ID 1000 $MY_ADDRESS

export COIN_ID_1=0x9b315827145e26b11aaad17208de8389269fb464f4b53ba0e5b0dea1bc40226e

sui client call --gas-budget 7500000 --package $TASK2_PACKAGE_ID --module reitype0_faucet_coin --function mint --args $FAUCET_TREA_ID 1000 $MY_ADDRESS

export FAUCET_ID_1=0x4c59b534aa423699341414a5c486818ed6859c9b5caabe8b0a2f657b5c2632ae

sui client call --gas-budget 7500000 --package $TASK5_PACKAGE_ID --module reitype0_swap --function create_pool --type-args $COIN_TYPE $FAUCET_TYPE --args $COIN_ID_1 $FAUCET_ID_1

export POOL_ID=0x4a4f2150858fc92d8f470e270e19aa8ba7fb92b2425b7c099d69655e24cf29b6

sui client call --gas-budget 7500000 --package $TASK2_PACKAGE_ID --module reitype0_coin --function mint --args $COIN_TREA_ID 1000 $MY_ADDRESS

export COIN_ID_2=0x0b03f97856eef0a888bd04114e53cd081d5e13e255454bf59edda8baaec09512

sui client call --gas-budget 7500000 --package $TASK5_PACKAGE_ID --module reitype0_swap --function swap_a_to_b --type-args $COIN_TYPE $FAUCET_TYPE --args $POOL_ID $COIN_ID_2

check the swap transaction at [DKUN81sE4Lbc6MXGpC9yPAuSs9yPEEKB3HiwjPzZ9EJF](https://suivision.xyz/txblock/DKUN81sE4Lbc6MXGpC9yPAuSs9yPEEKB3HiwjPzZ9EJF)

思路是，先将task5的swap上链，再使用task2中的coin和faucet铸造币，使用它们调用task5的swap中的方法创造pool，这时候再铸造一枚coin，调用task5的swap中的方法交换得到faucet

实现在testnet上验证思路，通过后再上mainnet
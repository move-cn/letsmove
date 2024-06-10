## mainnet
address: 0xd3324287c3b2fd24b0c52a512e20f7aab280396df5169267f323047b50e95ec9
aiqubit_faucet: 0x6a8a1f3dc800b09b3165df9e82f06cf8af5effa9120929e731674ecd09b76967
aiqubit_faucet TreasuryCap: 0xc5b9385162b3d5da4fba0d2370a6045ed94d7a2d324b054d8e855091aca24214
aiqubit_faucet Coin: 0x0181da62a7a7102e07e5cb19f2f414c4a9e8b9614ffbf75fb1da39791493a559
aiqubit_coin: 0xb4b03a2729a2dac3053c86a422aab9a1f5c9a8aec4e20c6f1d004e40a779d153
aiqubit_coin TreasuryCap: 0xa8d2ab74ae7f4557430cb5778af9b731528c084c560d5ef90264c2e7a03463a5
aiqubit nft: 0x3e388ec2e18459c40e6efb2633b992575dc2b40181df5b9feafb66175f9ff733

## testnet 
address: 0x415bf8842215995030fb6834f0f832e3f030ef3941e312837f8ea22c2eb14f15
aiqubit_faucet: 0x29b6a0bca9c40bb55a48383c13b2b4872e747df7994e315be8593d722d9091e4
aiqubit_faucet TreasuryCap: 0xbc9f81e90a24c956e0af40dc16198b663c5c266420d3149cd09db0266ad8559f
aiqubit_faucet Coin: 0x735e771bdcfcf120b77f9b889734ceab92e915240f88990ef7fd087275d4fa5a
aiqubit_coin: 0x17636e03c667ef7f98138252cb68ed6bed56fe5c07869459f2e6195822cb1ffb
aiqubit_coin TreasuryCap: 0x033eb226b6cfe428d0550d7214f3771020abdcbc4ea8706ced3380de9f3f8459
aiqubit nft: 0xb7b70c834341061bf680c05fc6f4cd6ebd55cf444fcdae1e8e4902adbf625245

## Build
github ---> gitee
sui move build

## Deploy
sui client new-env --alias=mainnet --rpc https://fullnode.mainnet.sui.io:443
sui client switch --env mainnet
sui client switch --address hungry-crocidolite
sui client publish --gas-budget 20000000

## Coin Mint
export PACKAGE_ID=0x6a8a1f3dc800b09b3165df9e82f06cf8af5effa9120929e731674ecd09b76967
export TREASURYCAP_ID=0xc5b9385162b3d5da4fba0d2370a6045ed94d7a2d324b054d8e855091aca24214
export RECIPIENT_ADDRESS=0xd3324287c3b2fd24b0c52a512e20f7aab280396df5169267f323047b50e95ec9

sui client call --gas-budget 9900000 --package $PACKAGE_ID --module aiqubit_faucet --function mint --args $TREASURYCAP_ID \"9876543210\" $RECIPIENT_ADDRESS

## NFT Mint:
export PACKAGE_ID=0x3e388ec2e18459c40e6efb2633b992575dc2b40181df5b9feafb66175f9ff733
export NFT_NAME="\"AIQUBIT\""
export DESCRIPTION="\"AIQUBIT NFT\""
export URL=https://avatars.githubusercontent.com/u/35585232?v=4

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module aiqubit_nft --function mint_nft --args $NFT_NAME $DESCRIPTION $URL

## Transfer NFT
export NFT_ID=0xa33e88f6c7b24c9d538539c4fd0c6624c997c0b8a797c1f4c525ace2e3cd6036
export ADDRESS=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module aiqubit_nft --function transfer_nft --args $NFT_ID $ADDRESS

## Aiqubit Game
sui client publish --gas-budget 200000000
testnet:  
export ADMIN_CAP=0xfac70f8f03de21ccec04e6d1a643b5ce852eb07cb2c11daf6cb848f726121d67 
export GAME_ID=0x3076dae2debab0364a6765ff887ead71ff984b34781bdac735477ac9d00a1f43 
export PACKAGE_ID=0x16bc98ae1bf7ce2e614b9fb426a5297ec04ebf30aa9ec577fdd34ccb87bb9943

export FAUCET_TreasuryCap=0xbc9f81e90a24c956e0af40dc16198b663c5c266420d3149cd09db0266ad8559f

// get_faucet_coin 调用水龙头，获取水龙头币
sui client call --package $PACKAGE_ID --module aiqubit_game --function get_faucet_coin --args $FAUCET_TreasuryCap 100000000 --gas-budget 10000000

// deposit coin:   
// 调用get_faucet_coin，从返回信息 Created Objects: ObjectType: 0x2::coin::Coin<0x29b6a0bca9c40bb55a48383c13b2b4872e747df7994e315be8593d722d9091e4::aiqubit_faucet::AIQUBIT_FAUCET>  ObjectID: 得到 FAUCET_COIN
export FAUCET_COIN=0x1822e7ce3b815ac8e18bfbc7a7ee2d6969e8d997b723e5e3d121ed344397e8df

sui client call --package $PACKAGE_ID --module aiqubit_game --function deposit --args $GAME_ID  $FAUCET_COIN 5000000 --gas-budget 20000000

// play game:
// 每次deposit coin只能play game一次
// 从调用deposit的返回信息 Created Objects:  ObjectType: 0x2::coin::Coin<0x29b6a0bca9c40bb55a48383c13b2b4872e747df7994e315be8593d722d9091e4::aiqubit_faucet::AIQUBIT_FAUCET>  ObjectID: 得到 GAME_COIN
export GAME_COIN=0xe659aebc8bb3100b8e1f22c4418e2176d344acc40f9d0698861ec74cc382b2e5          

sui client call --package $PACKAGE_ID --module aiqubit_game --function play --args 1 $GAME_ID $GAME_COIN 0x6 --gas-budget 100000000


sui client call --package $PACKAGE_ID --module aiqubit_game --function withdraw --args $ADMIN_CAP $GAME_ID 2000 --gas-budget 10000000

## Aiqubit Swap
sui client publish --gas-budget 200000000

export COIN_TYPE=0xb4b03a2729a2dac3053c86a422aab9a1f5c9a8aec4e20c6f1d004e40a779d153::aiqubit_coin::AIQUBIT_COIN

export FAUCET_TYPE=0x6a8a1f3dc800b09b3165df9e82f06cf8af5effa9120929e731674ecd09b76967::aiqubit_faucet::AIQUBIT_FAUCET

export AIQUBIT_COIN_PACKAGE_ID=0xb4b03a2729a2dac3053c86a422aab9a1f5c9a8aec4e20c6f1d004e40a779d153

export AIQUBIT_FAUCET_PACKAGE_ID=0x6a8a1f3dc800b09b3165df9e82f06cf8af5effa9120929e731674ecd09b76967

export FAUCET_TREA_ID=0xc5b9385162b3d5da4fba0d2370a6045ed94d7a2d324b054d8e855091aca24214 

export COIN_TREA_ID=0xa8d2ab74ae7f4557430cb5778af9b731528c084c560d5ef90264c2e7a03463a5

export AIQUBIT_SWAP_PACKAGE_ID=0xde2a12b321ef377b77a117b8fa055dd7c56a9564b557965a3d6fef2f8054a270 

export MY_ADDRESS=0xd3324287c3b2fd24b0c52a512e20f7aab280396df5169267f323047b50e95ec9

// 调用 AIQUBIT_COIN mint 拿到1000个
sui client call --gas-budget 7500000 --package $AIQUBIT_COIN_PACKAGE_ID --module aiqubit_coin --function mint --args $COIN_TREA_ID 1000 $MY_ADDRESS
// 根据 Created Objects: ObjectType: 0x2::coin::Coin<0xb4b03a2729a2dac3053c86a422aab9a1f5c9a8aec4e20c6f1d004e40a779d153::aiqubit_coin::AIQUBIT_COIN> ObjectID:
export COIN_ID_1=0xa554a35d055b192c3b3450490369fcb6cd8affc7311ddecc51819f22d3a154a9    

// 调用 AIQUBIT_FAUCET mint 拿到1000个
sui client call --gas-budget 7500000 --package $AIQUBIT_FAUCET_PACKAGE_ID --module aiqubit_faucet --function mint --args $FAUCET_TREA_ID 1000 $MY_ADDRESS
// 根据 Created Objects: ObjectType: 0x2::coin::Coin<0x6a8a1f3dc800b09b3165df9e82f06cf8af5effa9120929e731674ecd09b76967::aiqubit_faucet::AIQUBIT_FAUCET> ObjectID:
export FAUCET_ID_1=0x04fcb30c3ba8891deb122fb8a2ef36e060426628a36cf015c003b11bb56bf9ed

// 调用 AIQUBIT_SWAP create_pool 创建 faucet 与 coin 各1000的流动性池子
sui client call --gas-budget 7500000 --package $AIQUBIT_SWAP_PACKAGE_ID --module aiqubit_swap --function create_pool --type-args $COIN_TYPE $FAUCET_TYPE --args $COIN_ID_1 $FAUCET_ID_1
// 根据 Created Objects: ObjectType: 0xde2a12b321ef377b77a117b8fa055dd7c56a9564b557965a3d6fef2f8054a270::aiqubit_swap::Pool<0xb4b03a2729a2dac3053c86a422aab9a1f5c9a8aec4e20c6f1d004e40a779d153::aiqubit_coin::AIQUBIT_COIN, 0x6a8a1f3dc800b09b3165df9e82f06cf8af5effa9120929e731674ecd09b76967::aiqubit_faucet::AIQUBIT_FAUCET> ObjectID:
export POOL_ID=0xbd3253788cece0552177289b8f2d0278237c6a42138757cb5ae969110ca6c632

// 调用 AIQUBIT_COIN mint 拿到1000个，作为兑换账户a
sui client call --gas-budget 7500000 --package $AIQUBIT_COIN_PACKAGE_ID --module aiqubit_coin --function mint --args $COIN_TREA_ID 1000 $MY_ADDRESS
// 根据上一步
export COIN_ID_2=0x1647768217409645b405bf4ccd9ccef5cd5b491ee917bae9110c434bdefa1d56  

// 调用 AIQUBIT_SWAP swap_a_to_b 用1000个coin 兑换faucet
sui client call --gas-budget 7500000 --package $AIQUBIT_SWAP_PACKAGE_ID --module aiqubit_swap --function swap_a_to_b --type-args $COIN_TYPE $FAUCET_TYPE --args $POOL_ID $COIN_ID_2

coin2faucet:
Transaction Digest: CD9kitpGWV2q9wjmG8mMyUWUAVs2aSu5ymLGR91uks2r

// 调用 AIQUBIT_FAUCET mint 拿到1000个，作为兑换账户b
sui client call --gas-budget 7500000 --package $AIQUBIT_FAUCET_PACKAGE_ID --module aiqubit_faucet --function mint --args $FAUCET_TREA_ID 1000 $MY_ADDRESS
// 根据上一步
export FAUCET_ID_2=0x6e80491b2bc8c5c0f15433bf0c43e9b93912de2426e5ec9beeb5cbd1435cef6b

// 调用 AIQUBIT_SWAP swap_b_to_a 用1000个faucet 兑换coin
sui client call --gas-budget 7500000 --package $AIQUBIT_SWAP_PACKAGE_ID --module aiqubit_swap --function swap_b_to_a --type-args $COIN_TYPE $FAUCET_TYPE --args $POOL_ID $FAUCET_ID_2

faucet2coin:
Transaction Digest: 95DgBFquNbogp7C3vptBQRHw4Mg5woJc1EDrWCh8sbYG

## Aiqubit SDK PTB
npm install
npm run dev

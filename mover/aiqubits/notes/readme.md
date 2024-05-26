mainnet
address: 0xd3324287c3b2fd24b0c52a512e20f7aab280396df5169267f323047b50e95ec9
aiqubit_faucet: 0xe8854e7ea330d0e794e12e8ef1dbd7e9e4c6f55fabd3978b60575df599ab3d06
aiqubit_coin: 0x17636e03c667ef7f98138252cb68ed6bed56fe5c07869459f2e6195822cb1ffb
aiqubit nft: 0x3e388ec2e18459c40e6efb2633b992575dc2b40181df5b9feafb66175f9ff733

testnet 
aiqubit_faucet: 0xe8854e7ea330d0e794e12e8ef1dbd7e9e4c6f55fabd3978b60575df599ab3d06
aiqubit_coin: 0x17636e03c667ef7f98138252cb68ed6bed56fe5c07869459f2e6195822cb1ffb
aiqubit nft: 0xb7b70c834341061bf680c05fc6f4cd6ebd55cf444fcdae1e8e4902adbf625245
address: 0x415bf8842215995030fb6834f0f832e3f030ef3941e312837f8ea22c2eb14f15


Build:
github ---> gitee
sui move build

Deploy:
sui client new-env --alias=mainnet --rpc https://fullnode.mainnet.sui.io:443
sui client switch --env mainnet
sui client switch --address hungry-crocidolite
sui client publish --gas-budget 20000000

Coin Mint:
export PACKAGE_ID=0xb4b03a2729a2dac3053c86a422aab9a1f5c9a8aec4e20c6f1d004e40a779d153
export TREASURYCAP_ID=0xa8d2ab74ae7f4557430cb5778af9b731528c084c560d5ef90264c2e7a03463a5
export RECIPIENT_ADDRESS=0xd3324287c3b2fd24b0c52a512e20f7aab280396df5169267f323047b50e95ec9

sui client call --gas-budget 9900000 --package $PACKAGE_ID --module aiqubit_coin --function mint --args $TREASURYCAP_ID \"98765\" $RECIPIENT_ADDRESS

NFT Mint:
export PACKAGE_ID=0x3e388ec2e18459c40e6efb2633b992575dc2b40181df5b9feafb66175f9ff733
export NFT_NAME="\"AIQUBIT\""
export DESCRIPTION="\"AIQUBIT NFT\""
export URL=https://avatars.githubusercontent.com/u/35585232?v=4

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module aiqubit_nft --function mint_nft --args $NFT_NAME $DESCRIPTION $URL

Transfer NFT:

export NFT_ID=0xa33e88f6c7b24c9d538539c4fd0c6624c997c0b8a797c1f4c525ace2e3cd6036
export ADDRESS=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2


sui client call --gas-budget 7500000 --package $PACKAGE_ID --module aiqubit_nft --function transfer_nft --args $NFT_ID $ADDRESS

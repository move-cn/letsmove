## 1

export PACKAGE_ID=0xb34e3f93b3aee55c3726ab9ff4d73ee6f623c4ed29832a78d1726a0a8afc548f 

sui client call --package $PACKAGE_ID --module hello_ReiType0 --function mint --gas-budget 300000000

check at [0x4e60c7a6c981a8c4632b927e7b0abca02e468963e888b42f405cbef9a9caf428](https://testnet.suivision.xyz/object/0x4e60c7a6c981a8c4632b927e7b0abca02e468963e888b42f405cbef9a9caf428)

## 2

sui client publish --gas-budget 50000000

export PACKAGE_ID=0xf834ecdcd1be5361d6aebbf79c58ce43eb1cae67939cc1d0713562f28225cc3a

export TREASURY_CAP=0xd3dd0a75d40f55081c8c1b37b788e49c793faebd234a6b8f6919230b3590eb9d

sui client call --package $PACKAGE_ID  --module reitype0_coin --function mint --args $TREASURY_CAP 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

check at [DzvvBLJz8yqpQtd4fJyMt7tdaBrXsptQSQHtx9dS3axt](https://suivision.xyz/txblock/DzvvBLJz8yqpQtd4fJyMt7tdaBrXsptQSQHtx9dS3axt)

## 3

sui client publish --gas-budget 20000000

export PACKAGE_ID=0x53704d48a3af018ea2b74ab67442bfd0bfcccba116733156490c70140fa0bf2c 

export MY_ADDRESS=0x408c61cb7202b236832bfb88ac559574062dedff254d4a567fe405b3564598c2

sui client call --package $PACKAGE_ID --module reitype0nft --function mint_to --args "REITYPE0" $MY_ADDRESS --gas-budget 20000000

check the nft object send to myself at [0x82abc5a4b6ef93f721d1eaba4c56e6d9858f3cd91f51dac458b5d31a96f1c22d](https://suivision.xyz/object/0x82abc5a4b6ef93f721d1eaba4c56e6d9858f3cd91f51dac458b5d31a96f1c22d)

sui client call --package $PACKAGE_ID --module reitype0nft --function mint_to --args "REITYPE0" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 20000000

check the send transaction at [J57P5abnXGg3bxy3Y6CYyPirUpiAdCysGbXiY23jRXgY](https://suivision.xyz/txblock/J57P5abnXGg3bxy3Y6CYyPirUpiAdCysGbXiY23jRXgY)


## task2
sui client publish --gas-budget 40000000

export PACKAGE_ID=0x64a774aafeabd3489f5adcd2d3c387059bacc17c4014a9302933ee658cc98aaf     

export COIN_TREASURE=0xc143a3e0e988a6d5cd79586baf644f20f9487294c0f2c9bfe779fbc6844a82d3
export FAUCET_TREASURE=0x21e9989d10f44d0e7b62c0b82d9b07ebcecb1aa881f8c6a599e82ad0c7eea545

export COIN_TYPE=0x64a774aafeabd3489f5adcd2d3c387059bacc17c4014a9302933ee658cc98aaf::flopdian_coin::FLOPDIAN_COI
export FAUCET_TYPE=0x64a774aafeabd3489f5adcd2d3c387059bacc17c4014a9302933ee658cc98aaf::flopdian_faucet_coin::FLOPDIAN_FAUCET_COIN

export MY_ADDR=0xa883fd0a523a6fa17c165829501b53d37ebe0fdaccc2a8858b4ecf1d9c802654
export DEFAULT_ADDR=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module flopdian_coin --function mint --args $COIN_TREASURE 1000 $DEFAULT_ADDR

Transaction Digest: 316mRuEb4y1jroefCfGkJTW5euDvgNMLPmrHUDSzP7JF

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module flopdian_faucet_coin --function mint --args $FAUCET_TREASURE 1000 $DEFAULT_ADDR

Transaction Digest: 9LBTorJYf8krJ2XXy79v4NtSLT3KYK6sAo5ioddHuMJx

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module flopdian_faucet_coin --function mint --args $FAUCET_TREASURE 1000 $MY_ADDR

Transaction Digest: BGckc2QRddno2ioDtRzwjQdurXRgVQAS6xr1jSCypm8v

## task3

sui client publish --gas-budget 20000000

export PACKAGE_ID=0x9904c03d33b9223d1607b5e513303e5010626fdb5f2c375b4b9d4d46b2186f73  
export MY_ADDR=0xa883fd0a523a6fa17c165829501b53d37ebe0fdaccc2a8858b4ecf1d9c802654

sui client call --package $PACKAGE_ID --module flopdiannft --function mint_to --args "flopdian" $MY_ADDR --gas-budget 20000000

Transaction Digest: 77WwhTGusMWh6Nrik2Y7who9xiR5u4mDhXCydtRUKc1V
ObjectID: 0x9bb403d1caf5805c58d89f725237acc535cdad901c631933992db15d4bf97785      

export TARGET_ADDR=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client call --package $PACKAGE_ID --module flopdiannft --function mint_to --args "flopdian sent" $TARGET_ADDR --gas-budget 20000000

Transaction Digest: CpjTD5cakMKHgoZz9BppAym8hSZ3ASLGQgJu8ECUmVTW

ObjectID: 0xfe8976de95bd6274e486871b674c64639cde0483a0d7d9505242c6ecd8729517                 

## task6

npm install

npm run dev

transaction digest: {"digest":"7FuGnQ8hZX4pE7yMwpKB5DGocEub8SxWzHbzKDYNh5E2","confirmedLocalExecution":true}
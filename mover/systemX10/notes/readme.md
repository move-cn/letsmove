======
task1

sui client publish --gas-budget 20000000

PackageID: 0xe3e0e48112533b9e6ad3234f33580980d8e199c77ffa2065eeacfa57fb4e35e9      

=======
task2

sui move new systemx10_faucet

PackageID: 0xd4fa152434f3861ac0d9b40432a0f01bcafbe5a214c0ac266a9a6e981816a6e2          
ObjectID: 0x2a2e5c3e0ac78109151ee23ee7965c238921b7d312e427247da43e81a9fed8cc

ObjectType: 0x2::coin::TreasuryCap<0xd4fa152434f3861ac0d9b40432a0f01bcafbe5a214c0ac266a9a6e981816a6e2::systemx10_faucet_coin::SYSTEMX10_FAUCET_COIN>

export ADDR1=0xbc13e48ab6b931d2a88b2080695303d8e885fabde458a4ca827d1fffb05577a8
export ADDR2=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client call --gas-budget 7500000 --package 0xd4fa152434f3861ac0d9b40432a0f01bcafbe5a214c0ac266a9a6e981816a6e2 --module systemx10_faucet_coin --function mint --args 0x2a2e5c3e0ac78109151ee23ee7965c238921b7d312e427247da43e81a9fed8cc 1000 $ADDR1

Transaction Digest: 9suFbcsoZ4ZobUTxjA7847ChYpSy3cHWvuvi66vTFhbm

sui client call --gas-budget 7500000 --package 0xd4fa152434f3861ac0d9b40432a0f01bcafbe5a214c0ac266a9a6e981816a6e2 --module systemx10_faucet_coin --function mint --args 0x2a2e5c3e0ac78109151ee23ee7965c238921b7d312e427247da43e81a9fed8cc 1000 $ADDR2

Transaction Digest: D5BXRbrpeEkdYgUJ8c5VxHsVbGZ1KN9d2AES9gcaeVmz

sui move new systemx10_coin

sui client publish --gas-budget 20000000

PackageID: 0xc68d680300776f79884c5a83d03c14dedfb305d63d3f931be9522decf2d1279b               

ObjectID: 0x08de0ee14582ff6daf33fd3b83de0f345095efce181fcc0bd129e8a13b6e453f 

ObjectType: 0x2::coin::TreasuryCap<0xc68d680300776f79884c5a83d03c14dedfb305d63d3f931be9522decf2d1279b::systemx10_coin::SYSTEMX10_COIN>

sui client call --package 0xc68d680300776f79884c5a83d03c14dedfb305d63d3f931be9522decf2d1279b  --module systemx10_coin --function mint --args 0x08de0ee14582ff6daf33fd3b83de0f345095efce181fcc0bd129e8a13b6e453f 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

Transaction Digest: EMcH9dPwk3un3zxgwCEg9bhkSX8TNMTHwgAEEAVnwCQS

=======
task3

sui client publish --gas-budget 20000000

PackageID: 0x06472403c1adf8e7ad18e4b7aaf5ae6577f65d3597b2c813893895f3c05ce2c0     

mint to myself:

sui client call --package 0x06472403c1adf8e7ad18e4b7aaf5ae6577f65d3597b2c813893895f3c05ce2c0 --module systemx10_nft --function mint_to --args "systemX10" 0xbc13e48ab6b931d2a88b2080695303d8e885fabde458a4ca827d1fffb05577a8 --gas-budget 20000000

Transaction Digest: EqdJgz6Jx8hBb6fS1qtfEt9jdjDFH2R76j8vhhuweBbk
ObjectID: 0x5a62b015d3ff4d741dcd8d8f885ae862de679023a64c3fb3b56bf28d2d80588d  

mint to default address

sui client call --package 0x06472403c1adf8e7ad18e4b7aaf5ae6577f65d3597b2c813893895f3c05ce2c0 --module systemx10_nft --function mint_to --args "systemX10" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 20000000

Transaction Digest: 6yxu5WbEu7GL3RXwCzstAbpDP2bnY6SHzvsmLvVy8r4n
ObjectID: 0x9a376650a7b007e576ab51329dfa4702b0c8e094494bf2d39f3bdc083f74663e 


=======

task4

=======

task5

sui client publish --gas-budget 50000000

export SYSTEMX10_COIN=0xc68d680300776f79884c5a83d03c14dedfb305d63d3f931be9522decf2d1279b::systemx10_coin::SYSTEMX10_COIN
export SYSTEMX10_FAUCET=0xd4fa152434f3861ac0d9b40432a0f01bcafbe5a214c0ac266a9a6e981816a6e2::systemx10_faucet_coin::SYSTEMX10_FAUCET_COIN

export SWAP_PACKAGE_ID=0x828afefc76dac1ae9b9d9e6a63bb98ac097bbf76807af8927fa618e80ebbca24

export COIN_PACKAGE_ID=0xc68d680300776f79884c5a83d03c14dedfb305d63d3f931be9522decf2d1279b    
export SYSTEMX10_COIN_TREASURY_CAP_ID=0x08de0ee14582ff6daf33fd3b83de0f345095efce181fcc0bd129e8a13b6e453f 
export FAUCET_PACKAGE_ID=0xd4fa152434f3861ac0d9b40432a0f01bcafbe5a214c0ac266a9a6e981816a6e2 
export SYSTEMX10_FAUCET_TREASURY_CAP_ID=0x2a2e5c3e0ac78109151ee23ee7965c238921b7d312e427247da43e81a9fed8cc
export MY_ADDRESS=0xbc13e48ab6b931d2a88b2080695303d8e885fabde458a4ca827d1fffb05577a8

sui client call --gas-budget 7500000 --package $COIN_PACKAGE_ID --module systemx10_coin --function mint --args $SYSTEMX10_COIN_TREASURY_CAP_ID 1000 $MY_ADDRESS

sui client call --gas-budget 7500000 --package $FAUCET_PACKAGE_ID --module systemx10_faucet_coin --function mint --args $SYSTEMX10_FAUCET_TREASURY_CAP_ID 1000 $MY_ADDRESS

export SYSTEMX10_COIN_ID_1=0x1b5e53f3507af0cf9ff1fd9966d74cf416cc4e631ed8d63cd302446129602e49
export SYSTEMX10_FAUCET_ID_1=0x4d06c7a5f2bcbcc2a5cdfe21cdfac6d6d5505a56064630348ce8eb07901315c2

sui client call --gas-budget 7500000 --package $SWAP_PACKAGE_ID --module systemx10_swap \
    --function create_pool --type-args $SYSTEMX10_COIN $SYSTEMX10_FAUCET \
    --args $SYSTEMX10_COIN_ID_1 $SYSTEMX10_FAUCET_ID_1

export POOL_ID=0xc30659ab8fd44f6e0c19ca179abb2be5ccdd0b8c183c0ac5c0f6e2ea78602dfb

交换

sui client call --gas-budget 7500000 --package $COIN_PACKAGE_ID --module systemx10_coin --function mint --args $SYSTEMX10_COIN_TREASURY_CAP_ID 1000 $MY_ADDRESS

sui client call --gas-budget 7500000 --package $FAUCET_PACKAGE_ID --module systemx10_faucet_coin --function mint --args $SYSTEMX10_FAUCET_TREASURY_CAP_ID 1000 $MY_ADDRESS


export SYSTEMX10_COIN_ID_2=0xc5a1d369a662c149d43c1fd3ea5067c9812cf746bf7b6b55d738b3cdfbe7376e
export SYSTEMX10_FAUCET_ID_2=0x3cb864dd04e0a7df6b9cfbb6eb8945dbced7855f57fae946bbdcf54cbec48b95

coin to faucet:

sui client call --gas-budget 7500000 --package $SWAP_PACKAGE_ID --module systemx10_swap \
    --function swap_a_to_b --type-args $SYSTEMX10_COIN $SYSTEMX10_FAUCET \
    --args $POOL_ID $SYSTEMX10_COIN_ID_2

Transaction Digest: AUfTHg4rPaCXS5YfFKuAzUFYCg7g7EX8rbRpHTwP1UAZ

faucet to coin:

sui client call --gas-budget 7500000 --package $SWAP_PACKAGE_ID --module systemx10_swap \
    --function swap_b_to_a --type-args $SYSTEMX10_COIN $SYSTEMX10_FAUCET \
    --args $POOL_ID $SYSTEMX10_FAUCET_ID_2

Transaction Digest: At7aYVBt6dCTwUCU7SwEtqB7bXnVDesCk76Cbh9id98r

=======

task6

Network Type:  mainnet
{
  digest: "FnTBQkupJ18gd1AwNnusdQC2LfMYsAsH4FSVu5xv1BmE",
  effects: {
    messageVersion: "v1",
    status: {
      status: "failure",
      error: "InsufficientGas",
    },
    executedEpoch: "394",
    gasUsed: {
      computationCost: "87000000",
      storageCost: "99978000",
      storageRebate: "98978220",
      nonRefundableStorageFee: "999780",
    },
    modifiedAtVersions: [
      [Object ...], [Object ...], [Object ...], [Object ...], [Object ...], [Object ...]
    ],
    sharedObjects: [
      [Object ...], [Object ...], [Object ...], [Object ...], [Object ...], [Object ...], [Object ...]
    ],
    transactionDigest: "FnTBQkupJ18gd1AwNnusdQC2LfMYsAsH4FSVu5xv1BmE",
    mutated: [
      [Object ...], [Object ...], [Object ...], [Object ...], [Object ...], [Object ...]
    ],
    gasObject: {
      owner: [Object ...],
      reference: [Object ...],
    },
    dependencies: [ "5bxndiXsLBYDxEqkefSo571zuGjFowRETY5JjaTW8bq", "3hH1yVALP2ofNzMfCUMugmYa9guYBda7txoXbWEiM8W7",
      "6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN", "872fyh6bNecamrsgggAAcWv9Dyts3MmXcVu1YG2bd2g9",
      "8UbveF23qDh4WjUDWQqWriwPuvquLsUPgMJSeB4PAzji", "At7aYVBt6dCTwUCU7SwEtqB7bXnVDesCk76Cbh9id98r",
      "BBir5QSG441hd5BfGTRSP7bx9sXif6hFLxji2pSBAmGb", "DnewygWu1SsaF16mJC6LectDAqXQuKPuLGPYGPwctg6f",
      "GRbhN22gkhj3aboJ8x5uMJvA2UtjELm7cAz3zox8tt6f"
    ],
  },
  confirmedLocalExecution: true,
}
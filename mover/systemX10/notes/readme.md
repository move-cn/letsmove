======
task1

sui client publish --gas-budget 20000000

PackageID: 0xe3e0e48112533b9e6ad3234f33580980d8e199c77ffa2065eeacfa57fb4e35e9      

=======
task2

sui move new systemx10_faucet

PackageID: 0xd4fa152434f3861ac0d9b40432a0f01bcafbe5a214c0ac266a9a6e981816a6e2          
ObjectID: 0x2a2e5c3e0ac78109151ee23ee7965c238921b7d312e427247da43e81a9fed8cc

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

## 1.查看地址
sui client addresses
╭───────────────┬────────────────────────────────────────────────────────────────────┬────────────────╮
│ alias         │ address                                                            │ active address │
├───────────────┼────────────────────────────────────────────────────────────────────┼────────────────┤
│ sleepy-plasma │ walrus --help │ *              │
╰───────────────┴────────────────────────────────────────────────────────────────────┴────────────────╯
## 2.获取gas
sui client faucet --address 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68
Request successful. It can take up to 1 minute to get the coin. Run sui client gas to check your gas coins.

## 3.查看gas
sui client gas
╭────────────────────────────────────────────────────────────────────┬────────────────────┬──────────────────╮
│ gasCoinId                                                          │ mistBalance (MIST) │ suiBalance (SUI) │
├────────────────────────────────────────────────────────────────────┼────────────────────┼──────────────────┤
│ 0x4b2f885d16b9faaacdb024147a009d524cf2bf0496236c2b87bbb3d788b7406f │ 1000000000         │ 1.00             │
╰────────────────────────────────────────────────────────────────────┴────────────────────┴──────────────────╯

## 4.新建项目
sui move new hello_move

## 5.发布
sui move build
sui client publish --gas-budget 50000000
sui client call

## 6.发布代币
Transaction Digest: HsqM9X3qNLeDsa7cX9jkPzRh6WtkCuvFKWzqrbwfVdXm
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68                                   │
│ Gas Owner: 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x0495c475f4224ea4d28e207f974e7cc80f7db3a183ad2482d7f4478f122fb60a                                    │
│  │ Version: 192373559                                                                                        │
│  │ Digest: D1HLqcDuq3y4nAm7ajeWcVb6wfjHtNjcc8L2e2FNfBgk                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  └                                                                      │                                  │
│ │                                                                         │                                  │
│ │ 1  TransferObjects:                                                     │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Arguments:                                                           │                                  │
│ │  │   Result 0                                                           │                                  │
│ │  │ Address: Input  0                                                    │                                  │
│ │  └                                                                      │                                  │
│ ╰─────────────────────────────────────────────────────────────────────────╯                                  │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    oL7aU/f2CFXcg35xXwGBVwL3lGzQDH+Cp/A8ir1SevyiJXKqwFDB2OdE7suCSDuXqTNYrkRSqF19sDhwr8pyDg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: HsqM9X3qNLeDsa7cX9jkPzRh6WtkCuvFKWzqrbwfVdXm                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 536                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4e04e812e71e7610bd0cef8499b2febfe92e6b29e64af229671c9fec4b3af114                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 192373560                                                                             │
│  │ Digest: C9UJJuvWVrP9FHbmg8rs3RYG4EnN5LbWJ6815dgfh6sG                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6ee8720d53c434296ecb6a78b805b6480be60dceb0d513a977b0d59ce14080cd                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 192373560                                                                             │
│  │ Digest: 8zFD5UA2UHxtAXGhEstfcdVjqHAGtHf9sfr4vtwLdM9N                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc763aae58e8950eaff179e1e2b31d5e084f6de76cd12ba31446efb88dee19971                         │
│  │ Owner: Account Address ( 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68 )  │
│  │ Version: 192373560                                                                             │
│  │ Digest: 8poYRGPbNgpSVkXwLmpjsJ2qNBLwcZXPyUkVb6MdTaM                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd13ce86a0d6efb0fe59b317f0c1b24f3be39bb3cd0ec714f37164359c97a8404                         │
│  │ Owner: Account Address ( 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68 )  │
│  │ Version: 192373560                                                                             │
│  │ Digest: qnqGPhbtCGPDqQMk9MHM9mGw2qQvBWCtNryEMVuANvt                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd6a7de2dce3c26e01bb2ccd097959727742a920bbadae05a5fbd2a5bcf88a41b                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 5Gtrug999syTaBqX7fxqjh2kyuLsX4frXtpWdvmkUPgF                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xfdbe0ca9fba3ff79fa4a229917ed212818169198b0ece1ce857b339707aa4350                         │
│  │ Owner: Account Address ( 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68 )  │
│  │ Version: 192373560                                                                             │
│  │ Digest: GgFAEVQuuP7Codh7vtqSHsMYcyaatChdJJuhufgAcb1z                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0495c475f4224ea4d28e207f974e7cc80f7db3a183ad2482d7f4478f122fb60a                         │
│  │ Owner: Account Address ( 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68 )  │
│  │ Version: 192373560                                                                             │
│  │ Digest: 8QSbzw14zKAGoT7QK8Zuw9TNqbuLpScPRg6WPLPcAjuH                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0495c475f4224ea4d28e207f974e7cc80f7db3a183ad2482d7f4478f122fb60a                         │
│  │ Owner: Account Address ( 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68 )  │
│  │ Version: 192373560                                                                             │
│  │ Digest: 8QSbzw14zKAGoT7QK8Zuw9TNqbuLpScPRg6WPLPcAjuH                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 21948800 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2VBiXoKJAfDeVgi8ntkra1wDszKN2diDdp8u1UiqM3i2                                                   │
│    3RoxMpKxiw1uP5Xa9cKhkbDfdJ1ULK1PR73FcjVR2bcc                                                   │
│    EAbjLiKTvErStCeaYbvLpYJ4qjRAw5cD8Y7ZtfAhauCJ                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                      │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                    │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x4e04e812e71e7610bd0cef8499b2febfe92e6b29e64af229671c9fec4b3af114                                                     │
│  │ Sender: 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68                                                       │
│  │ Owner: Immutable                                                                                                                 │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xd6a7de2dce3c26e01bb2ccd097959727742a920bbadae05a5fbd2a5bcf88a41b::readcoin::READCOIN>      │
│  │ Version: 192373560                                                                                                               │
│  │ Digest: C9UJJuvWVrP9FHbmg8rs3RYG4EnN5LbWJ6815dgfh6sG                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x6ee8720d53c434296ecb6a78b805b6480be60dceb0d513a977b0d59ce14080cd                                                     │
│  │ Sender: 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68                                                       │
│  │ Owner: Immutable                                                                                                                 │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xd6a7de2dce3c26e01bb2ccd097959727742a920bbadae05a5fbd2a5bcf88a41b::listencoin::LISTENCOIN>  │
│  │ Version: 192373560                                                                                                               │
│  │ Digest: 8zFD5UA2UHxtAXGhEstfcdVjqHAGtHf9sfr4vtwLdM9N                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0xc763aae58e8950eaff179e1e2b31d5e084f6de76cd12ba31446efb88dee19971                                                     │
│  │ Sender: 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68                                                       │
│  │ Owner: Account Address ( 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68 )                                    │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xd6a7de2dce3c26e01bb2ccd097959727742a920bbadae05a5fbd2a5bcf88a41b::listencoin::LISTENCOIN>   │
│  │ Version: 192373560                                                                                                               │
│  │ Digest: 8poYRGPbNgpSVkXwLmpjsJ2qNBLwcZXPyUkVb6MdTaM                                                                              │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0xd13ce86a0d6efb0fe59b317f0c1b24f3be39bb3cd0ec714f37164359c97a8404                                                     │
│  │ Sender: 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68                                                       │
│  │ Owner: Account Address ( 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68 )                                    │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xd6a7de2dce3c26e01bb2ccd097959727742a920bbadae05a5fbd2a5bcf88a41b::readcoin::READCOIN>       │
│  │ Version: 192373560                                                                                                               │
│  │ Digest: qnqGPhbtCGPDqQMk9MHM9mGw2qQvBWCtNryEMVuANvt                                                                              │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0xfdbe0ca9fba3ff79fa4a229917ed212818169198b0ece1ce857b339707aa4350                                                     │
│  │ Sender: 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68                                                       │
│  │ Owner: Account Address ( 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68 )                                    │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                             │
│  │ Version: 192373560                                                                                                               │
│  │ Digest: GgFAEVQuuP7Codh7vtqSHsMYcyaatChdJJuhufgAcb1z                                                                             │
│  └──                                                                                                                                │
│ Mutated Objects:                                                                                                                    │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x0495c475f4224ea4d28e207f974e7cc80f7db3a183ad2482d7f4478f122fb60a                                                     │
│  │ Sender: 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68                                                       │
│  │ Owner: Account Address ( 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68 )                                    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                       │
│  │ Version: 192373560                                                                                                               │
│  │ Digest: 8QSbzw14zKAGoT7QK8Zuw9TNqbuLpScPRg6WPLPcAjuH                                                                             │
│  └──                                                                                                                                │
│ Published Objects:                                                                                                                  │
│  ┌──                                                                                                                                │
│  │ PackageID: 0xd6a7de2dce3c26e01bb2ccd097959727742a920bbadae05a5fbd2a5bcf88a41b                                                    │
│  │ Version: 1                                                                                                                       │
│  │ Digest: 5Gtrug999syTaBqX7fxqjh2kyuLsX4frXtpWdvmkUPgF                                                                             │
│  │ Modules: listencoin, readcoin                                                                                                    │
│  └──                                                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -21970680                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯


sui keytool list
sui keytool convert ANgGBmmn9A4H07PtyYEvH3S8PtEPBbpXt46SY9BLpHi/
# mint

package_id : 0xd6a7de2dce3c26e01bb2ccd097959727742a920bbadae05a5fbd2a5bcf88a41b
lcoin_Treasury_id:0xc763aae58e8950eaff179e1e2b31d5e084f6de76cd12ba31446efb88dee19971
rcoin_Treasury_id:0xd13ce86a0d6efb0fe59b317f0c1b24f3be39bb3cd0ec714f37164359c97a8404

 sui client call --gas-budget 100000000 \
 --package  0x2 \
 --module coin \
 --function mint_and_transfer \
 --type-args '0xd6a7de2dce3c26e01bb2ccd097959727742a920bbadae05a5fbd2a5bcf88a41b::listencoin::LISTENCOIN' \
 --args 0xc763aae58e8950eaff179e1e2b31d5e084f6de76cd12ba31446efb88dee19971 100000000000 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68


  sui client call --gas-budget 100000000 \
  --package  0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args '0xd6a7de2dce3c26e01bb2ccd097959727742a920bbadae05a5fbd2a5bcf88a41b::readcoin::READCOIN' \
  --args 0xd13ce86a0d6efb0fe59b317f0c1b24f3be39bb3cd0ec714f37164359c97a8404 10000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

  sui client balance


  # 7.更新合约
  sui client upgrade --gas-budget 50000000 --upgrade-capability 0xfdbe0ca9fba3ff79fa4a229917ed212818169198b0ece1ce857b339707aa4350 --skip-dep
endency-verification

Transaction Digest: 8nDxV1oEqAnYDHA5BDrHEsygpjPewMqKwAPNV1rtTxdW
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                                    │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68                                                                                          │
│ Gas Owner: 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68                                                                                       │
│ Gas Budget: 50000000 MIST                                                                                                                                           │
│ Gas Price: 1000 MIST                                                                                                                                                │
│ Gas Payment:                                                                                                                                                        │
│  ┌──                                                                                                                                                                │
│  │ ID: 0x10f4b699ce172f5c23f89ebc95667f5bfe160be16e192a890799522749347c36                                                                                           │
│  │ Version: 200264094                                                                                                                                               │
│  │ Digest: 9yXjNjXG9ULYWcXmhzv6fCw7dtzXvUnQQKGhftpFPxJr                                                                                                             │
│  └──                                                                                                                                                                │
│                                                                                                                                                                     │
│ Transaction Kind: Programmable                                                                                                                                      │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                                                                                   │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xfdbe0ca9fba3ff79fa4a229917ed212818169198b0ece1ce857b339707aa4350                                                                     │ │
│ │ 1   Pure Arg: Type: u8, Value: 0                                                                                                                                │ │
│ │ 2   Pure Arg: Type: vector<u8>, Value: [182,44,201,254,250,22,178,205,254,160,61,135,78,158,150,144,127,115,80,76,45,197,155,57,13,116,248,108,172,118,207,153] │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────╮                                                                       │
│ │ Commands                                                                                  │                                                                       │
│ ├───────────────────────────────────────────────────────────────────────────────────────────┤                                                                       │
│ │ 0  MoveCall:                                                                              │                                                                       │
│ │  ┌                                                                                        │                                                                       │
│ │  │ Function:  authorize_upgrade                                                           │                                                                       │
│ │  │ Module:    package                                                                     │                                                                       │
│ │  │ Package:   0x0000000000000000000000000000000000000000000000000000000000000002          │                                                                       │
│ │  │ Arguments:                                                                             │                                                                       │
│ │  │   Input  0                                                                             │                                                                       │
│ │  │   Input  1                                                                             │                                                                       │
│ │  │   Input  2                                                                             │                                                                       │
│ │  └                                                                                        │                                                                       │
│ │                                                                                           │                                                                       │
│ │ 1  Upgrade:                                                                               │                                                                       │
│ │  ┌                                                                                        │                                                                       │
│ │  │ Dependencies:                                                                          │                                                                       │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001                   │                                                                       │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002                   │                                                                       │
│ │  │ Current Package ID: 0xd6a7de2dce3c26e01bb2ccd097959727742a920bbadae05a5fbd2a5bcf88a41b │                                                                       │
│ │  │ Ticket: Result 0                                                                       │                                                                       │
│ │  └                                                                                        │                                                                       │
│ │                                                                                           │                                                                       │
│ │ 2  MoveCall:                                                                              │                                                                       │
│ │  ┌                                                                                        │                                                                       │
│ │  │ Function:  commit_upgrade                                                              │                                                                       │
│ │  │ Module:    package                                                                     │                                                                       │
│ │  │ Package:   0x0000000000000000000000000000000000000000000000000000000000000002          │                                                                       │
│ │  │ Arguments:                                                                             │                                                                       │
│ │  │   Input  0                                                                             │                                                                       │
│ │  │   Result 1                                                                             │                                                                       │
│ │  └                                                                                        │                                                                       │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────╯                                                                       │
│                                                                                                                                                                     │
│ Signatures:                                                                                                                                                         │
│    8NSNedpyeG9lfZfZ2IQjsOY9/Bdf1DEqqMStld+bFWblPYwmILPcW8/WWp4M7f58LnDY6qARfZ5vtRB8waOgAw==                                                                         │
│                                                                                                                                                                     │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8nDxV1oEqAnYDHA5BDrHEsygpjPewMqKwAPNV1rtTxdW                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 536                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb9a0a4bb6c22f535e013c66f5600d01c58d3a96b707cf8bc05bd6bfd09235023                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 2                                                                                     │
│  │ Digest: Co4NoMZTdZeBtThYJSEcKSQHpsapHgKFUeevQrv5up2C                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x10f4b699ce172f5c23f89ebc95667f5bfe160be16e192a890799522749347c36                         │
│  │ Owner: Account Address ( 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68 )  │
│  │ Version: 200264095                                                                             │
│  │ Digest: FUqpkuBz4MtcZYeKFaDSS8zh47aFp2uXSdv1hS7zMx3                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xfdbe0ca9fba3ff79fa4a229917ed212818169198b0ece1ce857b339707aa4350                         │
│  │ Owner: Account Address ( 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68 )  │
│  │ Version: 200264095                                                                             │
│  │ Digest: 2LpRSWTih53Zy81KBPZoj5zFDBivQ7E7zDLnQwUow8eR                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x10f4b699ce172f5c23f89ebc95667f5bfe160be16e192a890799522749347c36                         │
│  │ Owner: Account Address ( 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68 )  │
│  │ Version: 200264095                                                                             │
│  │ Digest: FUqpkuBz4MtcZYeKFaDSS8zh47aFp2uXSdv1hS7zMx3                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 14067600 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2595780 MIST                                                                   │
│    Non-refundable Storage Fee: 26220 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2VBiXoKJAfDeVgi8ntkra1wDszKN2diDdp8u1UiqM3i2                                                   │
│    3RoxMpKxiw1uP5Xa9cKhkbDfdJ1ULK1PR73FcjVR2bcc                                                   │
│    GKXUMa6c5wPigUYNVsisHDoiVoMAyzNmnRiikguiRRnF                                                   │
│    HsqM9X3qNLeDsa7cX9jkPzRh6WtkCuvFKWzqrbwfVdXm                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x10f4b699ce172f5c23f89ebc95667f5bfe160be16e192a890799522749347c36                  │
│  │ Sender: 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68                    │
│  │ Owner: Account Address ( 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 200264095                                                                            │
│  │ Digest: FUqpkuBz4MtcZYeKFaDSS8zh47aFp2uXSdv1hS7zMx3                                           │
│  └──                                                                                             │
│  ┌──                                                                                             │
│  │ ObjectID: 0xfdbe0ca9fba3ff79fa4a229917ed212818169198b0ece1ce857b339707aa4350                  │
│  │ Sender: 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68                    │
│  │ Owner: Account Address ( 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 200264095                                                                            │
│  │ Digest: 2LpRSWTih53Zy81KBPZoj5zFDBivQ7E7zDLnQwUow8eR                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xb9a0a4bb6c22f535e013c66f5600d01c58d3a96b707cf8bc05bd6bfd09235023                 │
│  │ Version: 2                                                                                    │
│  │ Digest: Co4NoMZTdZeBtThYJSEcKSQHpsapHgKFUeevQrv5up2C                                          │
│  │ Modules: listencoin, readcoin                                                                 │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x6831c959ff891dae12289e48952043beec02c0032da2452f15a253ea5ff37a68 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -12471820                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯


PackageID: 0xb9a0a4bb6c22f535e013c66f5600d01c58d3a96b707cf8bc05bd6bfd09235023

  sui client call --gas-budget 100000000 \
  --package  0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args '0xb9a0a4bb6c22f535e013c66f5600d01c58d3a96b707cf8bc05bd6bfd09235023::readcoin::READCOIN' \
  --args 0xd13ce86a0d6efb0fe59b317f0c1b24f3be39bb3cd0ec714f37164359c97a8404 10000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
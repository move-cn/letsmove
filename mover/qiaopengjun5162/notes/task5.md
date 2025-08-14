# Sui Move Swap

## 实操

```shell
letsmove/mover/qiaopengjun5162/code/task5 on  main [?] via 🅒 base 
➜ sui move new move_swap                     

letsmove/mover/qiaopengjun5162/code/task5 on  main [?] via 🅒 base 
➜ cd move_swap                       

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [?] via 🅒 base 
➜ sui move build                             
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING move_swap

```

### 发布
```shell
letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [?] via 🅒 base took 3.3s 
➜ sui client publish --gas-budget 100000000 --skip-fetch-latest-git-deps --skip-dependency-verification 
[warn] Client/Server api version mismatch, client api version : 1.32.0, server api version : 1.37.3
INCLUDING DEPENDENCY faucet_coin
INCLUDING DEPENDENCY mycoin
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING move_swap
Skipping dependency verification
Transaction Digest: 6Rw1vVcQKx17XPJdhZgX8qnGwb9JmeS5DAsZRbh7D2uF
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                   │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                                    │
│  │ Version: 420167046                                                                                        │
│  │ Digest: 7ie1ThjwFpLcNkygfZKiGYgh3ifcyhcP2w7ysnCLY19W                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  │   0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a │                                  │
│ │  │   0x0c303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c │                                  │
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
│    hLLHwxUT96mZrAlW2AA98ZGbamGUF0UvYJi5vrySMnxwTVrFQ25JtplJ/Xr8YmzJ2Y+lJ3vMFLoHQBhw4MLoCQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6Rw1vVcQKx17XPJdhZgX8qnGwb9JmeS5DAsZRbh7D2uF                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 600                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4d6323a25c3a1ad4177f9effd36025f34137ce7a1226363453a77a65fa8f7e77                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167047                                                                             │
│  │ Digest: FJUN16gWeS6W3XBfCo63jrAafnukBdTgNwADnFNxEGJD                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6dd8425ca7a82f859a766fcd311c00c7d42c05f0269d02b9fe2c79cf0ddc0f12                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: J42Q9Ngd98jTNhKxvuNKzMy2H8SUvqTsEpfsotaZdPbe                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd2cff79e2705fea10ab35849e7298d0bf0278f9471f4d1a026f5286a63abc2ed                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167047                                                                             │
│  │ Digest: 13KvYyfv1wZAzqxFp6wHWogKCPiaphsuXkkAMAYvPwGA                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xec984fa26a83a446705bda239ffbc193cd5e5ee506675defd16c733a61ac9a96                         │
│  │ Owner: Shared( 420167047 )                                                                     │
│  │ Version: 420167047                                                                             │
│  │ Digest: G2dcKyDJAqQsFrqhrY4KqBs3wCy5sFcB658bH1zDaHHU                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167047                                                                             │
│  │ Digest: 2TZniMEw5PdtzJBvfariNVd9ogcNZjQhwK9Ht1wfWfAh                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167047                                                                             │
│  │ Digest: 2TZniMEw5PdtzJBvfariNVd9ogcNZjQhwK9Ht1wfWfAh                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 17297600 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    K143zA8QHViWRQcVFNHrTjkddqfzV4g8qUkXqdGLxvB                                                    │
│    DWmbEGkq5CU6enfmY1w8gvB554MqS9nWceFeqnHZ2ofi                                                   │
│    FPQJirZF6XaBX9wcmQbPUPPX9CzbpymnF3c8vtnpHqWt                                                   │
│    GvbJ8ia1HfavuccAmi8EJJAaCGShtdv4NWrs1B13vvom                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                          │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                        │
│  ┌──                                                                                                    │
│  │ ObjectID: 0x4d6323a25c3a1ad4177f9effd36025f34137ce7a1226363453a77a65fa8f7e77                         │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                           │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )        │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                 │
│  │ Version: 420167047                                                                                   │
│  │ Digest: FJUN16gWeS6W3XBfCo63jrAafnukBdTgNwADnFNxEGJD                                                 │
│  └──                                                                                                    │
│  ┌──                                                                                                    │
│  │ ObjectID: 0xd2cff79e2705fea10ab35849e7298d0bf0278f9471f4d1a026f5286a63abc2ed                         │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                           │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )        │
│  │ ObjectType: 0x6dd8425ca7a82f859a766fcd311c00c7d42c05f0269d02b9fe2c79cf0ddc0f12::move_swap::AdminCap  │
│  │ Version: 420167047                                                                                   │
│  │ Digest: 13KvYyfv1wZAzqxFp6wHWogKCPiaphsuXkkAMAYvPwGA                                                 │
│  └──                                                                                                    │
│  ┌──                                                                                                    │
│  │ ObjectID: 0xec984fa26a83a446705bda239ffbc193cd5e5ee506675defd16c733a61ac9a96                         │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                           │
│  │ Owner: Shared( 420167047 )                                                                           │
│  │ ObjectType: 0x6dd8425ca7a82f859a766fcd311c00c7d42c05f0269d02b9fe2c79cf0ddc0f12::move_swap::Pool      │
│  │ Version: 420167047                                                                                   │
│  │ Digest: G2dcKyDJAqQsFrqhrY4KqBs3wCy5sFcB658bH1zDaHHU                                                 │
│  └──                                                                                                    │
│ Mutated Objects:                                                                                        │
│  ┌──                                                                                                    │
│  │ ObjectID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                           │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )        │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                           │
│  │ Version: 420167047                                                                                   │
│  │ Digest: 2TZniMEw5PdtzJBvfariNVd9ogcNZjQhwK9Ht1wfWfAh                                                 │
│  └──                                                                                                    │
│ Published Objects:                                                                                      │
│  ┌──                                                                                                    │
│  │ PackageID: 0x6dd8425ca7a82f859a766fcd311c00c7d42c05f0269d02b9fe2c79cf0ddc0f12                        │
│  │ Version: 1                                                                                           │
│  │ Digest: J42Q9Ngd98jTNhKxvuNKzMy2H8SUvqTsEpfsotaZdPbe                                                 │
│  │ Modules: move_swap                                                                                   │
│  └──                                                                                                    │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -17069480                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

### Mint my coin
```shell
letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ export PACKAGE_ID=0x0c303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c


letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ export TREASURYCAP_ID=0x3f2b8b45d2e7c655026dec24c15e220d18a23ed624e9caa0ccac4814aad554f2

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base took 2.3s 
➜ sui client call --function mint --module mycoin --package $PACKAGE_ID --args $TREASURYCAP_ID 1000000 0x6518cfc4854eb8b175c406e25e16e5042cf84a6c91c6eea9485eebeb18df4df0 --gas-budget 10000000
[warn] Client/Server api version mismatch, client api version : 1.32.0, server api version : 1.37.3
Transaction Digest: Hxf5uBKbu5b2ddCMbZuQPQwKWFinfMqAdgVkx6vzD12q
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                   │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                                    │
│  │ Version: 420167047                                                                                        │
│  │ Digest: 2TZniMEw5PdtzJBvfariNVd9ogcNZjQhwK9Ht1wfWfAh                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x3f2b8b45d2e7c655026dec24c15e220d18a23ed624e9caa0ccac4814aad554f2              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1000000"                                                                │ │
│ │ 2   Pure Arg: Type: address, Value: "0x6518cfc4854eb8b175c406e25e16e5042cf84a6c91c6eea9485eebeb18df4df0" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    mycoin                                                             │                         │
│ │  │ Package:   0x0c303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    GcG17EWZ+bGATrIhpDOG7oR6Vu0C1xtxgcJgi6xXmtPoZnnDIkbStJzW3e6SQnDZbc+OTwjGMzrXiTryBUkGDw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: Hxf5uBKbu5b2ddCMbZuQPQwKWFinfMqAdgVkx6vzD12q                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 600                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xeaa13ec17fa0b44be3df3b26a15c56495ac66f7ee2f480855f00e1ad99d0f7da                         │
│  │ Owner: Account Address ( 0x6518cfc4854eb8b175c406e25e16e5042cf84a6c91c6eea9485eebeb18df4df0 )  │
│  │ Version: 420167048                                                                             │
│  │ Digest: GNQNpkfmWcvAfdAPKUgw9cbypGXNDMnq7o2wBRjNXm7M                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167048                                                                             │
│  │ Digest: A5gSoc9FGhhcXghrsgn2KjarbanZhnVB1E9B8V5Lsz8L                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3f2b8b45d2e7c655026dec24c15e220d18a23ed624e9caa0ccac4814aad554f2                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167048                                                                             │
│  │ Digest: AGASZ9xRtiBj4Fnk7g3VMv4k85nJjhL1anqyUfdcaF1J                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167048                                                                             │
│  │ Digest: A5gSoc9FGhhcXghrsgn2KjarbanZhnVB1E9B8V5Lsz8L                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4073600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2693592 MIST                                                                   │
│    Non-refundable Storage Fee: 27208 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    K143zA8QHViWRQcVFNHrTjkddqfzV4g8qUkXqdGLxvB                                                    │
│    6Rw1vVcQKx17XPJdhZgX8qnGwb9JmeS5DAsZRbh7D2uF                                                   │
│    Hk2m48YK9VbDL8cdLAMM119ZDHiqGuBJttC1zE2jH6yh                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                            │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                          │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0xeaa13ec17fa0b44be3df3b26a15c56495ac66f7ee2f480855f00e1ad99d0f7da                                           │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                             │
│  │ Owner: Account Address ( 0x6518cfc4854eb8b175c406e25e16e5042cf84a6c91c6eea9485eebeb18df4df0 )                          │
│  │ ObjectType: 0x2::coin::Coin<0xc303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c::mycoin::MYCOIN>         │
│  │ Version: 420167048                                                                                                     │
│  │ Digest: GNQNpkfmWcvAfdAPKUgw9cbypGXNDMnq7o2wBRjNXm7M                                                                   │
│  └──                                                                                                                      │
│ Mutated Objects:                                                                                                          │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                                           │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                             │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                          │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                             │
│  │ Version: 420167048                                                                                                     │
│  │ Digest: A5gSoc9FGhhcXghrsgn2KjarbanZhnVB1E9B8V5Lsz8L                                                                   │
│  └──                                                                                                                      │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x3f2b8b45d2e7c655026dec24c15e220d18a23ed624e9caa0ccac4814aad554f2                                           │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                             │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                          │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xc303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c::mycoin::MYCOIN>  │
│  │ Version: 420167048                                                                                                     │
│  │ Digest: AGASZ9xRtiBj4Fnk7g3VMv4k85nJjhL1anqyUfdcaF1J                                                                   │
│  └──                                                                                                                      │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2130008                                                                               │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x6518cfc4854eb8b175c406e25e16e5042cf84a6c91c6eea9485eebeb18df4df0 )  │
│  │ CoinType: 0xc303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c::mycoin::MYCOIN    │
│  │ Amount: 1000000                                                                                │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

##  步骤
### 第一步：Publish move_swap 
```shell
letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base took 2.5s 
➜ sui client publish --gas-budget 100000000 --skip-fetch-latest-git-deps --skip-dependency-verification                          
[warn] Client/Server api version mismatch, client api version : 1.32.0, server api version : 1.38.3
INCLUDING DEPENDENCY faucet_coin
INCLUDING DEPENDENCY mycoin
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING move_swap
Skipping dependency verification
Transaction Digest: Hk5nfi7ag3QRapKi6oy8cYYzbFEcNrc4FYBo9BCZq3rH
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                   │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                                    │
│  │ Version: 420167051                                                                                        │
│  │ Digest: 9JRxp216KkaAqUu1J47cuvuntJoAN8sXB2ZQHqCAzMeR                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  │   0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a │                                  │
│ │  │   0x0c303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c │                                  │
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
│    308Ke4pkntGO2haBk92wg8VSP4msNAsf69gdQ+zSl3RhxyadTrvg+7wstUR4hBoZc38Y4wWNNS8M8TN77MmTBA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: Hk5nfi7ag3QRapKi6oy8cYYzbFEcNrc4FYBo9BCZq3rH                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 601                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x03b14706dab6072077845681b347737f467445eb86bf4b235af3f8da031b3905                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167052                                                                             │
│  │ Digest: FXkQXi5zhB5xZG2rvY2kftw6NZP51648vBU1ZQ6aWVAZ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6                         │
│  │ Owner: Shared( 420167052 )                                                                     │
│  │ Version: 420167052                                                                             │
│  │ Digest: 9ZngjrTrkP4mYuwFz1NSsXM2ZmxrmdrRH2qksH1upYZE                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x4d7b1f70c0457133d29a8b468719cb2506962da8123c04f0de4413eb32040445                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 8kNotb4qMJTygeC8zAj9gQuMWP2Z4NEoy2aHGC9cjqqR                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x77fa795db230573466b5c0194e84bfaafb8dba86f84ec1c6d8cb403f10441b67                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167052                                                                             │
│  │ Digest: 5T5jMaUAEuGrHkgJ1KGxVe4FmqXjeRcoqYujW1vtHqmg                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167052                                                                             │
│  │ Digest: 3ck3bDnEUWLRCcXS8QPJGe1DvbvyAPHMMPBvt9Z7piBK                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167052                                                                             │
│  │ Digest: 3ck3bDnEUWLRCcXS8QPJGe1DvbvyAPHMMPBvt9Z7piBK                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 17411600 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    K143zA8QHViWRQcVFNHrTjkddqfzV4g8qUkXqdGLxvB                                                    │
│    FPQJirZF6XaBX9wcmQbPUPPX9CzbpymnF3c8vtnpHqWt                                                   │
│    GMVw8sXbfA6Ws1tyarQkcoFct9F5jYMTZbNBshhBVyhY                                                   │
│    GvbJ8ia1HfavuccAmi8EJJAaCGShtdv4NWrs1B13vvom                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                          │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                        │
│  ┌──                                                                                                    │
│  │ ObjectID: 0x03b14706dab6072077845681b347737f467445eb86bf4b235af3f8da031b3905                         │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                           │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )        │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                 │
│  │ Version: 420167052                                                                                   │
│  │ Digest: FXkQXi5zhB5xZG2rvY2kftw6NZP51648vBU1ZQ6aWVAZ                                                 │
│  └──                                                                                                    │
│  ┌──                                                                                                    │
│  │ ObjectID: 0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6                         │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                           │
│  │ Owner: Shared( 420167052 )                                                                           │
│  │ ObjectType: 0x4d7b1f70c0457133d29a8b468719cb2506962da8123c04f0de4413eb32040445::move_swap::Pool      │
│  │ Version: 420167052                                                                                   │
│  │ Digest: 9ZngjrTrkP4mYuwFz1NSsXM2ZmxrmdrRH2qksH1upYZE                                                 │
│  └──                                                                                                    │
│  ┌──                                                                                                    │
│  │ ObjectID: 0x77fa795db230573466b5c0194e84bfaafb8dba86f84ec1c6d8cb403f10441b67                         │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                           │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )        │
│  │ ObjectType: 0x4d7b1f70c0457133d29a8b468719cb2506962da8123c04f0de4413eb32040445::move_swap::AdminCap  │
│  │ Version: 420167052                                                                                   │
│  │ Digest: 5T5jMaUAEuGrHkgJ1KGxVe4FmqXjeRcoqYujW1vtHqmg                                                 │
│  └──                                                                                                    │
│ Mutated Objects:                                                                                        │
│  ┌──                                                                                                    │
│  │ ObjectID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                           │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )        │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                           │
│  │ Version: 420167052                                                                                   │
│  │ Digest: 3ck3bDnEUWLRCcXS8QPJGe1DvbvyAPHMMPBvt9Z7piBK                                                 │
│  └──                                                                                                    │
│ Published Objects:                                                                                      │
│  ┌──                                                                                                    │
│  │ PackageID: 0x4d7b1f70c0457133d29a8b468719cb2506962da8123c04f0de4413eb32040445                        │
│  │ Version: 1                                                                                           │
│  │ Digest: 8kNotb4qMJTygeC8zAj9gQuMWP2Z4NEoy2aHGC9cjqqR                                                 │
│  │ Modules: move_swap                                                                                   │
│  └──                                                                                                    │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -17183480                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```
export PACKAGE_ID=0x4d7b1f70c0457133d29a8b468719cb2506962da8123c04f0de4413eb32040445

### 第二步：Mint faucet_coin 1 4
#### MINT FAUCET_COIN 1
```shell
letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base took 5.0s 
➜ export PACKAGE_ID=0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a    

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ export TREASURYCAP_ID=0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c                                                                  

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ sui client call --function mint --module faucet_coin --package $PACKAGE_ID --args $TREASURYCAP_ID 1000000 --gas-budget 10000000                                                                   
[warn] Client/Server api version mismatch, client api version : 1.32.0, server api version : 1.37.3
Transaction Digest: 9RK5VtQarHxQuYiEK4eMr5za6fc5CtdYwnB6coqhUGTp
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                      │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                       │
│  │ Version: 420167049                                                                           │
│  │ Digest: yQQdUR5xfMQGF58yVU2S8kdgDbW2AtMuviytPs2RKwd                                          │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c │ │
│ │ 1   Pure Arg: Type: u64, Value: "1000000"                                                   │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  mint                                                               │            │
│ │  │ Module:    faucet_coin                                                        │            │
│ │  │ Package:   0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    RX5rwmM99XjKoNG8jNti5ajuaGvjnXZZefjbhdxAT640Sxfwqsw3XCX35WQKpYFtdD3HO0NskGNejldvGD3yDw==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9RK5VtQarHxQuYiEK4eMr5za6fc5CtdYwnB6coqhUGTp                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 600                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8d8d00860990da7292a4169ff938395e701465854e0054e969f80a40542014b5                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167050                                                                             │
│  │ Digest: ETLfEGycdEwhh5FZfGNeh9YfwnVkSdUpU255jedPG1LJ                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167050                                                                             │
│  │ Digest: AcvvNqFyrcGDKBree5XeeJrApbQqbY4bcgXEFMMtP2Ce                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167050                                                                             │
│  │ Digest: 2MhYG1vL3QyDL7JsSAjadsnw6gnyKBD8krN4qyNvoEaH                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167050                                                                             │
│  │ Digest: AcvvNqFyrcGDKBree5XeeJrApbQqbY4bcgXEFMMtP2Ce                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3815200 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2362536 MIST                                                                   │
│    Non-refundable Storage Fee: 23864 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    EnMWHbbGFiMEPaXUBwp44Go7FBp5qup22LqoXStUMuFi                                                   │
│    F8V1rPcLYR7QijakrbkZkzPEMfJeanUaPAidLnUTj9C7                                                   │
│    GvbJ8ia1HfavuccAmi8EJJAaCGShtdv4NWrs1B13vvom                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x8d8d00860990da7292a4169ff938395e701465854e0054e969f80a40542014b5                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                 │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                              │
│  │ ObjectType: 0x2::coin::Coin<0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::FAUCET_COIN>  │
│  │ Version: 420167050                                                                                                         │
│  │ Digest: ETLfEGycdEwhh5FZfGNeh9YfwnVkSdUpU255jedPG1LJ                                                                       │
│  └──                                                                                                                          │
│ Mutated Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                 │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                              │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                 │
│  │ Version: 420167050                                                                                                         │
│  │ Digest: AcvvNqFyrcGDKBree5XeeJrApbQqbY4bcgXEFMMtP2Ce                                                                       │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                 │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                              │
│  │ ObjectType: 0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::MySupply                      │
│  │ Version: 420167050                                                                                                         │
│  │ Digest: 2MhYG1vL3QyDL7JsSAjadsnw6gnyKBD8krN4qyNvoEaH                                                                       │
│  └──                                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -2202664                                                                                        │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )           │
│  │ CoinType: 0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::FAUCET_COIN  │
│  │ Amount: 1000000                                                                                         │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```
#### Mint Faucet_coin 4
```shell
letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base took 4.5s 
➜ sui client call --function mint --module faucet_coin --package $PACKAGE_ID --args $TREASURYCAP_ID 4000000 --gas-budget 10000000
[warn] Client/Server api version mismatch, client api version : 1.32.0, server api version : 1.38.3
Transaction Digest: GMVw8sXbfA6Ws1tyarQkcoFct9F5jYMTZbNBshhBVyhY
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                      │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                       │
│  │ Version: 420167050                                                                           │
│  │ Digest: AcvvNqFyrcGDKBree5XeeJrApbQqbY4bcgXEFMMtP2Ce                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c │ │
│ │ 1   Pure Arg: Type: u64, Value: "4000000"                                                   │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  mint                                                               │            │
│ │  │ Module:    faucet_coin                                                        │            │
│ │  │ Package:   0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    WuxeKyDrzVMHrQl7L4K/NTEiewaW2u6Qy7ZMoV+jwtK6lw44rp8RHD+3hXWCueZntjuM3wtnEwjC2w0HlGrYDA==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GMVw8sXbfA6Ws1tyarQkcoFct9F5jYMTZbNBshhBVyhY                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 601                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x704cde43470343dc6fc65409a4009bf9a261f6b919a37d26a437dc62bc67f254                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167051                                                                             │
│  │ Digest: FsoXAkK5uacCHFn1Sxf3YvaEDdhGPuFr5Xed896GSMQH                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167051                                                                             │
│  │ Digest: 9JRxp216KkaAqUu1J47cuvuntJoAN8sXB2ZQHqCAzMeR                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167051                                                                             │
│  │ Digest: A3QsTNhSz3qUKerhhNNvMHZVzKnAXvJQrNTNMkRNHJAr                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167051                                                                             │
│  │ Digest: 9JRxp216KkaAqUu1J47cuvuntJoAN8sXB2ZQHqCAzMeR                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3815200 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2362536 MIST                                                                   │
│    Non-refundable Storage Fee: 23864 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    9RK5VtQarHxQuYiEK4eMr5za6fc5CtdYwnB6coqhUGTp                                                   │
│    GvbJ8ia1HfavuccAmi8EJJAaCGShtdv4NWrs1B13vvom                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x704cde43470343dc6fc65409a4009bf9a261f6b919a37d26a437dc62bc67f254                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                 │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                              │
│  │ ObjectType: 0x2::coin::Coin<0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::FAUCET_COIN>  │
│  │ Version: 420167051                                                                                                         │
│  │ Digest: FsoXAkK5uacCHFn1Sxf3YvaEDdhGPuFr5Xed896GSMQH                                                                       │
│  └──                                                                                                                          │
│ Mutated Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                 │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                              │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                 │
│  │ Version: 420167051                                                                                                         │
│  │ Digest: 9JRxp216KkaAqUu1J47cuvuntJoAN8sXB2ZQHqCAzMeR                                                                       │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                 │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                              │
│  │ ObjectType: 0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::MySupply                      │
│  │ Version: 420167051                                                                                                         │
│  │ Digest: A3QsTNhSz3qUKerhhNNvMHZVzKnAXvJQrNTNMkRNHJAr                                                                       │
│  └──                                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -2202664                                                                                        │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )           │
│  │ CoinType: 0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::FAUCET_COIN  │
│  │ Amount: 4000000                                                                                         │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```
#### Mint faucet coin 2
```shell
letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base took 4.8s 
➜ export PACKAGE_ID=0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ export TREASURYCAP_ID=0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ sui client call --function mint --module faucet_coin --package $PACKAGE_ID --args $TREASURYCAP_ID 2000000 --gas-budget 10000000                                                              
[warn] Client/Server api version mismatch, client api version : 1.32.0, server api version : 1.38.3
Transaction Digest: H3AvV7VfofgjLnwGkB7kgo2oBskHyWE4dyPvHvxEtHxo
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                      │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                       │
│  │ Version: 420167056                                                                           │
│  │ Digest: 7mU9zvEkdFMWr9yingPEXedMmhrAHEaowrvAfkic8Kjz                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c │ │
│ │ 1   Pure Arg: Type: u64, Value: "2000000"                                                   │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  mint                                                               │            │
│ │  │ Module:    faucet_coin                                                        │            │
│ │  │ Package:   0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    oHH+oDLhBpQejhvjVP9wh0HjLCxhVbiUmXI36AW2s1tVRm4D1MbWAm6Thgb8OiHgD6W3aaVjuJ6E5F0QQEYyAg==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: H3AvV7VfofgjLnwGkB7kgo2oBskHyWE4dyPvHvxEtHxo                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 601                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa9480b0bdb4fa2cba5b6250de9b3d0a746897be25aa0c17d716ef2715e114cdf                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167057                                                                             │
│  │ Digest: 6k3EMUgCLBtcJbPiMzQx3XM726jRhtQZgZCkxUCpToA6                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167057                                                                             │
│  │ Digest: 7NxwiEZqBDoJsSaomuQcmh9p8nrjcigvu2aLiFn5DLw                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167057                                                                             │
│  │ Digest: 8eTKRdaBMC6EyZQY9hK8G1CxYi71HYTbdyurmqPcSyDt                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167057                                                                             │
│  │ Digest: 7NxwiEZqBDoJsSaomuQcmh9p8nrjcigvu2aLiFn5DLw                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3815200 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2362536 MIST                                                                   │
│    Non-refundable Storage Fee: 23864 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2mMdZ49hF56xsxuPXtthMmQXddg66vRQoLZKN4psZUmW                                                   │
│    GMVw8sXbfA6Ws1tyarQkcoFct9F5jYMTZbNBshhBVyhY                                                   │
│    GvbJ8ia1HfavuccAmi8EJJAaCGShtdv4NWrs1B13vvom                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xa9480b0bdb4fa2cba5b6250de9b3d0a746897be25aa0c17d716ef2715e114cdf                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                 │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                              │
│  │ ObjectType: 0x2::coin::Coin<0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::FAUCET_COIN>  │
│  │ Version: 420167057                                                                                                         │
│  │ Digest: 6k3EMUgCLBtcJbPiMzQx3XM726jRhtQZgZCkxUCpToA6                                                                       │
│  └──                                                                                                                          │
│ Mutated Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                 │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                              │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                 │
│  │ Version: 420167057                                                                                                         │
│  │ Digest: 7NxwiEZqBDoJsSaomuQcmh9p8nrjcigvu2aLiFn5DLw                                                                        │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                 │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                              │
│  │ ObjectType: 0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::MySupply                      │
│  │ Version: 420167057                                                                                                         │
│  │ Digest: 8eTKRdaBMC6EyZQY9hK8G1CxYi71HYTbdyurmqPcSyDt                                                                       │
│  └──                                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -2202664                                                                                        │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )           │
│  │ CoinType: 0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::FAUCET_COIN  │
│  │ Amount: 2000000                                                                                         │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

### 第三步：deposit faucet_coin
```shell
letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ export PACKAGE_ID=0x4d7b1f70c0457133d29a8b468719cb2506962da8123c04f0de4413eb32040445                                                                  

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ export POOL=0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6                                                                  

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ export FAUCET_COIN=0x704cde43470343dc6fc65409a4009bf9a261f6b919a37d26a437dc62bc67f254                                                                  

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base took 2.6s 
➜ sui client call --function deposit_faucet_coin --module move_swap --package $PACKAGE_ID --args $POOL $FAUCET_COIN --gas-budget 10000000  
[warn] Client/Server api version mismatch, client api version : 1.32.0, server api version : 1.38.3
Transaction Digest: HdyCb5jxRVcduWiQttFukxmLrhXxE9gTbQoHtSSc4aon
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                      │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                       │
│  │ Version: 420167052                                                                           │
│  │ Digest: 3ck3bDnEUWLRCcXS8QPJGe1DvbvyAPHMMPBvt9Z7piBK                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6 │ │
│ │ 1   Imm/Owned Object ID: 0x704cde43470343dc6fc65409a4009bf9a261f6b919a37d26a437dc62bc67f254 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  deposit_faucet_coin                                                │            │
│ │  │ Module:    move_swap                                                          │            │
│ │  │ Package:   0x4d7b1f70c0457133d29a8b468719cb2506962da8123c04f0de4413eb32040445 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    uSH5ic/M3Ni58wCRFS5nlH3kAT8LEXKsvhb58nY/Z8s+IaCL5PC0gWb68mleEetIUlahh+S/ULbUTwmFvSnRAQ==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: HdyCb5jxRVcduWiQttFukxmLrhXxE9gTbQoHtSSc4aon                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 601                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167053                                                                             │
│  │ Digest: f68VqZYbh4gMT577KXAyDWTXrRRNg6n7YP6Fg7FfwMk                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6                         │
│  │ Owner: Shared( 420167052 )                                                                     │
│  │ Version: 420167053                                                                             │
│  │ Digest: HBZAU5MqiUwDoNctWBt4Pa58SdTDiT4KkKV7WVDvYUTM                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6                         │
│  │ Version: 420167052                                                                             │
│  │ Digest: 9ZngjrTrkP4mYuwFz1NSsXM2ZmxrmdrRH2qksH1upYZE                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x704cde43470343dc6fc65409a4009bf9a261f6b919a37d26a437dc62bc67f254                         │
│  │ Version: 420167053                                                                             │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167053                                                                             │
│  │ Digest: f68VqZYbh4gMT577KXAyDWTXrRRNg6n7YP6Fg7FfwMk                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2401600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 3792096 MIST                                                                   │
│    Non-refundable Storage Fee: 38304 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    GMVw8sXbfA6Ws1tyarQkcoFct9F5jYMTZbNBshhBVyhY                                                   │
│    Hk5nfi7ag3QRapKi6oy8cYYzbFEcNrc4FYBo9BCZq3rH                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                      │
├─────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                    │
│  ┌──                                                                                                │
│  │ ObjectID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                     │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                       │
│  │ Version: 420167053                                                                               │
│  │ Digest: f68VqZYbh4gMT577KXAyDWTXrRRNg6n7YP6Fg7FfwMk                                              │
│  └──                                                                                                │
│  ┌──                                                                                                │
│  │ ObjectID: 0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6                     │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                       │
│  │ Owner: Shared( 420167052 )                                                                       │
│  │ ObjectType: 0x4d7b1f70c0457133d29a8b468719cb2506962da8123c04f0de4413eb32040445::move_swap::Pool  │
│  │ Version: 420167053                                                                               │
│  │ Digest: HBZAU5MqiUwDoNctWBt4Pa58SdTDiT4KkKV7WVDvYUTM                                             │
│  └──                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: 640496                                                                                          │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )           │
│  │ CoinType: 0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::FAUCET_COIN  │
│  │ Amount: -4000000                                                                                        │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

### 第四步：Mint mycoin 1 4
#### Mint mycoin 1
```shell
letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base took 5.3s
➜ sui client call --function mint --module mycoin --package $PACKAGE_ID --args $TREASURYCAP_ID 1000000 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 --gas-budget 10000000
[warn] Client/Server api version mismatch, client api version : 1.32.0, server api version : 1.37.3
Transaction Digest: EnMWHbbGFiMEPaXUBwp44Go7FBp5qup22LqoXStUMuFi
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                   │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                                    │
│  │ Version: 420167048                                                                                        │
│  │ Digest: A5gSoc9FGhhcXghrsgn2KjarbanZhnVB1E9B8V5Lsz8L                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x3f2b8b45d2e7c655026dec24c15e220d18a23ed624e9caa0ccac4814aad554f2              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1000000"                                                                │ │
│ │ 2   Pure Arg: Type: address, Value: "0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    mycoin                                                             │                         │
│ │  │ Package:   0x0c303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    h3qHvkZ6x/R6SSg1wU07RN62wx4s57VNYLHyv4sEle6LpPKuYc+6hWvLNUgnvMi360bLtFYfvwVhZJ27f2SJAg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EnMWHbbGFiMEPaXUBwp44Go7FBp5qup22LqoXStUMuFi                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 600                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xd43d7a2a22c2a8c6545bdb7981d5a7e51c058b3cb0267d98cd4d1d29ea1bde39                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167049                                                                             │
│  │ Digest: D7WQ6k2KRgUci932KTX9Hq8A6VGAKkuLRcrmTACtPtFr                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167049                                                                             │
│  │ Digest: yQQdUR5xfMQGF58yVU2S8kdgDbW2AtMuviytPs2RKwd                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3f2b8b45d2e7c655026dec24c15e220d18a23ed624e9caa0ccac4814aad554f2                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167049                                                                             │
│  │ Digest: 2b6PCChbZ3v6kx6h4dFdzdCV9x4X3kwMSR99M948S2Z3                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167049                                                                             │
│  │ Digest: yQQdUR5xfMQGF58yVU2S8kdgDbW2AtMuviytPs2RKwd                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4073600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2693592 MIST                                                                   │
│    Non-refundable Storage Fee: 27208 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    K143zA8QHViWRQcVFNHrTjkddqfzV4g8qUkXqdGLxvB                                                    │
│    Hxf5uBKbu5b2ddCMbZuQPQwKWFinfMqAdgVkx6vzD12q                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                            │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                          │
│  ┌──                                                                                                                      │
│  │ ObjectID:                                             │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                             │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                          │
│  │ ObjectType: 0x2::coin::Coin<0xc303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c::mycoin::MYCOIN>         │
│  │ Version: 420167049                                                                                                     │
│  │ Digest: D7WQ6k2KRgUci932KTX9Hq8A6VGAKkuLRcrmTACtPtFr                                                                   │
│  └──                                                                                                                      │
│ Mutated Objects:                                                                                                          │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                                           │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                             │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                          │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                             │
│  │ Version: 420167049                                                                                                     │
│  │ Digest: yQQdUR5xfMQGF58yVU2S8kdgDbW2AtMuviytPs2RKwd                                                                    │
│  └──                                                                                                                      │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x3f2b8b45d2e7c655026dec24c15e220d18a23ed624e9caa0ccac4814aad554f2                                           │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                             │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                          │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xc303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c::mycoin::MYCOIN>  │
│  │ Version: 420167049                                                                                                     │
│  │ Digest: 2b6PCChbZ3v6kx6h4dFdzdCV9x4X3kwMSR99M948S2Z3                                                                   │
│  └──                                                                                                                      │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2130008                                                                               │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0xc303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c::mycoin::MYCOIN    │
│  │ Amount: 1000000                                                                                │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
#### Mint mycoin 4
```shell
letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base took 4.2s 
➜ export PACKAGE_ID=0x0c303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c 


letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ export TREASURYCAP_ID=0x3f2b8b45d2e7c655026dec24c15e220d18a23ed624e9caa0ccac4814aad554f2

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ sui client call --function mint --module mycoin --package $PACKAGE_ID --args $TREASURYCAP_ID 4000000 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 --gas-budget 10000000
[warn] Client/Server api version mismatch, client api version : 1.32.0, server api version : 1.38.3
Transaction Digest: A56LeoCXS8WK54qoHWgXqQ47mNY5GgikWyEhJEuXPVuk
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                   │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                                    │
│  │ Version: 420167053                                                                                        │
│  │ Digest: f68VqZYbh4gMT577KXAyDWTXrRRNg6n7YP6Fg7FfwMk                                                       │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x3f2b8b45d2e7c655026dec24c15e220d18a23ed624e9caa0ccac4814aad554f2              │ │
│ │ 1   Pure Arg: Type: u64, Value: "4000000"                                                                │ │
│ │ 2   Pure Arg: Type: address, Value: "0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    mycoin                                                             │                         │
│ │  │ Package:   0x0c303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    VeaTHOABxje1GmrwxZA6T+P2+iAOjMl+RVl/Sljf8e3fVnrkIakX3nYBBGbv933/g6Wow8dvE1tZBr+qzNO3Dw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: A56LeoCXS8WK54qoHWgXqQ47mNY5GgikWyEhJEuXPVuk                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 601                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2302b39636927dbcd93427c6e950e150b20181852e462a90efcc855207e7abd8                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167054                                                                             │
│  │ Digest: 9gPBVHni1X2L2pBbhF3166Jw66yX2fPS3Yjo5AafoibL                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167054                                                                             │
│  │ Digest: 2uyiy2n13tAURbZMkgV5BQsWwHyeCZAEiTSAo5fzhZrn                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3f2b8b45d2e7c655026dec24c15e220d18a23ed624e9caa0ccac4814aad554f2                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167054                                                                             │
│  │ Digest: 82ei1vmoW8Jb6VUAtG9xNZYDU9TUxbCf7E7AZ2GRvWwC                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167054                                                                             │
│  │ Digest: 2uyiy2n13tAURbZMkgV5BQsWwHyeCZAEiTSAo5fzhZrn                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4073600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2693592 MIST                                                                   │
│    Non-refundable Storage Fee: 27208 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    K143zA8QHViWRQcVFNHrTjkddqfzV4g8qUkXqdGLxvB                                                    │
│    EnMWHbbGFiMEPaXUBwp44Go7FBp5qup22LqoXStUMuFi                                                   │
│    HdyCb5jxRVcduWiQttFukxmLrhXxE9gTbQoHtSSc4aon                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                            │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                          │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x2302b39636927dbcd93427c6e950e150b20181852e462a90efcc855207e7abd8                                           │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                             │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                          │
│  │ ObjectType: 0x2::coin::Coin<0xc303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c::mycoin::MYCOIN>         │
│  │ Version: 420167054                                                                                                     │
│  │ Digest: 9gPBVHni1X2L2pBbhF3166Jw66yX2fPS3Yjo5AafoibL                                                                   │
│  └──                                                                                                                      │
│ Mutated Objects:                                                                                                          │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                                           │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                             │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                          │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                             │
│  │ Version: 420167054                                                                                                     │
│  │ Digest: 2uyiy2n13tAURbZMkgV5BQsWwHyeCZAEiTSAo5fzhZrn                                                                   │
│  └──                                                                                                                      │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x3f2b8b45d2e7c655026dec24c15e220d18a23ed624e9caa0ccac4814aad554f2                                           │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                             │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                          │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xc303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c::mycoin::MYCOIN>  │
│  │ Version: 420167054                                                                                                     │
│  │ Digest: 82ei1vmoW8Jb6VUAtG9xNZYDU9TUxbCf7E7AZ2GRvWwC                                                                   │
│  └──                                                                                                                      │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2130008                                                                               │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0xc303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c::mycoin::MYCOIN    │
│  │ Amount: 4000000                                                                                │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```
### 第五步：deposit mycoin 
```shell
letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base took 4.2s 
➜ export MYCOIN=0x2302b39636927dbcd93427c6e950e150b20181852e462a90efcc855207e7abd8        

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ export PACKAGE_ID=0x4d7b1f70c0457133d29a8b468719cb2506962da8123c04f0de4413eb32040445

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ export POOL=0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6      

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ sui client call --function deposit_mycoin --module move_swap --package $PACKAGE_ID --args $POOL $MYCOIN --gas-budget 10000000                                                                
[warn] Client/Server api version mismatch, client api version : 1.32.0, server api version : 1.38.3
Transaction Digest: GHk5P7xxgkM2hkTyLAqDrXP9pjJUenvevKps5usbKQf8
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                      │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                       │
│  │ Version: 420167054                                                                           │
│  │ Digest: 2uyiy2n13tAURbZMkgV5BQsWwHyeCZAEiTSAo5fzhZrn                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6 │ │
│ │ 1   Imm/Owned Object ID: 0x2302b39636927dbcd93427c6e950e150b20181852e462a90efcc855207e7abd8 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  deposit_mycoin                                                     │            │
│ │  │ Module:    move_swap                                                          │            │
│ │  │ Package:   0x4d7b1f70c0457133d29a8b468719cb2506962da8123c04f0de4413eb32040445 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    qwqJZhQe76Peh3E9YOhxi8gP6CXLL8jBYfs8YP1T5s6IzqDHp4rsol8EK1OSbD0WncIhYDwzLh4F3akeQOheBQ==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GHk5P7xxgkM2hkTyLAqDrXP9pjJUenvevKps5usbKQf8                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 601                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167055                                                                             │
│  │ Digest: EpfeRWFJmpyefBXLa1vhWWsjiZwCbGT3KdfbZfVsKXFN                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6                         │
│  │ Owner: Shared( 420167052 )                                                                     │
│  │ Version: 420167055                                                                             │
│  │ Digest: BdySQeaHrSks17MPrgQJiqDQkLrrGAm9S2R3fT92sAxD                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6                         │
│  │ Version: 420167053                                                                             │
│  │ Digest: HBZAU5MqiUwDoNctWBt4Pa58SdTDiT4KkKV7WVDvYUTM                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2302b39636927dbcd93427c6e950e150b20181852e462a90efcc855207e7abd8                         │
│  │ Version: 420167055                                                                             │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167055                                                                             │
│  │ Digest: EpfeRWFJmpyefBXLa1vhWWsjiZwCbGT3KdfbZfVsKXFN                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2401600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 3716856 MIST                                                                   │
│    Non-refundable Storage Fee: 37544 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    A56LeoCXS8WK54qoHWgXqQ47mNY5GgikWyEhJEuXPVuk                                                   │
│    HdyCb5jxRVcduWiQttFukxmLrhXxE9gTbQoHtSSc4aon                                                   │
│    Hk5nfi7ag3QRapKi6oy8cYYzbFEcNrc4FYBo9BCZq3rH                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                      │
├─────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                    │
│  ┌──                                                                                                │
│  │ ObjectID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                     │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                       │
│  │ Version: 420167055                                                                               │
│  │ Digest: EpfeRWFJmpyefBXLa1vhWWsjiZwCbGT3KdfbZfVsKXFN                                             │
│  └──                                                                                                │
│  ┌──                                                                                                │
│  │ ObjectID: 0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6                     │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                       │
│  │ Owner: Shared( 420167052 )                                                                       │
│  │ ObjectType: 0x4d7b1f70c0457133d29a8b468719cb2506962da8123c04f0de4413eb32040445::move_swap::Pool  │
│  │ Version: 420167055                                                                               │
│  │ Digest: BdySQeaHrSks17MPrgQJiqDQkLrrGAm9S2R3fT92sAxD                                             │
│  └──                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: 565256                                                                                 │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0xc303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c::mycoin::MYCOIN    │
│  │ Amount: -4000000                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```
### 第六步：swap mycoin_to_faucet_coin
```shell
letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base took 4.6s 
➜ export MYCOIN=0xd43d7a2a22c2a8c6545bdb7981d5a7e51c058b3cb0267d98cd4d1d29ea1bde39                                                                  

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ echo $PACKAGE_ID                                                                
0x4d7b1f70c0457133d29a8b468719cb2506962da8123c04f0de4413eb32040445

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ echo $POOL      
0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ sui client call --function mycoin_to_faucet_coin --module move_swap --package $PACKAGE_ID --args $POOL $MYCOIN --gas-budget 10000000
[warn] Client/Server api version mismatch, client api version : 1.32.0, server api version : 1.38.3
Transaction Digest: 2mMdZ49hF56xsxuPXtthMmQXddg66vRQoLZKN4psZUmW
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                      │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                       │
│  │ Version: 420167055                                                                           │
│  │ Digest: EpfeRWFJmpyefBXLa1vhWWsjiZwCbGT3KdfbZfVsKXFN                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6 │ │
│ │ 1   Imm/Owned Object ID: 0xd43d7a2a22c2a8c6545bdb7981d5a7e51c058b3cb0267d98cd4d1d29ea1bde39 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  mycoin_to_faucet_coin                                              │            │
│ │  │ Module:    move_swap                                                          │            │
│ │  │ Package:   0x4d7b1f70c0457133d29a8b468719cb2506962da8123c04f0de4413eb32040445 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    5CkWIPyGfOhkE8J8ucfXNh3WBPX0LkxJalLTRD+tMCmL2uhuQ9kOiMWH1cFRdVW+AT/DrEvtguMb1Ek9OxIBDw==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2mMdZ49hF56xsxuPXtthMmQXddg66vRQoLZKN4psZUmW                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 601                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8bb81eef859c9a2afb7daa18a93aa08db2f4f707471bf1399c6015144dfa16d7                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167056                                                                             │
│  │ Digest: 5v3VBfpVPGXreomMTbvV7T3dhW1sr3JszvWm5iNKwx1H                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167056                                                                             │
│  │ Digest: 7mU9zvEkdFMWr9yingPEXedMmhrAHEaowrvAfkic8Kjz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6                         │
│  │ Owner: Shared( 420167052 )                                                                     │
│  │ Version: 420167056                                                                             │
│  │ Digest: D4ogDKi8zkczzxBCbuf6evfdBFadJpJXQftXU48qSuBD                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6                         │
│  │ Version: 420167055                                                                             │
│  │ Digest: BdySQeaHrSks17MPrgQJiqDQkLrrGAm9S2R3fT92sAxD                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xd43d7a2a22c2a8c6545bdb7981d5a7e51c058b3cb0267d98cd4d1d29ea1bde39                         │
│  │ Version: 420167056                                                                             │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167056                                                                             │
│  │ Digest: 7mU9zvEkdFMWr9yingPEXedMmhrAHEaowrvAfkic8Kjz                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3830400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 3716856 MIST                                                                   │
│    Non-refundable Storage Fee: 37544 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    EnMWHbbGFiMEPaXUBwp44Go7FBp5qup22LqoXStUMuFi                                                   │
│    GHk5P7xxgkM2hkTyLAqDrXP9pjJUenvevKps5usbKQf8                                                   │
│    Hk5nfi7ag3QRapKi6oy8cYYzbFEcNrc4FYBo9BCZq3rH                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x8bb81eef859c9a2afb7daa18a93aa08db2f4f707471bf1399c6015144dfa16d7                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                 │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                              │
│  │ ObjectType: 0x2::coin::Coin<0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::FAUCET_COIN>  │
│  │ Version: 420167056                                                                                                         │
│  │ Digest: 5v3VBfpVPGXreomMTbvV7T3dhW1sr3JszvWm5iNKwx1H                                                                       │
│  └──                                                                                                                          │
│ Mutated Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                 │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                              │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                 │
│  │ Version: 420167056                                                                                                         │
│  │ Digest: 7mU9zvEkdFMWr9yingPEXedMmhrAHEaowrvAfkic8Kjz                                                                       │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                 │
│  │ Owner: Shared( 420167052 )                                                                                                 │
│  │ ObjectType: 0x4d7b1f70c0457133d29a8b468719cb2506962da8123c04f0de4413eb32040445::move_swap::Pool                            │
│  │ Version: 420167056                                                                                                         │
│  │ Digest: D4ogDKi8zkczzxBCbuf6evfdBFadJpJXQftXU48qSuBD                                                                       │
│  └──                                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -863544                                                                                         │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )           │
│  │ CoinType: 0xc303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c::mycoin::MYCOIN             │
│  │ Amount: -1000000                                                                                        │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )           │
│  │ CoinType: 0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::FAUCET_COIN  │
│  │ Amount: 2000000                                                                                         │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```
### 第七步：swap faucet_coin_to_mycoin
```shell
letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base took 4.9s 
➜ export FAUCET_COIN=0xa9480b0bdb4fa2cba5b6250de9b3d0a746897be25aa0c17d716ef2715e114cdf                                                                  

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ export PACKAGE_ID=0x4d7b1f70c0457133d29a8b468719cb2506962da8123c04f0de4413eb32040445 

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ export POOL=0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6      

letsmove/mover/qiaopengjun5162/code/task5/move_swap on  main [!?] via 🅒 base 
➜ sui client call --function faucet_coin_to_mycoin --module move_swap --package $PACKAGE_ID --args $POOL $FAUCET_COIN --gas-budget 10000000
[warn] Client/Server api version mismatch, client api version : 1.32.0, server api version : 1.38.3
Transaction Digest: 9o1AsQEo61ZrfZNWogiTTYoxSdWKFh1MAAJYxbZcAkHo
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                      │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                       │
│  │ Version: 420167057                                                                           │
│  │ Digest: 7NxwiEZqBDoJsSaomuQcmh9p8nrjcigvu2aLiFn5DLw                                          │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6 │ │
│ │ 1   Imm/Owned Object ID: 0xa9480b0bdb4fa2cba5b6250de9b3d0a746897be25aa0c17d716ef2715e114cdf │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  faucet_coin_to_mycoin                                              │            │
│ │  │ Module:    move_swap                                                          │            │
│ │  │ Package:   0x4d7b1f70c0457133d29a8b468719cb2506962da8123c04f0de4413eb32040445 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    UMA/GQCkzeZXDmd2IK0dwDX+EoeDnfnsPWFiUOcA6zPigvIGIaS5GRFPjfepNVNHgwn2EC6T3Wgx1pnQRpEoDQ==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9o1AsQEo61ZrfZNWogiTTYoxSdWKFh1MAAJYxbZcAkHo                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 601                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x71d870e486ae9613e8ff675abe76929d15e0320023af52fec54bebeaae23f756                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167058                                                                             │
│  │ Digest: BFzoT1UBLT1JZkwhCL9wdDwiVQ3kNaFP5w2h3bbSWryU                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167058                                                                             │
│  │ Digest: J1mhthK3x9CdPmce2bZjUFFs9YvMqmveLA43mnsR5oNz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6                         │
│  │ Owner: Shared( 420167052 )                                                                     │
│  │ Version: 420167058                                                                             │
│  │ Digest: EzdRZwbRTerEFErUEqjXUWCeiijrL9BvVB2SSiBGfU4x                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6                         │
│  │ Version: 420167056                                                                             │
│  │ Digest: D4ogDKi8zkczzxBCbuf6evfdBFadJpJXQftXU48qSuBD                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa9480b0bdb4fa2cba5b6250de9b3d0a746897be25aa0c17d716ef2715e114cdf                         │
│  │ Version: 420167058                                                                             │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 420167058                                                                             │
│  │ Digest: J1mhthK3x9CdPmce2bZjUFFs9YvMqmveLA43mnsR5oNz                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3754400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 3792096 MIST                                                                   │
│    Non-refundable Storage Fee: 38304 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2mMdZ49hF56xsxuPXtthMmQXddg66vRQoLZKN4psZUmW                                                   │
│    H3AvV7VfofgjLnwGkB7kgo2oBskHyWE4dyPvHvxEtHxo                                                   │
│    Hk5nfi7ag3QRapKi6oy8cYYzbFEcNrc4FYBo9BCZq3rH                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                     │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                   │
│  ┌──                                                                                                               │
│  │ ObjectID: 0x71d870e486ae9613e8ff675abe76929d15e0320023af52fec54bebeaae23f756                                    │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                      │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                   │
│  │ ObjectType: 0x2::coin::Coin<0xc303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c::mycoin::MYCOIN>  │
│  │ Version: 420167058                                                                                              │
│  │ Digest: BFzoT1UBLT1JZkwhCL9wdDwiVQ3kNaFP5w2h3bbSWryU                                                            │
│  └──                                                                                                               │
│ Mutated Objects:                                                                                                   │
│  ┌──                                                                                                               │
│  │ ObjectID: 0x37405be31b4598ced9f58c92ac4ecf5f2b656af98b6cd858c3c4e4150437db68                                    │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                      │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                   │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                      │
│  │ Version: 420167058                                                                                              │
│  │ Digest: J1mhthK3x9CdPmce2bZjUFFs9YvMqmveLA43mnsR5oNz                                                            │
│  └──                                                                                                               │
│  ┌──                                                                                                               │
│  │ ObjectID: 0x437eeea98491de9f89b2145277b985ef416c74b1deed9668727e4343546ea7b6                                    │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                      │
│  │ Owner: Shared( 420167052 )                                                                                      │
│  │ ObjectType: 0x4d7b1f70c0457133d29a8b468719cb2506962da8123c04f0de4413eb32040445::move_swap::Pool                 │
│  │ Version: 420167058                                                                                              │
│  │ Digest: EzdRZwbRTerEFErUEqjXUWCeiijrL9BvVB2SSiBGfU4x                                                            │
│  └──                                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -712304                                                                                         │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )           │
│  │ CoinType: 0xc303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c::mycoin::MYCOIN             │
│  │ Amount: 1000000                                                                                         │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )           │
│  │ CoinType: 0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::FAUCET_COIN  │
│  │ Amount: -2000000                                                                                        │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```


## 参考
- https://suiscan.xyz/mainnet/object/0x6dd8425ca7a82f859a766fcd311c00c7d42c05f0269d02b9fe2c79cf0ddc0f12/txs
- https://suiscan.xyz/mainnet/object/0x4d7b1f70c0457133d29a8b468719cb2506962da8123c04f0de4413eb32040445/txs
- https://suiscan.xyz/mainnet/tx/2mMdZ49hF56xsxuPXtthMmQXddg66vRQoLZKN4psZUmW
### Deployment
Command:
```bash
sui client publish --gas-budget 500000000
```
```
Transaction Digest: G8sV4NpDAa6gRNdeTpf8qjyWXLAKzLrjMCL5MfqpLMJr
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28                                   │
│ Gas Owner: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28                                │
│ Gas Budget: 500000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x833e3be3457d42b94eeaf5372c9180eff19ed933d03ba16faeb0dd035f82ef72                                    │
│  │ Version: 960154                                                                                           │
│  │ Digest: 8tpa4UnGhiBHyfUpkmsjyzpy1NCr6M7rroj2EDUsMX3K                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28" │ │
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
│    iuY3KLVnpyqSBjcknIatK0Vb7o2BdrRJOIQfgOlWtHn0BjLr8ZozxZHV8ybqCgm8AUf4M/Vk4MgcMuHDZ/D2Bw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: G8sV4NpDAa6gRNdeTpf8qjyWXLAKzLrjMCL5MfqpLMJr                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 333                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xd06435923fcaa2093b897427d13eb8ccf11d108af48123cd421ce8096ce9c85b                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: Gp2kDxxuJcdGb8yThXh8Symy2R7g5CukXUHjDn67akgS                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xfb8223557ad26ab66acf18f2b327b4064a3f275d66a85f32754a33d8ead9413a                         │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )  │
│  │ Version: 960155                                                                                │
│  │ Digest: GZqdq32jTTMrp8jGoMvoci18kV9dtJUARxevvUNiwjTU                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x833e3be3457d42b94eeaf5372c9180eff19ed933d03ba16faeb0dd035f82ef72                         │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )  │
│  │ Version: 960155                                                                                │
│  │ Digest: 5mnLQsuNWwSjw354vaT1eSZ5NyswrAS1dnpU4fsKmbK5                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x833e3be3457d42b94eeaf5372c9180eff19ed933d03ba16faeb0dd035f82ef72                         │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )  │
│  │ Version: 960155                                                                                │
│  │ Digest: 5mnLQsuNWwSjw354vaT1eSZ5NyswrAS1dnpU4fsKmbK5                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7197200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
│    92ra5FUdo3bYX8yKkguhvjt261FmgxBVJXFzn9p8psty                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xfb8223557ad26ab66acf18f2b327b4064a3f275d66a85f32754a33d8ead9413a                  │
│  │ Sender: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28                    │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 960155                                                                               │
│  │ Digest: GZqdq32jTTMrp8jGoMvoci18kV9dtJUARxevvUNiwjTU                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x833e3be3457d42b94eeaf5372c9180eff19ed933d03ba16faeb0dd035f82ef72                  │
│  │ Sender: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28                    │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 960155                                                                               │
│  │ Digest: 5mnLQsuNWwSjw354vaT1eSZ5NyswrAS1dnpU4fsKmbK5                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xd06435923fcaa2093b897427d13eb8ccf11d108af48123cd421ce8096ce9c85b                 │
│  │ Version: 1                                                                                    │
│  │ Digest: Gp2kDxxuJcdGb8yThXh8Symy2R7g5CukXUHjDn67akgS                                          │
│  │ Modules: mygame                                                                               │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7219080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```


### Play game
command
```bash
export  PACKAGE_ID=0xd06435923fcaa2093b897427d13eb8ccf11d108af48123cd421ce8096ce9c85b
```
```bash
sui client call --function play --module mygame --package $PACKAGE_ID --args 2 
```

output:
```
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28                  │
│ Gas Owner: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28               │
│ Gas Budget: 100000000 MIST                                                                  │
│ Gas Price: 1000 MIST                                                                        │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x833e3be3457d42b94eeaf5372c9180eff19ed933d03ba16faeb0dd035f82ef72                   │
│  │ Version: 960155                                                                          │
│  │ Digest: 5mnLQsuNWwSjw354vaT1eSZ5NyswrAS1dnpU4fsKmbK5                                     │
│  └──                                                                                        │
│                                                                                             │
│ Transaction Kind: Programmable                                                              │
│ ╭─────────────────────────────────────╮                                                     │
│ │ Input Objects                       │                                                     │
│ ├─────────────────────────────────────┤                                                     │
│ │ 0   Pure Arg: Type: u64, Value: "2" │                                                     │
│ ╰─────────────────────────────────────╯                                                     │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮        │
│ │ Commands                                                                         │        │
│ ├──────────────────────────────────────────────────────────────────────────────────┤        │
│ │ 0  MoveCall:                                                                     │        │
│ │  ┌                                                                               │        │
│ │  │ Function:  play                                                               │        │
│ │  │ Module:    mygame                                                             │        │
│ │  │ Package:   0xd06435923fcaa2093b897427d13eb8ccf11d108af48123cd421ce8096ce9c85b │        │
│ │  │ Arguments:                                                                    │        │
│ │  │   Input  0                                                                    │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    2S6jHYNQn/cLHuRPE3S+w+kiIq5dJ296YTvbHXKDjNGxsKW9Q4VUAy8D5FooKutF6dm2L/fLP+cQSRfWo1dLDw== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: H33QAHeVTGbyjus9vHY5SDcVt3jg5Z95ktS4DeR7ygdi                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 333                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x833e3be3457d42b94eeaf5372c9180eff19ed933d03ba16faeb0dd035f82ef72                         │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )  │
│  │ Version: 960156                                                                                │
│  │ Digest: CpXBtCSP8bNrnDAqmo9ibxiLYkQpQXERKtxVP8hBvEng                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x833e3be3457d42b94eeaf5372c9180eff19ed933d03ba16faeb0dd035f82ef72                         │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )  │
│  │ Version: 960156                                                                                │
│  │ Digest: CpXBtCSP8bNrnDAqmo9ibxiLYkQpQXERKtxVP8hBvEng                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 988000 MIST                                                                      │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    G8sV4NpDAa6gRNdeTpf8qjyWXLAKzLrjMCL5MfqpLMJr                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                 │
│  │ EventID: H33QAHeVTGbyjus9vHY5SDcVt3jg5Z95ktS4DeR7ygdi:0                                           │
│  │ PackageID: 0xd06435923fcaa2093b897427d13eb8ccf11d108af48123cd421ce8096ce9c85b                     │
│  │ Transaction Module: mygame                                                                        │
│  │ Sender: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28                        │
│  │ EventType: 0xd06435923fcaa2093b897427d13eb8ccf11d108af48123cd421ce8096ce9c85b::mygame::GameRecord │
│  │ ParsedJSON:                                                                                       │
│  │   ┌─────────────┬───────┐                                                                         │
│  │   │ real_number │ 120   │                                                                         │
│  │   ├─────────────┼───────┤                                                                         │
│  │   │ user_input  │ 2     │                                                                         │
│  │   ├─────────────┼───────┤                                                                         │
│  │   │ win         │ false │                                                                         │
│  │   └─────────────┴───────┘                                                                         │
│  └──                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x833e3be3457d42b94eeaf5372c9180eff19ed933d03ba16faeb0dd035f82ef72                  │
│  │ Sender: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28                    │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 960156                                                                               │
│  │ Digest: CpXBtCSP8bNrnDAqmo9ibxiLYkQpQXERKtxVP8hBvEng                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1009880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
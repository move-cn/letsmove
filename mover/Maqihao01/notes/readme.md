# hello move

sui client publish --gas-budget 20000000

Cannot find gas coin for signer address 0x6a12133055bcb6819a5b03e5dc0a8ca8c862cfa1c63020a34519c07cbc976bbf with amount sufficient for the required gas budget 20000000. If you are using the pay or transfer commands, you can use pay-sui or transfer-sui commands instead, which will use the only object as gas payment.

sui client faucet

sui client balance

╭────────────────────────────────────────╮
│ Balance of coins owned by this address │
├────────────────────────────────────────┤
│ ╭─────────────────────────────────╮    │
│ │ coin  balance (raw)  balance    │    │
│ ├─────────────────────────────────┤    │
│ │ Sui   1000000000     1.00 SUI   │    │
│ ╰─────────────────────────────────╯    │
╰────────────────────────────────────────╯

sui client publish --gas-budget 20000000


│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x5f26c2d4153c38f1b51f8ff2c15d3cfc36454701a614260a3c16417533bb4604                 │
│  │ Version: 1                                                                                    │
│  │ Digest: FfnL9BRBp28WVuhefqaHWrPWy2C9tqjCj8UAUo2VsgeU                                          │
│  │ Modules: hello_move                                                                           │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
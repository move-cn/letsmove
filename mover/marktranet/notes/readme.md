task1: 
sui client publish --gas-budget 20000000

提示：
Cannot find gas coin for signer address 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd with amount sufficient for the required gas budget 20000000. If you are using the pay or transfer commands, you can use pay-sui or transfer-sui commands instead, which will use the only object as gas payment.

sui client faucet

╭────────────────────────────────────────────────────────────────────┬────────────────────┬──────────────────╮
│ gasCoinId                                                          │ mistBalance (MIST) │ suiBalance (SUI) │
├────────────────────────────────────────────────────────────────────┼────────────────────┼──────────────────┤
│ 0x14235f111b81ef55c5889f9743da8977cecd760e47f20d5ac34eed24b97c065f │ 1000000000         │ 1.00             │
╰────────────────────────────────────────────────────────────────────┴────────────────────┴──────────────────╯

sui client publish --gas-budget 20000000

│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xf24f35d9cd430bd7cdfdef40127b6e43ac7dd3219fe8344f45cf7675c312b557                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 8KgNMNuf7vFXm1dc8Ypf5sWE2WSQdR1bk86BUxBkoFWF                                          │
│  │ Modules: hello_move                                                                           │
│  └──                        
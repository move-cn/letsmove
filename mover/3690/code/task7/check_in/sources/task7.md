1. 确保在测试网，因为0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd在测试网上

2. 把源码publish上链

3. 查询上一个人输入后得到的str

[点击](https://testnet.suivision.xyz/object/0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56)查询，Fields里的str便是
当然，也可以通过`sui client object <ObjectID>`等方式查看

4. 使用ascii编码转换一下str

5. 使用命令调用

sui client call  --package 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd --module check_in --function get_flag --gas-budget 10000000 --args "6|R2M52rcc=Oo:q" 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56 0x8

Transaction Digest: JD6Kh1gvFmoNit8GA9RGkMULTFXZuVyRdyw9GcPUGK6F
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x87c9d18b81827481a9c637e9514ba443fb595718b837192d74413789b5fa8d14                      │
│ Gas Owner: 0x87c9d18b81827481a9c637e9514ba443fb595718b837192d74413789b5fa8d14                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x6092e16650fc5173bb01834e9a72378a51a620fb2f125f99f05b3b133d22087f                       │
│  │ Version: 48024462                                                                            │
│  │ Digest: FBoU24pPw4miZYExFothnriyLXM7vP1TFgSWX9Enbhfk                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "6|R2M52rcc=Oo:q"                                    │ │
│ │ 1   Shared Object    ID: 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56 │ │
│ │ 2   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000008 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
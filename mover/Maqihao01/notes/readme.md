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

# move coin

sui官网教程[coin](https://docs.sui.io/references/framework/sui-framework/coin#0x2_coin_create_currency)

里面
```
let (treasury_cap, metadata) = create_currency(
        witness,
        decimals,
        symbol,
        name,
        description,
        icon_url,
        ctx
    );
```

coin和faucet coin都参考这个

```
let (treasury_cap, metadata) = coin::create_currency<MAQIHAO01_COIN>(
    witness,
    9,
    b"MAQIHAO01_COIN",
    b"MAQIHAO01_COIN",
    b"coin create by mqh",
    option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/167278891")),
    ctx
);
```

区别在于
transfer::public_transfer(treasury_cap, tx_context::sender(ctx))

transfer::public_share_object(treasury_cap)


sui client publish --gas-budget 40000000

```
Failed to publish the Move module(s), reason: [warning] Multiple source verification errors found:

- Local dependency did not match its on-chain version at 0000000000000000000000000000000000000000000000000000000000000002::Sui::object
- Local dependency did not match its on-chain version at 0000000000000000000000000000000000000000000000000000000000000002::Sui::deny_list

This may indicate that the on-chain version(s) of your package's dependencies may behave differently than the source version(s) your package was built against.

Fix this by rebuilding your packages with source versions matching on-chain versions of dependencies, or ignore this warning by re-running with the --skip-dependency-verification flag.
```

最后靠把环境都删了解决了...

Error executing transaction: Failure {
    error: "InsufficientGas",
}

PackageID: 0x1ca368d08ea0c4faff0ddb54e8bfab95a69c4c74b64c2ca405a13e2536c0145b                           

ObjectID: 0x6ba137622dee69c669a7196f6db38761ab5113cfd23b168d3bc8817807e2e4d6 
ObjectType: 0x2::coin::TreasuryCap<0x1ca368d08ea0c4faff0ddb54e8bfab95a69c4c74b64c2ca405a13e2536c0145b::maqihao01_coin::MAQIHAO01_COIN>     

ObjectID: 0x1d0672c4fb32640378fa0612e2570388aa691dd4a0581db797328b72188c8e58  
ObjectType: 0x2::coin::TreasuryCap<0x1ca368d08ea0c4faff0ddb54e8bfab95a69c4c74b64c2ca405a13e2536c0145b::maqihao01_faucet_coin::MAQIHAO01_FAUCET_COIN> 

mint coin 给 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2:

sui client call --gas-budget 7500000 --package 0x1ca368d08ea0c4faff0ddb54e8bfab95a69c4c74b64c2ca405a13e2536c0145b --module maqihao01_coin --function mint --args 0x6ba137622dee69c669a7196f6db38761ab5113cfd23b168d3bc8817807e2e4d6 1000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

Transaction Digest: FVCbP4hCHN82vjW5teKW1E7d5hjcxMTypirYKPya8Df7

mint faucet coin 给 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2:

sui client call --gas-budget 7500000 --package 0x1ca368d08ea0c4faff0ddb54e8bfab95a69c4c74b64c2ca405a13e2536c0145b --module maqihao01_faucet_coin --function mint --args 0x1d0672c4fb32640378fa0612e2570388aa691dd4a0581db797328b72188c8e58  1000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

Transaction Digest: GuSdJm1x7gzEXwjdw1RiMsP2xHTJKggif2SEmqhTTWMP

mint faucet coin 给自己：

sui client call --gas-budget 7500000 --package 0x1ca368d08ea0c4faff0ddb54e8bfab95a69c4c74b64c2ca405a13e2536c0145b --module maqihao01_faucet_coin --function mint --args 0x1d0672c4fb32640378fa0612e2570388aa691dd4a0581db797328b72188c8e58 1000 0x6a12133055bcb6819a5b03e5dc0a8ca8c862cfa1c63020a34519c07cbc976bbf

Transaction Digest: 8WM3MYtMLX2HddghqiiAb9mZRi42DzYCS8EY8LxkHxvU
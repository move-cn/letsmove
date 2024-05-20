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

# move nft

sui client publish --gas-budget 20000000

PackageID: 0x286f40d72aacd5b6ff9db1e126f0585ffa610e479f2f49e95461614c1aa7797d    

sui client call --package 0x286f40d72aacd5b6ff9db1e126f0585ffa610e479f2f49e95461614c1aa7797d --module maqihao01_nft --function mint_to --args "Maqihao01" 0x6a12133055bcb6819a5b03e5dc0a8ca8c862cfa1c63020a34519c07cbc976bbf --gas-budget 20000000

ObjectID: 0x271473b05579d0aa1f6c93129026c0d1903e2b9ae785b7992a5eccefc9086ca6        

Transaction Digest: HzFDyzBqpWwm5EnLtttBQ6SUWtF9LJPounPKYcHAkjuS

sui client call --package 0x286f40d72aacd5b6ff9db1e126f0585ffa610e479f2f49e95461614c1aa7797d --module maqihao01_nft --function mint_to --args "SEND BY Maqihao01" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 20000000

Transaction Digest: HMmLRQdRhrrgffSKDeiKXSv1nAkQQ1EivTQfQayHeM7S


# move game 

sui client publish --gas-budget 20000000

PackageID: 0x0dd09a296ae728ca4660f5b0c24a7e5ba71377150d8f8ab1cd00f883cb41c817 

export PackageID=0x0dd09a296ae728ca4660f5b0c24a7e5ba71377150d8f8ab1cd00f883cb41c817    

task2:
ObjectID: 0x1d0672c4fb32640378fa0612e2570388aa691dd4a0581db797328b72188c8e58  
ObjectType: 0x2::coin::TreasuryCap<0x1ca368d08ea0c4faff0ddb54e8bfab95a69c4c74b64c2ca405a13e2536c0145b::maqihao01_faucet_coin::MAQIHAO01_FAUCET_COIN> 

export FaucetId=0x1ca368d08ea0c4faff0ddb54e8bfab95a69c4c74b64c2ca405a13e2536c0145b::maqihao01_faucet_coin::MAQIHAO01_FAUCET_COIN

sui client call --gas-budget 7500000 --package $PackageID --module maqihao01_game --function creat_game --type-args $FaucetId

adminCap: 0x5d8924c720dbb42219b9d92aa7e769d4204f3cbfb07eda9abbcbc8304d2a089c           

gameId: 0x647fc095301e47303082252606d2057e90981be3027ffcf6aea1a448b43c79fd         

export GameId=0x647fc095301e47303082252606d2057e90981be3027ffcf6aea1a448b43c79fd    

export AdminCap=0x5d8924c720dbb42219b9d92aa7e769d4204f3cbfb07eda9abbcbc8304d2a089c             

export MyAddress=0x6a12133055bcb6819a5b03e5dc0a8ca8c862cfa1c63020a34519c07cbc976bbf
export Task2Pack=0x1ca368d08ea0c4faff0ddb54e8bfab95a69c4c74b64c2ca405a13e2536c0145b

export TreasureId=0x1d0672c4fb32640378fa0612e2570388aa691dd4a0581db797328b72188c8e58  

sui client call --package $Task2Pack  --module maqihao01_faucet_coin --function mint --args $TreasureId 1000000 $MyAddress --gas-budget 50000000

ObjectID: 0xcdefea25b3efa00c1c5c04d0abdabfb62f0a17789fb453550856256a82ebe073  
export FaucetCoin=0xcdefea25b3efa00c1c5c04d0abdabfb62f0a17789fb453550856256a82ebe073  

sui client call --package $PackageID --module maqihao01_game --function deposit  --type-args $FaucetId --args $GameId $FaucetCoin 500000 --gas-budget 20000000

ObjectID: 0x4cabbeb61b8757365bc916442d9d9cd8240e4c3d9651c9caa660a333adabd8d8     

Transaction Digest: C6xtMYvQ95ejmQJKiBKYChaQ5ArdUPzvHUoyFxQgcDQR

export GameCoin=0x4cabbeb61b8757365bc916442d9d9cd8240e4c3d9651c9caa660a333adabd8d8

sui client call --package $PackageID --module maqihao01_game --function play --type-args $FaucetId --args 2 $GameId $GameCoin 0x6 --gas-budget 10000000

Transaction Digest: EYMj9BU8ExcCXxugJYpAHbnhNGxMtNaVFvCgFcg1BhzZ

sui client call --package $PackageID --module maqihao01_game --function withdraw --type-args $FaucetId --args $AdminCap $GameId 2000 --gas-budget 10000000

Transaction Digest: gxNRnVf7X45Qpw8E9czvVjRc8kwGvkWkVWwD33LVDnT
### 创建项目

~~~bash
sui move sui move new csdv_coin
~~~

#### 编写合约代码

##### my coin

~~~rust
/// Module: my_coin
module csdv_coin::my_coin {
    use sui::coin;

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury_cap, coin_metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"MYCOIN",        // symbol
            b"MY COIN",       // name
            b"MY COIN TEST",  // description
            option::none(),   // icon url
            ctx
        );

        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
        transfer::public_freeze_object(coin_metadata);
    }

    public entry fun mint(treasury: &mut coin::TreasuryCap<MY_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }

    public entry fun burn(treasury: &mut coin::TreasuryCap<MY_COIN>, coin: coin::Coin<MY_COIN>) {
        coin::burn(treasury, coin);
    }
}
~~~

##### facuet

~~~rust
/// Module: facuet
module csdv_coin::facuet_coin {
    use sui::coin;

    public struct FACUET_COIN has drop {}

    fun init(witness: FACUET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, coin_metadata) = coin::create_currency(
            witness,
            6,                    // decimals
            b"FACUETCOIN",        // symbol
            b"FACUET COIN",       // name
            b"FACUET COIN TEST",  // description
            option::none(),       // icon url
            ctx
        );
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
        transfer::public_freeze_object(coin_metadata);
    }

    public entry fun mint(treasury: &mut coin::TreasuryCap<FACUET_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }

    public entry fun burn(treasury: &mut coin::TreasuryCap<FACUET_COIN>, coin: coin::Coin<FACUET_COIN>) {
        coin::burn(treasury, coin);
    }
}
~~~

#### cli发布

新增主网节点关联

~~~bash
sui client new-env --alias mainnet --rpc https://fullnode.mainnet.sui.io:443
~~~

切换到主网节点

~~~bash
sui client switch --env mainnet
~~~

发布

~~~bash
sui client publish --gas-budget 100000000
~~~

发布成功之后，相关id

**my coin package id:** [0x5ddecbbdff30f5bd2cebb6e364322d0f5d56f2fa4c675069a8827a58df5f0aa6](0x5ddecbbdff30f5bd2cebb6e364322d0f5d56f2fa4c675069a8827a58df5f0aa6)

**my coin treasurycap id:**[0xeabe493601f2b6b177e79775254b109ad19b448db15e8a8a26af76b1dc280ab1](https://suiscan.xyz/mainnet/object/0xeabe493601f2b6b177e79775254b109ad19b448db15e8a8a26af76b1dc280ab1)

**facuet coin package id:** [0x6ee1004d89c9a0bc680c38a29754e2f0b2208508e56e09008aa8868d24958237](https://suiscan.xyz/mainnet/object/0x6ee1004d89c9a0bc680c38a29754e2f0b2208508e56e09008aa8868d24958237)

**facuet coin treasurycap id:** [0xf139fe72bbe3d400d4c04ba98a90063ded3a840a8365f1bad3ffb3756999bdc5](https://suiscan.xyz/mainnet/object/0xf139fe72bbe3d400d4c04ba98a90063ded3a840a8365f1bad3ffb3756999bdc5)

##### 国库运行

~~~bash
export PACKAGE_ID=0x6ee1004d89c9a0bc680c38a29754e2f0b2208508e56e09008aa8868d24958237
export TREASURYCAP_ID=0xf139fe72bbe3d400d4c04ba98a90063ded3a840a8365f1bad3ffb3756999bdc5
~~~

##### facuet_coin

~~~ba'sh
sui client call --function mint --module facuet_coin --package $PACKAGE_ID --args $TREASURYCAP_ID 10000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 100000000
~~~

digest: [B5Gp55YKHjFNvVmhHy5NdbxPVFR8JVuvg8yfT1Wko6Z8](https://suiscan.xyz/mainnet/tx/B5Gp55YKHjFNvVmhHy5NdbxPVFR8JVuvg8yfT1Wko6Z8)

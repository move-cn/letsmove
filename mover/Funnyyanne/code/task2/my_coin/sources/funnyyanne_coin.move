
/// Module: my_coin
module my_coin::funnyyanne_coin {
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct FUNNYYANNE_COIN has drop {}
    // 创建代币
    // （TreasuryCap 代币的铸造权限 CoinMetadata 代币的参数）
    fun init(witness: FUNNYYANNE_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,
            b"FUNNYYYANNE COIN",
            b"FUNNYYYANNE COIN",
            b"Funnyyanne Coin",
            option:: none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    // 阻止后续修改
    public entry fun mint_in_my_module(
        treasury_cap: &mut TreasuryCap<FUNNYYANNE_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }

    // 用于销毁指定的 Coin，并减少相应的总供应量
    public entry fun burn(treasury_cap: &mut TreasuryCap<FUNNYYANNE_COIN>, c: Coin<FUNNYYANNE_COIN>) {
        coin::burn(treasury_cap, c);
    }
}


//funnyyanne   hash Transaction Digest: EQ2hzDxSdSH1KGdmqRi3fb6mStKnqzN4vgKAv2xqojXB
// 调用指令 ,三个地址参数分别对应着
// PackageID 合约id 0x1f8d02082b92c84d74b4b524d5c425f5db43f2dd5268d22522920c94addbccbc
// Object Changes 中 Created Objects 的 ObjectType 中为 TreasuryCap 的 0x795e281148c1b8a20f7ef13eac01b69918313522eaa7e9bcf43540de1d13692b
// 接收者的地址 test2中的地址  0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
// sui client call --package  0x1f8d02082b92c84d74b4b524d5c425f5db43f2dd5268d22522920c94addbccbc --module funnyyanne_coin  --function mint_in_my_module  --args  0x795e281148c1b8a20f7ef13eac01b69918313522eaa7e9bcf43540de1d13692b  20000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

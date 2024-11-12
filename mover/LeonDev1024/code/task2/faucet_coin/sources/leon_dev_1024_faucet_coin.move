module faucet_coin::leon_dev_1024_faucet_coin {
    use std::ascii::string;
    use sui::coin::{ Self, TreasuryCap };
    use sui::url;

    public struct LEON_DEV_1024_FAUCET_COIN has drop {}

    // 初始化函数，创建代币并冻结和分享相关对象
    fun init(witness: LEON_DEV_1024_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metaData) = coin::create_currency(
            witness,
            9,
            b"LDFC",
            b"LEON_DEV_1024_FAUCET_COIN",
            b"this is a faucet coin",
            option::some(url::new_unsafe(string(b"https://avatars.githubusercontent.com/u/16557117?v=4"))),
            ctx);
        transfer::public_freeze_object(metaData);
        transfer::public_share_object(treasury);
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<LEON_DEV_1024_FAUCET_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}
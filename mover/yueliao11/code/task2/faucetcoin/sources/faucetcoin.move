/*
/// Module: faucetcoin
module faucetcoin::faucetcoin;
*/
module faucetcoin::bright_faucet_coin{
    use sui::coin::{Self,TreasuryCap};

    // Witness 是一种标记为 drop 的一次性使用资源。
    // 这意味着它在使用后会被自动销毁，从而确保相关资源只被使用一次，防止其被重复用于创建同一资源的多个实例。
    public struct BRIGHT_FAUCET_COIN has drop {}

    fun init (witness:BRIGHT_FAUCET_COIN,ctx:&mut TxContext){
        let (treasury, metadata) = coin::create_currency(witness, 6, b"BrightFaucet", b"bright faucet coin", b"faucet_token", option::none(), ctx );
        // 冻结 metadata 对象，阻止后续的修改
        transfer::public_freeze_object(metadata);
        // 共享铸币权
        transfer::public_share_object(treasury);


    }

    public fun mint_faucet_module(treasury_cap: &mut TreasuryCap<BRIGHT_FAUCET_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
            let coin = coin::mint(treasury_cap, amount, ctx);
            transfer::public_transfer(coin, recipient);
    }

}
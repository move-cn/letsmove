module generate_coin::faucet_coin{
    use sui::coin::{Self, TreasuryCap};
    use sui::tx_context::TxContext;

    public struct FAUCET_COIN has drop{}

    public struct TreasuryCaoHolder has key, store{
        id: UID,
        treasury_cap: TreasuryCap<FAUCET_COIN>,
    }

    // otw = One-time witness,确保只能在init初始化调用一次，同时1结构体只有drop能力
    fun init(otw:FAUCET_COIN, ctx: &mut TxContext){
        let (treasury_cap, metadata) = coin::create_currency(
            otw,
            6,
            b"looikaizhi_Faucet",
            b"LKZF",
            b"Who can let me become a memecoin!!(This is faucet)",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);

        let treasury_cap_holder = TreasuryCaoHolder{
            id: object::new(ctx),
            treasury_cap,
        };
        transfer::share_object(treasury_cap_holder);

    }

    public entry fun mint(treasury: &mut TreasuryCaoHolder, ctx: &mut TxContext){
        let sender = tx_context::sender(ctx);
        let treasury_cap = &mut treasury.treasury_cap;
        let coin = coin::mint(treasury_cap, 10, ctx); // mint代币
        transfer::public_transfer(coin, sender); // 转移至指定地址
    }
}
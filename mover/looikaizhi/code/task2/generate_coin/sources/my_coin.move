module generate_coin::my_coin {
    use sui::coin::{Self, TreasuryCap};
    use sui::tx_context::TxContext;

    public struct MY_COIN has drop{}

    public struct TreasuryCaoHolder has key, store{
        id: UID,
        treasury_cap: TreasuryCap<MY_COIN>,
    }

    const Minter:address = @0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2;
    const MAX_SUPPLY: u64 = 1_000_000_000;


    fun init(otw: MY_COIN, ctx: &mut TxContext){
        let (treasury_cap, metadata) = coin::create_currency(
            otw,
            6,
            b"looikaizhi",
            b"LKZ",
            b"Who can let me become a memecoin!!",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata); // 冻结 metadata，以确保其内容不可更改

        let treasury_cap_holder = TreasuryCaoHolder{
            id: object::new(ctx),
            treasury_cap,
        };
        transfer::public_transfer(treasury_cap_holder, tx_context::sender(ctx)); //将 TreasuryCap 赋予Minter地址

    }

    public entry fun mint(treasury: &mut TreasuryCaoHolder, minter: address, amount: u64, ctx: &mut TxContext){
        assert!(minter == Minter, 0); // 确保是指定地址

        let treasury_cap = &mut treasury.treasury_cap;
        let current_supply:u64 = coin::total_supply<MY_COIN>(treasury_cap); // 当前代币的总量
        assert!((current_supply + amount) <= MAX_SUPPLY, 0); // 确保不会超出最大供应量

        let coin = coin::mint(treasury_cap, amount, ctx); // mint代币
        transfer::public_transfer(coin, minter); // 转移至指定地址
    }

}


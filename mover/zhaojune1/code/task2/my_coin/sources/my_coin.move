module my_coin::my_coin {
    use sui::coin::{Self, TreasuryCap};

    //OTW
    public struct MY_COIN has drop {}

    //初始化
    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness,
            9,
            b"my_coin",
            b"my_coin",
            b"zhaojune1's coin",
            option::none(),
            ctx);

        //冻结
        transfer::public_freeze_object(metadata);
        //将管理权限转给sender
        transfer::public_transfer(treasury, ctx.sender());
    }

    //铸币并转账
    public fun mint_and_tansfer(
        treasury_cap: &mut TreasuryCap<MY_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }

}
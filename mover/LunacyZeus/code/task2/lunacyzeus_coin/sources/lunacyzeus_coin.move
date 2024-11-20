//MODULE: lunacyzeus_coin

module lunacyzeus_coin::lunacyzeus_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct LUNACYZEUS_COIN has drop {} //定义一个OTW(一次性见证对象)

    fun init(
        witness: LUNACYZEUS_COIN,
        ctx: &mut TxContext
    ) {
        //coin::create_currency 创建新的代币
        let (treasury_cap, metadata) = coin::create_currency<LUNACYZEUS_COIN>(
            witness,//见证者对象
            9,//小数位数
            b"LUNACYZEUS",//代币符号
            b"LUNACYZEUS_COIN",//代币名称
            b"This is LunacyZeus Coin in move testnet",//代币描述
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"https://avatars.githubusercontent.com/u/20926865" //代币icon
                )
            ),
            ctx //事务上下文
        );
        transfer::public_freeze_object(metadata);//冻结元数据对象 保持代币数据后续不被更改
        transfer::public_transfer(
            treasury_cap,
            tx_context::sender(ctx) //管理代币者
        )
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<LUNACYZEUS_COIN>,
        coin: Coin<LUNACYZEUS_COIN>
    ) {
        coin::burn(treasury_cap, coin);//销毁代币 销毁整个代币

    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<LUNACYZEUS_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);//铸造代币 需要有treasury_cap权限的用户才能调用
    }

    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_init(ctx: &mut TxContext) {
        init(LUNACYZEUS_COIN {}, ctx)
    }
}
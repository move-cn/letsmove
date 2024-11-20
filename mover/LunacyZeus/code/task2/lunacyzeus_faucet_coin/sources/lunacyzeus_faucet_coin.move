// Module: lunacyzeus_coin_faucet_coin

module 0x0::lunacyzeus_faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct LUNACYZEUS_FAUCET_COIN has drop {} //定义一个OTW(一次性见证对象)

    fun init(
        witness: LUNACYZEUS_FAUCET_COIN,
        ctx: &mut TxContext
    ) {
        //coin::create_currency 创建新的代币
        let (treasury_cap, metadata) = coin::create_currency<LUNACYZEUS_FAUCET_COIN>(
            witness,//见证者对象
            9,//小数位数
            b"LUNA",//代币符号
            b"LUNACYZEUS_FAUCET_COIN",//代币名称
            b"LunacyZeus Faucet Coin",//代币描述
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"https://avatars.githubusercontent.com/u/20926865" //代币icon
                )
            ),
            ctx
        );
        transfer::public_freeze_object(metadata);//冻结元数据对象 保持代币数据后续不被更改
        // 设置铸币权为公共对象
        transfer::public_share_object(treasury_cap)
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<LUNACYZEUS_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<LUNACYZEUS_FAUCET_COIN>,
        coin: Coin<LUNACYZEUS_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);

    }
}





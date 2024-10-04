
/// Module: share_coin
module share_coin::share_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct SHARE_COIN has drop{}

    fun init (witness:SHARE_COIN,ctx: &mut TxContext) {
        let (treasury,metadata) = coin::create_currency(
            witness,
            6,
            b"share coin",
            b"share coin",
            b"this is share_coin",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
        
    }
    public fun mint(treasury_cap:&mut coin::TreasuryCap<SHARE_COIN>,account: u64,recipient: address,ctx:&mut TxContext) {
        coin::mint_and_transfer(treasury_cap,account,recipient,ctx);
    }
}
// packgae id:0xaf670ea2220ea05286d87724392a8b848f9cf6e42bf61a28f957ecffda8f253e
// obj id: 0x1fa9bb36f55095aa636474d63b1c8d5754161e31d18ce22a7848d43f0003c961
// recepter address:0x91a1a0edc885aa529759a655dafa2f95c28b3119813e84e37aaa3c1f289b9197

// sui client call --package 刚刚记录的包id --module share_coin  --function mint --args  刚刚记录的Obj id  铸造数量 接收者的地址
// sui client call --package 0xaf670ea2220ea05286d87724392a8b848f9cf6e42bf61a28f957ecffda8f253e --module share_coin  --function mint --args 0x1fa9bb36f55095aa636474d63b1c8d5754161e31d18ce22a7848d43f0003c961 10 0x91a1a0edc885aa529759a655dafa2f95c28b3119813e84e37aaa3c1f289b9197
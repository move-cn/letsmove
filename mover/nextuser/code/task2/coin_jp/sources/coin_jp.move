module coin_jp::jp{
    public struct JP has drop{ }
    const JpUrl:vector<u8> = b"https://tse4-mm.cn.bing.net/th/id/OIP-C.XVkbV--98d7_YfeLR2a_fAHaHa";

    fun init( jp :JP , ctx : &mut TxContext)
    {
        let (treasuryCap,coinMetadata) = sui::coin::create_currency(
                jp, 
                0, 
                b"YEN",
                b"YEN of Japan", 
                b"Japanese money",
                option::some(sui::url::new_unsafe_from_bytes(JpUrl)),
                ctx);

        transfer::public_transfer(treasuryCap,ctx.sender());
        transfer::public_freeze_object(coinMetadata);
    }
    use sui::coin::TreasuryCap;
    public fun get_supply<T>(cap : &TreasuryCap<T>):u64{
        let s =sui::coin::supply_immut(cap);
        sui::balance::supply_value(s)
    }
}
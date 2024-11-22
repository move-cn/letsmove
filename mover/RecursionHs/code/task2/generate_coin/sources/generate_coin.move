module generate_coin::my_coin {
    use sui::transfer;
    use sui::object::{Self,UID};

    public struct MyCoin has key {
        id: UID,
        slentg: u8,
        text: std::string::String
    }


    fun init(ctx: &mut TxContext) {
        let coin = MyCoin {
            id: object::new(ctx),
            slentg: 12,
            text: std::string::utf8(b"BTC for sui coin")
        };
        transfer::transfer(coin,ctx.sender())
    }
}
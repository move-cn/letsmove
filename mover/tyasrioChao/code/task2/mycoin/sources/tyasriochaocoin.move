module mycoin::tyasriochaocoin {
    use sui::coin;
    use sui::url;

    // Define the currency
    public struct TYASRIOCHAOCOIN has drop {}

    fun init(mycoin: TYASRIOCHAOCOIN, ctx: &mut TxContext) {

        let url = url::new_unsafe_from_bytes(b"https://raw.githubusercontent.com/tyasrioChao/assets/refs/heads/main/cat.svg");
        let icon = option::some<url::Url>(url);

        let (treasury, metadata) = coin::create_currency(
            mycoin,
            8,                // decimals
            b"TYASRIOCHAOCOIN",           // symbol
            b"TYASRIOCHAOCOIN",       // name
            b"It's the first coin publish by tyasrioChao", // description
            icon,   // icon url
            ctx
        );

        transfer::public_transfer(treasury, ctx.sender());

        transfer::public_freeze_object(metadata);
    }
}

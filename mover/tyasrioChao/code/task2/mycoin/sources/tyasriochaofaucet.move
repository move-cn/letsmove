module mycoin::tyasriochaofaucet {
    use sui::{
        coin,
        url,
        transfer::{
            public_share_object,
            public_freeze_object
        }
    };

    public struct TYASRIOCHAOFAUCET has drop {}

    fun init(myfaucet: TYASRIOCHAOFAUCET, ctx: &mut TxContext) {

            let url = url::new_unsafe_from_bytes(b"https://raw.githubusercontent.com/tyasrioChao/assets/refs/heads/main/cat.svg");
            let icon = option::some<url::Url>(url);

        let (treasury, metadata) = coin::create_currency(
            myfaucet,
            8,                // decimals
            b"TYASRIOCHAOFAUCET",           // symbol
            b"TYASRIOCHAOFAUCET",       // name
            b"It's a faucet publish by tyasrioChao", // description
            icon,   // icon url
            ctx
        );

        public_share_object(treasury);

        public_freeze_object(metadata);
    }
}

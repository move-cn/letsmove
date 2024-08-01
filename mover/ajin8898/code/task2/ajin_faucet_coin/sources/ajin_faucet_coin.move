module ajin_faucet_coin::ajin_faucet_coin {

    use sui::coin::create_currency;
    use sui::transfer::{public_freeze_object, public_share_object};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Url, Self};

    public struct AJIN_FAUCET_COIN has drop {}

    fun init(witness: AJIN_FAUCET_COIN, ctx: &mut TxContext) {
        let icon_url = option::none();
        let (treasury_cap, coin_metadata) = create_currency(
            witness,
            8,
            b"Ajin Faucet",
            b"Ajin Faucet",
            b"Ajin faucet coin",
            icon_url,
            ctx
        );

        // 所有权共享出去，不可变
        public_freeze_object(coin_metadata);
        // 所有权共享出去
        public_share_object(treasury_cap);
    }

    // 铸造代币
    public entry fun mint(treasury_cap: &mut TreasuryCap<AJIN_FAUCET_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    // 销毁代币
    public entry fun burn(treasury_cap: &mut TreasuryCap<AJIN_FAUCET_COIN>, coin: Coin<AJIN_FAUCET_COIN>) {
        coin::burn(treasury_cap, coin);
    }

}
module js_faucet_coin::js_faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::event;
    use sui::coin::{supply_immut};
    use sui::balance;

    const IconUrl: vector<u8> = b"https://avatars.githubusercontent.com/u/964008?v=4&size=64";
    const Symbol: vector<u8> = b"JSFC";

    public struct AirdropEvent has copy, drop {
        symbol: vector<u8>,
        airdrop_amount: u64,
        recipient: address,
        total_supply: u64,
    }

    public struct BurnEvent has copy, drop {
        symbol: vector<u8>,
        burn_amount: u64,
        total_supply: u64,
    }

    public struct JS_FAUCET_COIN has drop {}

    fun init(witness: JS_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) =
            coin::create_currency<JS_FAUCET_COIN>(
                witness,
                2,
                Symbol,
                b"JS Faucet Coin",
                b"faucet coin for JS",
                option::some(sui::url::new_unsafe_from_bytes(IconUrl)),
            ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }

    public fun airdrop(
        treasury_cap: &mut TreasuryCap<JS_FAUCET_COIN>, amount: u64, ctx: &mut TxContext
    ) {
        let recipient = ctx.sender();

        event::emit(AirdropEvent {
            symbol: Symbol,
            airdrop_amount: amount,
            recipient,
            total_supply: get_total_supply(treasury_cap),
        });

        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    public fun burn(treasury_cap: &mut TreasuryCap<JS_FAUCET_COIN>, coin: Coin<JS_FAUCET_COIN>) {
        event::emit(BurnEvent {
            symbol: Symbol,
            burn_amount: coin.value(),
            total_supply: get_total_supply(treasury_cap),
        });

        coin::burn(treasury_cap, coin);
    }

    fun get_total_supply(treasury_cap: &TreasuryCap<JS_FAUCET_COIN>):  u64 {
        balance::supply_value(treasury_cap.supply_immut())
    }
}
module js_coin::js_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::event;
    use sui::coin::{supply_immut};
    use sui::balance;

    const IconUrl: vector<u8> = b"https://avatars.githubusercontent.com/u/964008?v=4&size=64";
    const Symbol: vector<u8> = b"JSC";

    public struct MintEvent has copy, drop {
        symbol: vector<u8>,
        mint_amount: u64,
        total_supply: u64,
    }

    public struct BurnEvent has copy, drop {
        symbol: vector<u8>,
        burn_amount: u64,
        total_supply: u64,
    }

    public struct JS_COIN has drop {}

    fun init(witness: JS_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) =
            coin::create_currency<JS_COIN>(
                witness,
                2,
                Symbol,
                b"JS Coin",
                b"coin for JS",
                option::some(sui::url::new_unsafe_from_bytes(IconUrl)),
            ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, ctx.sender())
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<JS_COIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        event::emit(MintEvent {
            symbol: Symbol,
            mint_amount: amount,
            total_supply: get_total_supply(treasury_cap),
        });

        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    public fun burn(treasury_cap: &mut TreasuryCap<JS_COIN>, coin: Coin<JS_COIN>) {
        event::emit(BurnEvent {
            symbol: Symbol,
            burn_amount: coin.value(),
            total_supply: get_total_supply(treasury_cap),
        });

        coin::burn(treasury_cap, coin);
    }

    fun get_total_supply(treasury_cap: &TreasuryCap<JS_COIN>):  u64 {
        balance::supply_value(treasury_cap.supply_immut())
    }
}

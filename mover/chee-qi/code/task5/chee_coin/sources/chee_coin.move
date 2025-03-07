/*
/// Module: chee_coin
module chee_coin::chee_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module chee_coin::chee_coin{

    // === Imports === 
    use sui::coin::create_currency;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self};
    use std::option::{some};
    use sui::transfer::{public_share_object,public_freeze_object};

    // === Errors ===

    // === Constants ===

    // === Structs ===

    public struct CHEE_COIN has drop{}

    // === Events ===

    // === Method Aliases ===

    // === Public Functions ===

    fun init(witness: CHEE_COIN, ctx: &mut TxContext){
        let decimals = 6;
        let symbol = b"CHEE_COIN";
        let name = b"CHEE_COIN";
        let description = b"chee coin";
        let icon_url = some(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/chee-qi"));

        let (treasury, metadata) = create_currency<CHEE_COIN>(
            witness,
            decimals,
            symbol,
            name,
            description,
            icon_url,
            ctx
        );
        public_freeze_object(metadata);
        public_share_object(treasury);
    }

    // === View Functions ===
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<CHEE_COIN>,
        amount:u64,
        recipient:address,
        ctx:&mut TxContext
    ){
        let coin = coin::mint(treasury_cap,amount,ctx);
        transfer::public_transfer(coin,recipient);
    }
    public entry fun burn(treasury_cap: &mut TreasuryCap<CHEE_COIN>,coin:Coin<CHEE_COIN>){
        coin::burn(treasury_cap,coin);
    }

    // === Admin Functions ===

    // === Package Functions ===

    // === Private Functions ===

    // === Test Functions ===
}

// tx 648ktXQnZiFVXzwoDbVrC51iH2TZfEgwNscY3H7SAjMj

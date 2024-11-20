module collaralloc_faucet_coin::collaralloc_faucet_coin{
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};
    
    public struct COLLARALLOC_FAUCET_COIN has drop {}

    public struct TreasuryCapKeeper has key {
        id: UID,
        treasury_cap: TreasuryCap<COLLARALLOC_FAUCET_COIN>,
    }

    fun init(me : COLLARALLOC_FAUCET_COIN, ctx: &mut TxContext){
        let (treasury_cap, metadata) = coin::create_currency<COLLARALLOC_FAUCET_COIN>(
            me,
            9,
            b"COLLARALLOC_FAUCET_COIN",
            b"collaralloc faucet coin",
            b"collaralloc faucet coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/49566393")),
            ctx
        );

        transfer::public_freeze_object(metadata);
        
        
        let treasury_cap_keeper = TreasuryCapKeeper{
            id: object::new(ctx),
            treasury_cap,
        };
        transfer::share_object(treasury_cap_keeper);
    }
     public entry fun mint(
        treasury_cap_keeper: &mut TreasuryCapKeeper,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let treasury_cap = &mut treasury_cap_keeper.treasury_cap;
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<COLLARALLOC_FAUCET_COIN>, 
        coin: Coin<COLLARALLOC_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }

}

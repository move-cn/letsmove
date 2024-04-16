#[allow(lint(share_owned))]
module lidashu_faucet_coin::lidashu_faucet_coin {
    use sui::coin;
    use sui::balance::{Self, Balance};
    
    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct LIDASHU_FAUCET_COIN has drop {}

    public struct Faucet has key {
        id: UID,
        amount: u64,
        balance: Balance<LIDASHU_FAUCET_COIN>
    }

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: LIDASHU_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"LDSF",           // symbol
            b"LIDASHU faucet coin",       // name
            b"LDSF mint for all", // description
            option::none(),   // icon url
            ctx
        );

        // transfer the `TreasuryCap` to the sender, so they can mint and burn
        transfer::public_transfer(treasury, tx_context::sender(ctx));

        // metadata is typically frozen after creation
        transfer::public_freeze_object(metadata);

        // Share the object to make it accessible to everyone!
        transfer::share_object(Faucet {
            id: object::new(ctx),
            amount: 10000000,
            balance: balance::zero()
        })
    }

    /// Manager can mint new coins
    public fun mint(
        treasury_cap: &mut coin::TreasuryCap<LIDASHU_FAUCET_COIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    /// Manager can burn coins
    public fun burn(treasury_cap: &mut coin::TreasuryCap<LIDASHU_FAUCET_COIN>, target: coin::Coin<LIDASHU_FAUCET_COIN>) {
        coin::burn(treasury_cap, target);
    }

    /// Manager can mint new coins
    public fun faucet_create(
        treasury_cap: &mut coin::TreasuryCap<LIDASHU_FAUCET_COIN>, faucet: &mut Faucet, ctx: &mut TxContext
    ) {
        let mut faucet_coin: coin::Coin<LIDASHU_FAUCET_COIN> = coin::mint(treasury_cap, 1000000000, ctx);
        
        let faucet_balance = coin::balance_mut(&mut faucet_coin);
        let new_balance = balance::split(faucet_balance, 1000000000);
        balance::join(&mut faucet.balance, new_balance);
        transfer::public_transfer(faucet_coin, tx_context::sender(ctx));
    }

    public entry fun faucet_mint(
        faucet: &mut Faucet, ctx: &mut TxContext
    ) {

        let new_coin = coin::take(&mut faucet.balance, faucet.amount, ctx);
        transfer::public_transfer(new_coin, tx_context::sender(ctx));
    }


}

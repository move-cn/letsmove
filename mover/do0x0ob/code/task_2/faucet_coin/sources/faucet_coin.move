module faucet_coin::faucet_coin {
    use sui::coin::{Self, TreasuryCap};
    use sui::url::{new_unsafe};

    public struct FAUCET_COIN has drop {}
    
    #[allow(lint(share_owned))]
    fun init(witness: FAUCET_COIN, ctx: &mut sui::tx_context::TxContext) {
        let url_obj = new_unsafe(std::ascii::string(b"https://avatars.githubusercontent.com/u/153002627?v=4"));
        let (treasury_cap, meta) = coin::create_currency (
            witness,
            8,
            b"OXO_Faucet",
            b"OXO",
            b"FaucetCoin on task2",
            option::some(url_obj),
            ctx
        );
        transfer::public_freeze_object(meta);
        transfer::public_share_object(treasury_cap);
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}



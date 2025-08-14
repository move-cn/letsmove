
/// Module: my_coin
module my_coin::my_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    
    public struct MY_COIN has drop{}

    fun init (witness:MY_COIN,ctx: &mut TxContext) {
        let (treasury,metadata) = coin::create_currency(
            witness,
            6,
            b"my_coin",
            b"My Coin",
            b"this is my coin",
            option::none(),
            ctx
        );
        transfer::public_transfer(treasury,tx_context::sender(ctx));
        transfer::public_freeze_object(metadata);

    }
    public fun mint(treasury_cap:&mut coin::TreasuryCap<MY_COIN>,amount: u64,recipient: address,ctx:&mut TxContext) {
        coin::mint_and_transfer(treasury_cap,amount,recipient,ctx);
    }
}

// sui client call --package 0x1a85ad3480a87e3b8f5c5cecb3d3d2c6917c484d2ee8ba61c246c8f14810143d --module my_coin  --function mint --args 0x53492e0b4f9003bfca7d7abe64c42808717a37de8088ef0cb0f1e5149427c059 10 0xad348ef5fef1bf4071b1fb0b4dc9562bbcf0e2707262284d70a6f89798f053a9
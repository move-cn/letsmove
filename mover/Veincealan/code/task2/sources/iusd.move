module task2::iusd {
    use std::ascii::string;
    use sui::coin::{ Self, TreasuryCap, Coin};
    use sui::url;

    public struct IUSD has drop {}

    fun init(witness:IUSD, ctx: &mut TxContext) {
        let (treasury, metaData) = coin::create_currency(
            witness,
            8,
            b"IUSD",
            b"iusd",
            b"Sui stable coin -1:1- USD",
            option::some(url::new_unsafe(string(b"https://avatars.githubusercontent.com/u/181119030?s=200&v=4"))),
            ctx);
        transfer::public_freeze_object(metaData);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

     //Mint coin
    public entry fun Mint(
        treasury_cap: &mut TreasuryCap<IUSD>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }
    //burn coin
    public entry fun burn(treasury_cap: &mut coin::TreasuryCap<IUSD>, coin: Coin<IUSD>) {
        coin::burn(treasury_cap, coin);
    }
}

//mint command
/*sui client call 
--function Mint 
--module iusd 
--package 0xc3209494d8c52b2c44444fc34d47bbcc9156bc539eab602993f187bcad4dfe36 
--args 0x2a54d78c138bf3f6367bb9f0e3a7322f6d51d108c90ee22e23c57c121e0d30cf 10000000000 0xca7efb5abc1ff6d68b75e832a250aa266413d083e5a2b591f4c704703a5b9057
*/
//burn command
/*
sui client call 
--function burn 
--module iusd 
--package 0xc3209494d8c52b2c44444fc34d47bbcc9156bc539eab602993f187bcad4dfe36 
--args 0x651a0bfaf3e49364bce041a5620006afc466449a1168806fde7327a90bb4494d 0xf6862a5da591a861e28cf6edd587ea917e2d3b330d4ebdd60c8462288e0b7574 --gas-budget 10000000
*/

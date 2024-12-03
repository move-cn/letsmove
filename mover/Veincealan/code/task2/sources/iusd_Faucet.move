module task2::iusd_Faucet{
    use std::ascii::string;
    use sui::coin::{ Self, TreasuryCap, Coin};
    use sui::url;

    public struct IUSD_FAUCET has drop {}

    fun init(witness:IUSD_FAUCET, ctx: &mut TxContext) {
        let (treasury, metaData) = coin::create_currency(
            witness,
            8,
            b"IUSD_FAUCET",
            b"iusd_faucet",
            b"Sui faucet stable coin -1:1- USD",
            option::some(url::new_unsafe(string(b"https://avatars.githubusercontent.com/u/181119030?s=200&v=4"))),
            ctx);
        transfer::public_freeze_object(metaData);
        transfer::public_share_object(treasury);// 共享铸币权

    }

     //Mint coin
    public entry fun Mint(
        treasury_cap: &mut TreasuryCap<IUSD_FAUCET>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }
    //burn coin
    public entry fun burn(treasury_cap: &mut coin::TreasuryCap<IUSD_FAUCET>, coin: Coin<IUSD_FAUCET>) {
        coin::burn(treasury_cap, coin);
    }
}

//mint command
/*sui client call 
--function Mint 
--module iusd_Faucet 
--package 0xc3209494d8c52b2c44444fc34d47bbcc9156bc539eab602993f187bcad4dfe36 
--args 0x024a5f2d7fc1e987da203f02df75cdd63b6757b6ac78b910ac3b4311e034db82 888000000000 0xca7efb5abc1ff6d68b75e832a250aa266413d083e5a2b591f4c704703a5b9057
*/
//burn command
/*
sui client call 
--function burn 
--module iusd_Faucet 
--package 0xc3209494d8c52b2c44444fc34d47bbcc9156bc539eab602993f187bcad4dfe36 
--args 0x880cc01d228122fbb688ebe44fab6a2c9c72ca38ef30ac2c9147e3498ab3a055 0x19622c0fb88fc9ff6e4581ba40d77c7703d4178d87567fc2148f9f32cabbc52c
--gas-budget 10000000
*/
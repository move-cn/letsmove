/// Module: my_nft
module my_nft::my_nft {
    use sui::tx_context::{sender};
    use std::string::{utf8};
    use sui::package;
    use sui::display;

    public struct MyNFT has key, store {
        id: UID,
        tokenId: u64
    }

    public struct MY_NFT has drop {}

    public struct State has key {
        id: UID,
        count: u64
    }

    #[allow(unused_function)]
    fun init(witness: MY_NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
            utf8(b"description"),
        ];

        let values = vector[
            utf8(b"Sou1ReaPer's NFT"),
            utf8(b"https://avatars.githubusercontent.com/Sou1ReaPer"),
            utf8(b"NFT created by Sou1ReaPer, using Sou1ReaPer's Github Avatar."),
        ];

        let publisher = package::claim(witness, ctx);

        let mut display = display::new_with_fields<MyNFT>(
            &publisher, keys, values, ctx
        );
        
        display::update_version(&mut display);

        transfer::public_transfer(publisher, sender(ctx));
        transfer::public_transfer(display, sender(ctx));
        
        transfer::share_object(State{
            id: object::new(ctx),
            count: 0
        });
    }

    public entry fun mint(state: &mut State, recipient: address, ctx: &mut TxContext){
        state.count = state.count + 1;

        let nft = MyNFT { 
            id:object::new(ctx),
            tokenId:state.count
        };

        transfer::public_transfer(nft, recipient);
    }
}
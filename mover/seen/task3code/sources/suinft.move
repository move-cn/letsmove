/*
/// Module: suinft
module suinft::suinft {
https://avatars.githubusercontent.com/u/61534762?v=4
}
*/
module suinft::guinjgidanft{
    use std::string::{Self,utf8};
    use sui::url::{Self,Url};
    use sui::event;
    use sui::display;
    use sui::package;
    // use sui::transfer;
    // use sui::tx_context::{TxContext};

    const ERROROWNER:u64 = 0;

    
    public struct MYGUINJGIDANFT has key,store{
        id:UID,
        name:string::String,
        description: string::String,
        url: string::String,
        owner:address,
    }

    public struct GUINJGIDANFT has drop{}

    public struct MintNFT has drop,copy {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    fun init(otw: GUINJGIDANFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
            utf8(b"description"),
            utf8(b"creator"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"https://avatars.githubusercontent.com/u/61534762?v=4"),
            utf8(b"I am seen,My github avator!"),
            utf8(b"guinjgida")
        ];

        
        let publisher = package::claim(otw, ctx);

        let mut display = display::new_with_fields<MYGUINJGIDANFT>(
            &publisher, keys, values, ctx
        );

        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    public entry fun mint(
        name:vector<u8>,
        description:vector<u8>,
        image_url: string::String,
        ctx: &mut TxContext
    ){
        let sender = tx_context::sender(ctx);
        let nft = MYGUINJGIDANFT{
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url:image_url,
            owner:sender
        };
        event::emit(MintNFT{
            object_id:object::id(&nft),
            creator:sender,
            name:nft.name,
        });
        transfer::public_transfer(nft,sender);
    }

    public entry fun transfernft(nft:MYGUINJGIDANFT,recipient:address,ctx:&mut TxContext){
        assert!(nft.owner == tx_context::sender(ctx),ERROROWNER);
        transfer::public_transfer(nft, recipient);
    }

}

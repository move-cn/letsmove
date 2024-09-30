module paul0903_nft::paul0903_nft{
    use std::string::{Self, String};
    use sui::tx_context::{TxContext, sender};
    use sui::object::{Self, UID};
    use sui::transfer;
    use std::vector;
    use sui::package;
    use sui::display;


    public struct PAUL0903_NFT has drop{}

    public struct PaulNFT has key, store{
        id : UID,
        name: String,
        link: String,
        image_url: String,
        description: String,
        project_url: String,
        creator: String,
    }

    
    fun init (otw: PAUL0903_NFT, ctx: &mut TxContext){
        let keys = vector[
            string::utf8(b"name"),
            string::utf8(b"link"),
            string::utf8(b"image_url"),
            string::utf8(b"description"),
            string::utf8(b"project_url"),
            string::utf8(b"creator"),
        ];

        let values = vector[
            string::utf8(b"{name}"),
            string::utf8(b"{link}"),
            string::utf8(b"{image_url}"),
            string::utf8(b"{description}"),
            string::utf8(b"{project_url}"),
            string::utf8(b"{creator}"),
        ];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<PaulNFT>(
            &publisher, 
            keys, 
            values,
            ctx);

        display::update_version(&mut display);

        transfer::public_transfer(display, tx_context::sender(ctx));
        transfer::public_transfer(publisher, tx_context::sender(ctx));
    }

    public entry fun mint <T> (
        name: String,
        link: String,
        image_url: String,
        description: String,
        project_url: String,
        creator: String,
        ctx: &mut TxContext
    ){
        let nft = PaulNFT{
            id: object::new(ctx),
            name,
            link,
            image_url,
            description,
            project_url,
            creator,
        };

        transfer::public_transfer(nft, sender(ctx));
    }

    public entry fun burn (
        nft: PaulNFT
    ){
        let PaulNFT{
            id,
            name: _,
            link: _,
            image_url: _,
            description: _,
            project_url: _,
            creator: _,
        } = nft;
        object::delete(id);
    }

}

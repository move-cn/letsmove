/*
/// Module: task3_nft
module task3_nft::task3_nft;
*/
module task3_nft::mynft{
    use std::string;
    use std::string::String;
    use sui::display::new_with_fields;
    use sui::package::claim;
    use sui::transfer::transfer;
    use sui::tx_context::sender;

    public struct QwrdxerNFT has key, store {
        id: UID,
        name: String,
        image_url: String,
    }

    /// One-Time-Witness for the module.
    public struct MYNFT has drop {}
    fun init(otw:MYNFT,ctx:&mut TxContext){
        let keys = vector[
            b"name".to_string(),
            b"link".to_string(),
            b"image_url".to_string(),
            b"description".to_string(),
            b"project_url".to_string(),
            b"creator".to_string(),
        ];

        let values = vector[
            // For `name` one can use the `Hero.name` property
            b"{name}".to_string(),
            // For `link` one can build a URL using an `id` property
            b"https://sui-heroes.io/hero/{id}".to_string(),
            // For `image_url` use an IPFS template + `image_url` property.
            b"{image_url}".to_string(),
            // Description is static for all `Hero` objects.
            b"A true Hero of the Sui ecosystem!".to_string(),
            // Project URL is usually static
            b"https://sui-heroes.io".to_string(),
            // Creator field can be any
            b"Unknown Sui Fan".to_string(),
        ];

        // Claim the `Publisher` for the package!
        let publisher = claim(otw, ctx);
        // Get a new `Display` object for the `Hero` type.
        let mut display = new_with_fields<QwrdxerNFT>(
            &publisher, keys, values, ctx
        );

        // Commit first version of `Display` to apply changes.
        display.update_version();
        transfer::public_transfer(publisher, ctx.sender());
        transfer::public_transfer(display, ctx.sender());
        let nft=QwrdxerNFT{
            id:object::new(ctx),
            name:string::utf8(b"qwrdxer give you a nft"),
            image_url:string::utf8(b"https://avatars.githubusercontent.com/u/46155167?s=400&u=a0f8c62e5478bbf48e50dfeac6dc99240a384f3e&v=4")
        };
        transfer::public_transfer(nft,sender(ctx));
    }
    public entry fun mint(name:String,image_url:String,target:address,ctx:&mut TxContext){
        let id=object::new(ctx);
        let nft=QwrdxerNFT{id,name,image_url};

        transfer::public_transfer(nft,target);
    }
}
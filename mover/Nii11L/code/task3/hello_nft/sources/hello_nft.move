module hello_nft::my_nft{
    use std::ascii::String;
    use sui::url::{Self, Url};

    public struct MyNFT has key, store {
        id: UID,
        name: String,
        description: String,
        image_url: Url,
    }

    #[allow(lint(self_transfer))]
    public entry fun mint_to_sender(
        name: String,
        description: String,
        image_url: String,
        ctx: &mut TxContext,
    ) {
        let nft = MyNFT {
            id: object::new(ctx),
            name: name,
            description: description,
            image_url: url::new_unsafe(image_url),
        };

        transfer::transfer(nft, ctx.sender());
    }

    public entry fun mint_to_address(
        minter: address,
        name: String,
        description: String,
        image_url: String,
        ctx: &mut TxContext,
    ) {
        let nft = MyNFT {
            id: object::new(ctx),
            name: name,
            description: description,
            image_url: url::new_unsafe(image_url),
        };

        transfer::transfer(nft, minter);
    }

    public fun name(nft: &MyNFT) : String {
        nft.name
    }

    public fun description(nft: &MyNFT) : String {
        nft.description
    }

    public fun image_url(nft: &MyNFT) : String {
        nft.image_url.inner_url()
    }

    public entry fun burn(nft: MyNFT, _: &mut TxContext) {
        let MyNFT { id, .. } = nft;
        id.delete();
    }
}

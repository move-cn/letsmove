
/// Module: task_nft
module task_nft::task_nft {
    use std::string::{String, utf8};
    use sui::url::{Self, Url};
    use sui::event;

    public struct TaskNft has key, store {
        id: UID,

        name: String,

        description: String,

        url: Url,
    }

    public struct NFTMinted has copy, drop {
        obj_id: ID,
        creator: address,
        name: String,
    }
    public fun name(nft: &TaskNft): &String {
        &nft.name
    }

    /// Get the NFT's `description`
    public fun description(nft: &TaskNft): &String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun url(nft: &TaskNft): &Url {
        &nft.url
    }
    #[allow(lint(self_transfer))]
    /// Create a new devnet_nft
    public fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        // let nft_name = b""
        
        let sender = ctx.sender();
        let nft = TaskNft {
            id: object::new(ctx),
            name: utf8(name),
            description: utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMinted {
            obj_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    /// Transfer `nft` to `recipient`
    public fun transfer(
        nft: TaskNft, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// Update the `description` of `nft` to `new_description`
    public fun update_description(
        nft: &mut TaskNft,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = utf8(new_description)
    }

    /// Permanently delete `nft`
    public fun burn(nft: TaskNft, _: &mut TxContext) {
        let TaskNft { id, name: _, description: _, url: _ } = nft;
        id.delete()
    }
}

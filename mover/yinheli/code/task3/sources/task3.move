#[allow(lint(self_transfer))]
module task3::task3 {
    use std::string;
    use sui::event;
    use sui::package;
    use sui::display;

    /// An example NFT that can be minted by anybody
    public struct NFT has key, store {
        id: UID,
        /// Name for the token
        name: string::String,
        /// Description of the token
        description: string::String,
    }

    // ===== Events =====

    public struct NFTMinted has copy, drop {
        // The Object ID of the NFT
        object_id: ID,
        // The creator of the NFT
        creator: address,
        // The name of the NFT
        name: string::String,
    }

    // ===== Public view functions =====

    public fun name(nft: &NFT): &string::String {
        &nft.name
    }

    public fun description(nft: &NFT): &string::String {
        &nft.description
    }

    public struct TASK3 has drop {}

    fun init(witness: TASK3, ctx: &mut TxContext) {
        let publisher = package::claim(witness, ctx);
        let mut d = display::new<NFT>(&publisher, ctx);
        d.add(string::utf8(b"name"), string::utf8(b"{name}"));
        d.add(string::utf8(b"description"), string::utf8(b"{description}"));
        d.add(string::utf8(b"image_url"), string::utf8(b"https://github.com/{name}.png"));
        d.update_version();

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(d, tx_context::sender(ctx));
    }

    // ===== Entrypoints =====

    /// Create a new NFT and mint it to the sender
    public fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    /// Transfer `nft` to `recipient`
    public fun transfer(
        nft: NFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// Update the `description` of `nft` to `new_description`
    public fun update_description(
        nft: &mut NFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    /// Permanently delete `nft`
    public fun burn(nft: NFT, _: &mut TxContext) {
        let NFT { id, .. } = nft;
        object::delete(id)
    }
}
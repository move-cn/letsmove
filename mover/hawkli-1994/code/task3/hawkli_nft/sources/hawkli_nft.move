/*
/// Module: hawkli_nft
module hawkli_nft::hawkli_nft;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module hawkli_nft::hawkli_nft {
    use sui::tx_context;
    use std::string;
    use sui::object;
    use sui::package;
    use sui::display;
    use sui::transfer;
    use sui::event;

    /// The type identifier of hawkli NFT collection
    public struct HAWKLI_NFT has drop {}

    /// The NFT object
    public struct HawkliNFT has key, store {
        id: object::UID,
        name: string::String,
        description: string::String,
        owner: address
    }

    /// One-time witness for the module
    public struct WITNESS has drop {}

    // ===== Events =====
    public struct NFTMinted has copy, drop {
        object_id: address,
        creator: address,
        name: string::String
    }

    /// Module initializer
    fun init(witness: HAWKLI_NFT, ctx: &mut tx_context::TxContext) {
        let publisher = package::claim(witness, ctx);

        // Create the Display object to specify how to render the NFT
        let mut display = display::new<HawkliNFT>(&publisher, ctx);

        // Set the display fields
        display::add(&mut display, string::utf8(b"name"), string::utf8(b"{name}"));
        display::add(&mut display, string::utf8(b"description"), string::utf8(b"{description}"));
        display::add(&mut display, string::utf8(b"image_url"), string::utf8(b"https://avatars.githubusercontent.com/u/11769524?v=4"));
        display::add(&mut display, string::utf8(b"creator"), string::utf8(b"Hawkli"));

        // Commit the display object
        display::update_version(&mut display);
        
        // Transfer the publisher and display objects
        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    /// Mint a new Hawkli NFT
    public fun mint(
        name: vector<u8>,
        description: vector<u8>,
        ctx: &mut tx_context::TxContext
    ): HawkliNFT {
        let sender = tx_context::sender(ctx);
        
        let nft = HawkliNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            owner: sender
        };

        // Emit the mint event
        event::emit(NFTMinted {
            object_id: object::uid_to_address(&nft.id),
            creator: sender,
            name: nft.name
        });

        nft
    }

    /// Public mint function that creates and transfers the NFT
    public entry fun mint_and_transfer(
        name: vector<u8>,
        description: vector<u8>,
        ctx: &mut tx_context::TxContext
    ) {
        let nft = mint(name, description, ctx);
        transfer::public_transfer(nft, tx_context::sender(ctx));
    }

    // ===== Getter functions =====
    public fun name(nft: &HawkliNFT): &string::String { &nft.name }
    public fun description(nft: &HawkliNFT): &string::String { &nft.description }
    public fun owner(nft: &HawkliNFT): address { nft.owner }
}
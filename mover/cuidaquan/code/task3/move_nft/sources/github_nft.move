module move_nft::github_nft {

    use sui::package;
    use std::string::{String, utf8};
    use sui::event;
    use sui::display;
    use sui::url::{Self, Url};

    public struct GITHUB_NFT has drop {}

    /// An example NFT that can be minted by anybody
    public struct GithubNFT has key, store {
        id: UID,
        /// Name for the token
        name: String,
        /// Description of the token
        description: String,
        /// URL for the token
        image_url: Url,
        /// The creator of the NFT
        creator: address,
        /// The recipient of the NFT
        recipient: address
    }

    // ===== Events =====

    public struct NFTMinted has copy, drop {
        // The Object ID of the NFT
        object_id: ID,
        // The creator of the NFT
        creator: address,
        // The name of the NFT
        name: String,
    }

    fun init(otw: GITHUB_NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"description"),
            utf8(b"image_url"),
            utf8(b"creator"),
        ];
        let values = vector[
            utf8(b"{name} #{id}"),
            utf8(b"A NFT for your Github avatar"),
            utf8(b"{image_url}"),
            utf8(b"{creator}"),
        ];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<GithubNFT>(&publisher, keys, values, ctx);

        display::update_version(&mut display);
        transfer::public_transfer(publisher, ctx.sender());
        transfer::public_transfer(display, ctx.sender());
    }

    /// Create a new devnet_nft
    public entry fun mint_and_transfer(
        name: vector<u8>,
        description: vector<u8>,
        image_url: vector<u8>,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        let nft = GithubNFT {
            id: object::new(ctx),
            name: utf8(name),
            description: utf8(description),
            image_url: url::new_unsafe_from_bytes(image_url),
            creator: ctx.sender(),
            recipient: recipient,
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: ctx.sender(),
            name: nft.name,
        });

        transfer::public_transfer(nft, recipient);
    }
}

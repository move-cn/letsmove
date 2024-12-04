module rickiey_nft::rk {
    use sui::url::{Self, Url};
    use std::string;
    use sui::event;
    use sui::display;
    use sui::package;

    public struct RK_NFT has key, store {
        id: UID,
        tk_id: u64,
        name: string::String,
        description: string::String,
        image_url: Url,
    }

    public struct RK has drop {}

    public struct TID has key {
        id: UID,
        NextTID: u64,
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

    fun init(otw: RK, ctx : &mut TxContext) {
        let sender = tx_context::sender(ctx);

        let keys = vector[
            string::utf8(b"tk_id"),
             string::utf8(b"name"),
             string::utf8(b"description"),
             string::utf8(b"image_url"),
        ];

        let values = vector[
             string::utf8(b"TokenId #{tk_id}"),
             string::utf8(b"{name}"),
             string::utf8(b"{description}"),
             string::utf8(b"{image_url}"),
        ];
        let publisher = package::claim(otw, ctx);
        let  mut displ = display::new_with_fields<RK_NFT>(&publisher, keys, values, ctx);

        display::update_version(&mut displ);
        transfer::public_transfer(publisher, sender);
        transfer::public_transfer(displ, sender);
        transfer::share_object(TID{
            id:object::new(ctx),
            NextTID: 0,
        })

    }

    public entry fun mint( tid: &mut TID, name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,ctx :&mut  TxContext) {
        let sender = tx_context::sender(ctx);
        tid.NextTID = tid.NextTID +1 ;

        let nft = RK_NFT {
            id: object::new(ctx),
            tk_id: tid.NextTID,
            name: string::utf8(name),
            description: string::utf8(description),
            image_url: url::new_unsafe_from_bytes(url),
        };
        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
         });

        transfer::public_transfer(nft, sender)
    }

    // ===== Public view functions =====

    /// Get the NFT's `name`
    public fun name(nft: &RK_NFT): &string::String {
        &nft.name
    }

    /// Get the NFT's `description`
    public fun description(nft: &RK_NFT): &string::String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun url(nft: &RK_NFT): &Url {
        &nft.image_url
    }

      /// Get the NFT's `url`
    public fun token_id(nft: &RK_NFT): &u64 {
        &nft.tk_id
    }

    /// Transfer `nft` to `recipient`
    public entry fun transfer(
        nft:  RK_NFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// Permanently delete `nft`
    public entry fun burn(nft: RK_NFT, _ctx: &TxContext) {

        let RK_NFT { id, tk_id:_, name: _, description: _, image_url: _ } = nft;
        object::delete(id)
    }
}
module mynft::dao {
    use nft_protocol::attributes::Attributes;
    use nft_protocol::collection;
    use sui::url::{Self, Url};
    use std::string::{Self, String};
    use nft_protocol::attributes;
    use nft_protocol::display_info;
    use nft_protocol::mint_cap::{Self, MintCap};
    use nft_protocol::mint_event;
    use ob_permissions::witness;
    use std::ascii::{String as AsciiString} ;

    public struct Witness has drop {}

    public struct DAO has drop {}

    public struct DaoNFT has key, store {
        id: UID,
        name: String,
        description: String,
        url: Url,
        attributes: Attributes,
    }

    fun init(otw: DAO, ctx: &mut TxContext) {
        let (mut collection, mint_cap) = collection::create_with_mint_cap<DAO, DaoNFT>(
            &otw, option::none(), ctx
        );

        let delegated_witness = witness::from_witness<DaoNFT, Witness>(Witness {});

        collection::add_domain(
            delegated_witness,
            &mut collection,
            display_info::new(
                string::utf8(b"dao"),
                string::utf8(b"a nft collection of dao on sui")
            ),
        );

        transfer::public_share_object(collection);
        transfer::public_share_object(mint_cap);
    }

    public fun mint_nft(
        mint_cap: &MintCap<DAO>,
        name: String,
        description: String,
        url: AsciiString,
        ctx: &mut TxContext,
    ) {
        let nft = DaoNFT {
            id: object::new(ctx),
            name,
            description,
            url: url::new_unsafe(url),
            attributes: attributes::from_vec(vector[], vector[])
        };

        mint_event::emit_mint(
            witness::from_witness<DaoNFT, Witness>(Witness {}),
            mint_cap::collection_id(mint_cap),
            &nft,
        );

        transfer::public_transfer(nft, tx_context::sender(ctx));
    }
}
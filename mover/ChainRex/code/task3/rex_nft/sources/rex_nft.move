module rex_nft::rex {
    use nft_protocol::attributes::{Self, Attributes};
    use nft_protocol::collection;
    use std::ascii::String;
    use std::string;
    use sui::url::{Self, Url};
    use nft_protocol::display_info;
    use nft_protocol::mint_cap::{Self, MintCap};
    use nft_protocol::mint_event;
    use ob_permissions::witness;
    use sui::vec_map;

    public struct REX has drop {}

    /// 可用于创建后授权其他操作。至关重要的是，这个结构体不能随意提供给任何合约，因为它充当了授权令牌。
    public struct Witness has drop {}

    public struct RexNFT has key, store {
        id: UID,
        name: String,
        description: String,
        url: Url,
        attributes: Attributes,
    }

    fun init(otw: REX, ctx: &mut TxContext) {
        let (mut collection, mint_cap) = collection::create_with_mint_cap<REX, RexNFT>(
            &otw, option::none(), ctx
        );
        let delegated_witness = witness::from_witness(Witness {});

        collection::add_domain(
            delegated_witness,
            &mut collection,
            display_info::new(
                string::utf8(b"Rex"),
                string::utf8(b"A NFT collection of Rex on Sui"),
            ),
        );
        transfer::public_share_object(collection);
        transfer::public_share_object(mint_cap);
    }

    public entry fun mint_nft(
        mint_cap: &MintCap<RexNFT>,
        name: String,
        description: String,
        url: String,
        ctx: &mut TxContext,
    ) {
        let nft = RexNFT {
            id: object::new(ctx),
            name,
            description,
            url: url::new_unsafe(url),
            attributes: attributes::from_vec(vector[], vector[])
        };

        mint_event::emit_mint(
            witness::from_witness(Witness {}),
            mint_cap::collection_id(mint_cap),
            &nft,
        );
        transfer::public_transfer(nft, tx_context::sender(ctx));
    }

    public entry fun add_new_attributes(
        rex_nft: &mut RexNFT,
        new_attribute_name: String,
        new_attribute_value: String
    ) {
        let mut add_new_attributes = vec_map::empty<String, String>();
        vec_map::insert(
            &mut add_new_attributes,
            new_attribute_name,
            new_attribute_value
        );
        attributes::add_new(&mut rex_nft.id, add_new_attributes);
    }

    public entry fun transfer_nft(rex_nft: RexNFT, to: address) {
        transfer::public_transfer(rex_nft, to);
    }
}

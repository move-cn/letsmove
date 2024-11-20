/*
/// Module: my_nft
module my_nft::my_nft;
*/
module my_nft::my_nft {
    use nft_protocol::attributes::{Self, Attributes};
    use nft_protocol::collection;
    use std::ascii::String;
    use std::string;
    use sui::url::{Self, Url};
    use nft_protocol::display_info;
    use nft_protocol::mint_cap::{Self, MintCap};
    use nft_protocol::mint_event;
    use ob_permissions::witness;

    public struct MY_NFT has drop {}

    /// 可用于创建后授权其他操作。至关重要的是，这个结构体不能随意提供给任何合约，因为它充当了授权令牌。
    public struct Witness has drop {}

    public struct NFT has key, store {
        id: UID,
        name: String,
        description: String,
        url: Url,
        attributes: Attributes,
    }

    fun init(otw: MY_NFT, ctx: &mut TxContext) {
        let (mut collection, mint_cap) = collection::create_with_mint_cap<MY_NFT, NFT>(
            &otw, option::none(), ctx
        );
        let delegated_witness = witness::from_witness(Witness {});

        collection::add_domain(
            delegated_witness,
            &mut collection,
            display_info::new(
                string::utf8(b"MY_NFT"),
                string::utf8(b"A NFT collection of MY_NFT on Sui"),
            ),
        );
        transfer::public_share_object(collection);
        transfer::public_share_object(mint_cap);
    }

    public entry fun mint_nft(
        mint_cap: &MintCap<NFT>,
        name: String,
        description: String,
        url: String,
        ctx: &mut TxContext,
    ) {
        let nft = NFT {
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

    public entry fun transfer_nft(nft: NFT, to: address) {
        transfer::public_transfer(nft, to);
    }
}

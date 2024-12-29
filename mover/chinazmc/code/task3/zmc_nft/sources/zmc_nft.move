/*
/// Module: zmc_nft
module zmc_nft::zmc_nft;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module zmc_nft::zmc_nft  {
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

    public struct ZMC_NFT has drop {}

    /// 可用于创建后授权其他操作。至关重要的是，这个结构体不能随意提供给任何合约，因为它充当了授权令牌。
    public struct Witness has drop {}

    public struct ZmcNFT has key, store {
        id: UID,
        name: String,
        description: String,
        url: Url,
        attributes: Attributes,
    }
    fun init(otw: ZMC_NFT,ctx: &mut TxContext) {
        let ( mut collection,mint_cap ) = collection::create_with_mint_cap<ZMC_NFT,ZmcNFT>(
            &otw,option::none(),ctx
        );
        let delegated_witness = witness::from_witness(Witness {});
        collection::add_domain(
            delegated_witness,
            &mut collection,
            display_info::new(
                string::utf8(b"zmc"),
                string::utf8(b"A NFT collection of zmc on Sui")
            ),
        );
        transfer::public_share_object(collection);
        transfer::public_share_object(mint_cap);
    }
    public entry fun mint_nft(
        mint_cap: &MintCap<ZmcNFT>,
        name: String,
        description: String,
        url: String,
        ctx: &mut TxContext
    ){
        let nft = ZmcNFT{
            id: object::new(ctx),
            name,
            description,
            url: url::new_unsafe(url),
            attributes: attributes::from_vec(vector[],vector[]),
        };
        mint_event::emit_mint(
            witness::from_witness(Witness {}),
            mint_cap::collection_id(mint_cap),
            &nft,
        );
        transfer::public_transfer(nft,tx_context::sender(ctx));
    }
    public entry fun transfer_nft(rex_nft: ZmcNFT, to: address) {
        transfer::public_transfer(rex_nft, to);
    }
    public entry fun add_new_attribute(
        zmc_nft: &mut ZmcNFT,
        new_attribute_name: String,
        new_attribute_value: String,
    ){
        let mut add_attributes = vec_map::empty<String,String>();
        vec_map::insert(
            &mut add_attributes,
        new_attribute_name,
        new_attribute_value,
        );
        attributes::add_new(
            &mut zmc_nft.id,
            add_attributes,
        );
    }
}
//tx block GVfLgiUVzNdvJHmXu2hZ7YNNm1m1arzszrtjC9MUWfvd
//package package id : 0x376f1deedcc6b9ee61094cccec535deb837eec74d01ec2760040614d395f5f15
//mintcap id 0x3d206203cfa5bdb59e06d8389fb4f712923a80d98c0fed27b4ee0ab3de9e3857

//铸造的第一个nft object id  0xabc3fb81ffdb1ee48f13089824e9ea06737b04b04b1b881bb743106e3a8efa08
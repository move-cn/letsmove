/// Module: move_nft
module move_nft::move_nft {
    use std::string::String;
    use sui::object::{Self, ID, UID};
    use sui::tx_context::{Self, TxContext};
    use sui::event;
    use sui::url::{Self, Url};
    use sui::display;
    use sui::package;
    use std::debug;

    public struct MOVE_NFT has drop {}

    public struct JiuCaiNFT has key , store {
        id: UID,
        name: String,
        traits: String,
        url: Url,
    }

    public struct JiuCaiMinted has copy, drop {
        /// ID of the JiuCai
        jiuCai_id: ID,
        /// The address of the NFT minter
        minted_by: address,
    }

    fun init(witness: MOVE_NFT, ctx: &mut TxContext){
        let _publisher = package::claim(witness, ctx);
        let mut _display = display::new<JiuCaiNFT>(&_publisher,ctx);
        _display.add(b"id".to_string(),b"{id}".to_string());
        _display.add(b"name".to_string(),b"{name}".to_string());
        _display.add(b"traits".to_string(),b"{traits}".to_string());
        _display.add(b"url".to_string(),b"{url}".to_string());
        _publisher.burn_publisher();
        debug::print(&_display);
        transfer::public_transfer(_display, tx_context::sender(ctx));
    }

    public entry fun mint (
        name: String,
        traits: String,
        _url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let id = object::new(ctx);
        let sender = tx_context::sender(ctx);

        event::emit(JiuCaiMinted {
            jiuCai_id: object::uid_to_inner(&id),
            minted_by: tx_context::sender(ctx),
        });

        let nft = JiuCaiNFT {
            id: id,
            name: name,
            traits: traits,
            url: url::new_unsafe_from_bytes(_url),
        };
        
        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer(
        nft: JiuCaiNFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    public fun name(nft: &JiuCaiNFT): &String {
        &nft.name
    }

    public fun traits(nft: &JiuCaiNFT): &String {
        &nft.traits
    }

    public fun url(nft: &JiuCaiNFT): &Url {
        &nft.url
    }

    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_init(ctx: &mut TxContext) {
        init(MOVE_NFT {}, ctx)
    }

}
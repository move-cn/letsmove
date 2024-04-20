module task3::jeasonnow_nft {
    use sui::tx_context::{sender};
    use sui::url;
    use std::string::{Self, utf8, String};
    use sui::event;
    use sui::display;
    use sui::package;

    public struct JEASONNOW_NFT has drop {}

    public struct JeasonnowNft has key, store {
        id: UID,
        creator: address,
        token_id: u64,
        name: string::String,
        description: string::String,
        image_url: url::Url,
    }

    public struct State has key, store {
        id: UID,
        count: u64,
    }

    public struct JeasonnowNftMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    public fun name(nft: &JeasonnowNft): &string::String {
        &nft.name
    }

    public fun description(nft: &JeasonnowNft): &string::String {
        &nft.description
    }

    public fun image_url(nft: &JeasonnowNft): &url::Url {
        &nft.image_url
    }

    fun init(otw: JEASONNOW_NFT, ctx: &mut TxContext) {
        let initial_state = State {
            id: object::new(ctx),
            count: 0
        };
        let keys = vector[
            utf8(b"name"),
            utf8(b"description"),
            utf8(b"image_url"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"{description}"),
            utf8(b"{image_url}"),
        ];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<JeasonnowNft>(
        &publisher, keys, values, ctx);

        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));

        transfer::share_object(initial_state);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(JEASONNOW_NFT {}, ctx);
    }

    public entry fun mint(name: String, description: String, url: vector<u8>, state: &mut State, ctx: &mut TxContext) {
        let sender = sender(ctx);
        state.count = state.count + 1;

        let nft = JeasonnowNft {
            id: object::new(ctx),
            creator: sender,
            token_id: state.count,
            name,
            description,
            image_url: url::new_unsafe_from_bytes(url)
        };

        event::emit(JeasonnowNftMinted {
            object_id: object::id(&nft),
            creator: sender(ctx),
            name: nft.name,
        });

        transfer::transfer(nft, sender);
    }

    public entry fun transfer(
        nft: JeasonnowNft, recipient: address, _: &mut TxContext
    ) {
        // transfer nft to recipient
        transfer::public_transfer(nft, recipient)
    }

    /// Update the `description` of `nft` to `new_description`
    public entry fun update_description(
        nft: &mut JeasonnowNft,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    /// Permanently delete `nft`
    public entry fun burn(nft: JeasonnowNft, _: &mut TxContext) {
        let JeasonnowNft { id, name: _, description: _, image_url: _, creator: _, token_id: _} = nft;
        object::delete(id)
    }
}
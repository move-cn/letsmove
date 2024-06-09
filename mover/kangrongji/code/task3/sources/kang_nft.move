module task3::kang_nft {

    use std::string;
    use sui::event;
    use sui::display;
    use sui::package;

    public struct KANG_NFT has drop {}

    public struct KangNFT has key, store {
        id: UID,
        name: string::String,
    }

    // Events

    public struct ENFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    public struct ENFTTransferred has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    // Getters

    public fun name(nft: &KangNFT): &string::String {
        &nft.name
    }

    // Setters

    public fun name_mut(nft: &mut KangNFT, name: vector<u8>) {
        nft.name = string::utf8(name);
    }

    // Initializer

    fun init(witness: KANG_NFT, ctx: &mut TxContext) {
        let keys = vector[
            string::utf8(b"name"),
            string::utf8(b"image_url")
        ];
        let values = vector[
            string::utf8(b"kangNFT"),
            string::utf8(b"https://avatars.githubusercontent.com/u/92361529?s=96&v=4")
        ];
        let publisher = package::claim(witness, ctx);
        let mut display = display::new_with_fields<KangNFT>(&publisher, keys, values, ctx);
        let deployer = tx_context::sender(ctx);
        display::update_version(&mut display);
        transfer::public_transfer(publisher, deployer);
        transfer::public_transfer(display, deployer);
    }

    // Entrypoints

    public entry fun mint(
        name: vector<u8>,
        ctx: &mut TxContext
    ) {
        let nft = KangNFT {
            id: object::new(ctx),
            name: string::utf8(name),
        };
        let sender = tx_context::sender(ctx);
        event::emit(ENFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });
        transfer::public_transfer(nft, sender);
    }

    public fun transfer(
        nft: KangNFT,
        recipient: address,
        _: &mut TxContext
    ) {
        event::emit(ENFTTransferred {
            object_id: object::id(&nft),
            from: tx_context::sender(_),
            to: recipient,
        });
        transfer::public_transfer(nft, recipient)
    }

}

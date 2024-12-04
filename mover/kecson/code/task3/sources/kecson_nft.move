/// Module: task3
module task3::Kecson_NFT {

    use std::string;
    use std::string::{String, utf8};
    use std::vector;

    use sui::display;
    use sui::event;
    use sui::object;
    use sui::object::{ID, UID};
    use sui::package;
    use sui::transfer;
    use sui::transfer::public_transfer;
    use sui::tx_context::{sender, TxContext};
    use sui::url;
    use sui::url::Url;

    struct KecsonNft has key, store {
        id: UID,
        name: String,
        description: String,
        image_url: Url,
        creator: address,
    }

    struct KECSON_NFT has drop {}

    struct NFTMintedEvent has copy, drop {
        // The Object ID of the NFT
        object_id: ID,
        // The creator of the NFT
        creator: address,
        // The name of the NFT
        name: String,
    }

    struct NFTBurnedEvent has copy, drop {
        // The Object ID of the NFT
        object_id: ID,
        // The owner of the NFT
        owner: address,
        // The name of the NFT
        name: String,
    }

    const MAX_SUPPLY: u64 = 1_000_000_000;

    struct KecsonNftCap has key, store {
        id: UID,
        current_supply: u64,
        total_supply: u64
    }

    fun init(otw: KECSON_NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
            utf8(b"description"),
            utf8(b"creator"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"{image_url}"),
            utf8(b"letsmove task3 Kecson NFT"),
            utf8(b"{creator}"),
        ];
        // Claim the `Publisher` for the package!
        let publisher = package::claim(otw, ctx);

        // Get a new `Display` object for the `Hero` type.
        let display = display::new_with_fields<KecsonNft>(
            &publisher, keys, values, ctx
        );

        display::update_version(&mut display);
        transfer::public_transfer(display, sender(ctx));
        transfer::public_transfer(publisher, sender(ctx));
        let nft_cap = KecsonNftCap {
            id: object::new(ctx),
            total_supply: MAX_SUPPLY,
            current_supply: 0,
        };
        transfer::share_object(nft_cap);
    }

    // ===== Public view functions =====
    public fun name(nft: &KecsonNft): &String {
        &nft.name
    }

    public fun description(nft: &KecsonNft): &String {
        &nft.description
    }

    public fun image_url(nft: &KecsonNft): &Url {
        &nft.image_url
    }

    public fun creator(nft: &KecsonNft): &address {
        &nft.creator
    }

    /// Created more than the maximum supply of Num NFT's
    const ETooManyNums: u64 = 0;

    fun u64_to_string(value: u64): String {
        let bytes = vector::empty<u8>();
        if (value == 0) {
            vector::push_back(&mut bytes, 48);
        } else {
            while (value != 0) {
                //'0' ascii is 48
                let mod = value % 10 + 48;
                vector::push_back(&mut bytes, (mod as u8));
                value = value / 10;
            };
        };

        vector::reverse(&mut bytes);
        string::utf8(bytes)
    }

    // ===== Entrypoints =====
    public entry fun mint_to(
        name: vector<u8>,
        url: vector<u8>,
        recipient: address,
        cap: &mut KecsonNftCap,
        ctx: &mut TxContext
    ) {
        let sender = sender(ctx);
        cap.current_supply = cap.current_supply + 1;
        assert!(cap.current_supply <= MAX_SUPPLY, ETooManyNums);
        let nft_name = string::utf8(name);
        string::append(&mut nft_name, utf8(b" #"));
        string::append(&mut nft_name, u64_to_string(cap.current_supply));
        let nft = KecsonNft {
            id: object::new(ctx),
            name: nft_name,
            description: string::utf8(b"letsmove task3 Kecson NFT"),
            image_url: url::new_unsafe_from_bytes(url),
            creator: sender,
        };
        event::emit(NFTMintedEvent {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });
        public_transfer(nft, recipient);
    }

    public entry fun mint_to_sender(
        name: vector<u8>,
        url: vector<u8>,
        cap: &mut KecsonNftCap,
        ctx: &mut TxContext
    ) {
        mint_to(name, url, sender(ctx), cap, ctx);
    }


    /// Transfer `nft` to `recipient`
    public entry fun transfer(nft: KecsonNft, recipient: address) {
        transfer::public_transfer(nft, recipient)
    }

    /// Update the `description` of `nft`
    public entry fun update_description(
        nft: &mut KecsonNft,
        description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(description)
    }

    /// Permanently delete `nft`
    public entry fun burn(nft: KecsonNft, ctx: &mut TxContext) {
        let KecsonNft { id, name, description: _, image_url: _, creator: _ } = nft;
        event::emit(NFTBurnedEvent {
            object_id: object::uid_to_inner(&id),
            owner: sender(ctx),
            name,
        });
        object::delete(id);
    }
}

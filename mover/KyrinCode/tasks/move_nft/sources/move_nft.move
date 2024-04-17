module move_nft::kyrincode_nft {
	use sui::tx_context::{Self, TxContext};
	use sui::object::{Self, UID};
	use std::string::{utf8, String};
	use sui::transfer;
    use sui::event;

    // The creator bundle: these two packages often go together.
    use sui::package;
    use sui::display;

    // One-Time-Witness for the module.
    public struct KYRINCODE_NFT has drop {}

    public struct KyrinCodeNFT has key, store {
        id: UID,
        name: String,
    }

    // Events

    public struct Minted has copy, drop {
        object_id: ID,
        minter: address,
        name: String,
    }

    public struct Transferred has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    /// In the module initializer one claims the `Publisher` object
    /// to then create a `Display`. The `Display` is initialized with
    /// a set of fields (but can be modified later) and published via
    /// the `update_version` call.
    ///
    /// Keys and values are set in the initializer but could also be
    /// set after publishing if a `Publisher` object was created.
    fun init(otw: KYRINCODE_NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
            utf8(b"description"),
            utf8(b"creator"),
        ];

        let values = vector[
            utf8(b"KyrinCode NFT"),
            utf8(b"https://avatars.githubusercontent.com/u/30864546?s=40&v=4"),
            utf8(b"KyrinCode NFT"),
            utf8(b"{tx_context::sender(ctx)}")
        ];
        // Claim the `Publisher` for the package!
        let publisher = package::claim(otw, ctx);
        // Get a new `Display` object for the `Hero` type.
        let mut display = display::new_with_fields<KyrinCodeNFT>(
            &publisher, keys, values, ctx
        );
        // Commit first version of `Display` to apply changes.
        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    /// Anyone can mint `KyrinCodeNFT`!
    public fun mint(name: String, ctx: &mut TxContext) {
        let nft = KyrinCodeNFT {
            id: object::new(ctx),
            name: name,
        };

        event::emit(Minted {
        	object_id: object::id(&nft),
        	minter: tx_context::sender(ctx),
        	name: nft.name,
        });

        transfer::public_transfer(nft, tx_context::sender(ctx));
    }

    public fun transfer(nft: KyrinCodeNFT, recipient: address, ctx: &mut TxContext) {
        event::emit(Transferred {
            object_id: object::id(&nft),
            from: tx_context::sender(ctx),
            to: recipient,
        });

        transfer::public_transfer(nft, recipient);
    }
}
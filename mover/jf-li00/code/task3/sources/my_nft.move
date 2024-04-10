module my_nft::puppy {
    use std::string::String;
    use sui::event;

    /// An example NFT that can be minted by anybody. A Puppy is
    /// a freely-transferable object. Owner can add new traits to
    /// their puppy at any time and even change the image to the
    /// puppy's liking.
    public struct Puppy has key, store {
        id: UID,
        /// Name of the Puppy
        name: String,
        /// Grumpy or chill?
        traits: vector<String>,
        /// The URL of the Puppy's image
        url: String,
    }

    /// Event: emitted when a new Puppy is minted.
    public struct PuppyMinted has copy, drop {
        /// ID of the Puppy
        puppy_id: ID,
        /// The address of the NFT minter
        minted_by: address,
    }

    /// Mint a new Puppy with the given `name`, `traits` and `url`.
    /// The object is transfered to the `recipient`.
    public fun mint_to(
        name: String,
        traits: vector<String>,
        url: String,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let id = object::new(ctx);

        event::emit(PuppyMinted {
            puppy_id: object::uid_to_inner(&id),
            minted_by: tx_context::sender(ctx),
        });

        transfer::transfer(Puppy { id, name, traits, url }, recipient);
    }

    /// Some puppies get new traits over time... owner of one can
    /// add a new trait to their puppy at any time.
    public fun add_trait(puppy: &mut Puppy, trait: String) {
        vector::push_back(&mut puppy.traits, trait);
    }

    /// As the puppy grows, owners can change the image to reflect
    /// the puppy's current state and look.
    public fun set_url(puppy: &mut Puppy, url: String) {
        puppy.url = url;
    }

    /// It's a good practice to allow the owner to destroy the NFT
    /// and get a storage rebate. Not a requirement and depends on
    /// your use case. At last, who doesn't love puppies?
    public fun destroy(puppy: Puppy) {
        let Puppy { id, url: _, name: _, traits: _ } = puppy;
        object::delete(id);
    }

    // Getters for properties.
    // Struct fields are always private and unless there's a getter,
    // other modules can't access them. It's up to the module author
    // to decide which fields to expose and which to keep private.

    /// Get the Puppy's `name`
    public fun name(puppy: &Puppy): String { puppy.name }

    /// Get the Puppy's `traits`
    public fun traits(puppy: &Puppy): &vector<String> { &puppy.traits }

    /// Get the Puppy's `url`
    public fun url(puppy: &Puppy): String { puppy.url }
}

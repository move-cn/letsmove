module my_nft::emoji {
    use std::string::String;
    use sui::event;

    public struct Emoji has key, store {
        id: UID,
        name: String,
        styles: vector<String>,
        url: String,
    }

    /// Event: emitted when a new Emoji is minted.
    public struct EmojiMinted has copy, drop {
        /// ID of the Emoji
        emoji_id: ID,
        /// The address of the NFT minter
        minted_by: address,
    }

    /// Mint a new Emoji with the given `name`, `styles` and `url`.
    /// The object is transfered to the `recipient`.
    public fun mint(
        name: String,
        styles: vector<String>,
        url: String,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let id = object::new(ctx);

        event::emit(EmojiMinted {
            emoji_id: object::uid_to_inner(&id),
            minted_by: tx_context::sender(ctx),
        });

        transfer::transfer(Emoji { id, name, styles, url }, recipient);
    }    
    public fun transfer(
        emoji: Emoji, recipient: address, ctx: &mut TxContext
    ) {
        transfer::public_transfer(emoji, recipient)
    }

    /// Some puppies get new style over time... owner of one can
    /// add a new trait to their emoji at any time.
    public fun add_style(emoji: &mut Emoji, style: String) {
        vector::push_back(&mut emoji.styles, style);
    }

    /// As the emoji grows, owners can change the image to reflect
    /// the emoji's current state and look.
    public fun set_url(emoji: &mut Emoji, url: String) {
        emoji.url = url;
    }

    /// It's a good practice to allow the owner to destroy the NFT
    /// and get a storage rebate. Not a requirement and depends on
    /// your use case. At last, who doesn't love puppies?
    public fun destroy(emoji: Emoji) {
        let Emoji { id, url: _, name: _, styles: _ } = emoji;
        object::delete(id);
    }

    public fun name(emoji: &Emoji): String { emoji.name }
    public fun styles(emoji: &Emoji): &vector<String> { &emoji.styles }
    public fun url(emoji: &Emoji): String { emoji.url }
}
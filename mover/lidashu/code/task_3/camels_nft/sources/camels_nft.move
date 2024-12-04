
#[allow(lint(self_transfer))]
module camels_nft::sui_camel {
    use std::string::String;
    use sui::event;
    
    public struct SuiCamel has key, store {
        id: UID,
        name: String,
        traits: vector<String>,
        url: String,
    }

    /// Event: emitted when a new Camel is minted.
    public struct SuiCamelMinted has copy, drop {
        /// ID of the Puppy
        camel_id: ID,
        /// The address of the NFT minter
        minted_by: address,
    }

    public fun mint_to_sender(
        name: String,
        traits: vector<String>,
        url: String,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let id = object::new(ctx);
        event::emit(SuiCamelMinted {
            camel_id: object::uid_to_inner(&id),
            minted_by: tx_context::sender(ctx),
        });

        let new_camel = SuiCamel { id, name, traits, url };

        transfer::public_transfer(new_camel, sender);
    }

    public fun add_trait(camel: &mut SuiCamel, trait: String) {
        vector::push_back(&mut camel.traits, trait);
    }

    public fun set_url(camel: &mut SuiCamel, url: String) {
        camel.url = url;
    }

    public fun destroy(camel: SuiCamel) {
        let SuiCamel { id, url: _, name: _, traits: _ } = camel;
        object::delete(id);
    }

    public entry fun transfer(
        camel: SuiCamel, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(camel, recipient)
    }

   
    public fun name(camel: &SuiCamel): String { camel.name }

    public fun traits(camel: &SuiCamel): &vector<String> { &camel.traits }

    public fun url(camel: &SuiCamel): String { camel.url }
}

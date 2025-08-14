module escrow::shared {
    use sui::coin::{Coin,TreasuryCap};
    use escrow::treesirop::{Self,TREESIROP};
    use escrow::treesirop_facet::{Self,TREESIROP_FACET};
    use escrow::lock::{Self, Locked, Key};

    /// An object held in escrow
    public struct Escrow<T: key + store> has key, store {
        id: UID,

        /// Owner of `escrowed`
        sender: address,

        /// Intended recipient
        recipient: address,

        /// ID of the key that opens the lock on the object sender wants from
        /// recipient.
        exchange_key: ID,

        /// the escrowed object that we store into an option because it could
        /// already be taken
        escrowed: Option<T>,
    }

    public struct Obj has key,store{
        id: UID,
        number: u64,
    }

    // === Error codes ===

    /// The `sender` and `recipient` of the two escrowed objects do not match
    const EMismatchedSenderRecipient: u64 = 0;

    /// The `exchange_for` fields of the two escrowed objects do not match
    const EMismatchedExchangeObject: u64 = 1;

    /// The escrow has already been exchanged or returned to the original sender
    const EAlreadyExchangedOrReturned: u64 = 2;

    // === Public Functions ===
    public entry fun min_treesirop(
        treasury_cap: &mut TreasuryCap<TREESIROP>, 
        amount: u64, 
        recipient: address,
        ctx: &mut TxContext,
    ) {
        treesirop::mint(treasury_cap,amount,recipient,ctx);
    }

    public entry fun min_treesirop_facet(
        treasury_cap: &mut TreasuryCap<TREESIROP_FACET>, 
        amount: u64, 
        recipient: address,
        ctx: &mut TxContext,
    ) { 
        treesirop_facet::mint(treasury_cap,amount,recipient,ctx);
    }

    public fun create<T: key + store>(
        escrowed: T,
        exchange_key: ID,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let escrow = Escrow {
            id: object::new(ctx),
            sender: tx_context::sender(ctx),
            recipient,
            exchange_key,
            escrowed: option::some(escrowed),
        };

        transfer::public_share_object(escrow);
    }

    /// The `recipient` of the escrow can exchange `obj` with the escrowed item
    public fun swap<T: key + store, U: key + store>(
        escrow: &mut Escrow<T>,
        key: Key,
        locked: Locked<U>,
        ctx: &TxContext,
    ): T {
        assert!(option::is_some(&escrow.escrowed), EAlreadyExchangedOrReturned);
        assert!(escrow.recipient == tx_context::sender(ctx), EMismatchedSenderRecipient);
        assert!(escrow.exchange_key == object::id(&key), EMismatchedExchangeObject);

        let escrowed1 = option::extract<T>(&mut escrow.escrowed);
        let escrowed2 = lock::unlock(locked, key);

        // Do the actual swap
        transfer::public_transfer(escrowed2, escrow.sender);
        escrowed1
    }

    /// The `creator` can cancel the escrow and get back the escrowed item
    public fun return_to_sender<T: key + store>(
        escrow: &mut Escrow<T>,
        ctx: &TxContext
    ): T {
        assert!(escrow.sender == tx_context::sender(ctx), EMismatchedSenderRecipient);
        assert!(option::is_some(&escrow.escrowed), EAlreadyExchangedOrReturned);
        option::extract<T>(&mut escrow.escrowed)
    }

    public entry fun stage_one(obj: Coin<TREESIROP>,ctx: &mut TxContext){
        let c2 = object::id(&obj);
        let (l, k) = lock::lock(obj, ctx);
        let k2 = object::id(&k);
        transfer::public_transfer(l, tx_context::sender(ctx));
        transfer::public_transfer(k, tx_context::sender(ctx));
    }

    public entry fun stage_two(obj: Coin<TREESIROP_FACET>,ik2: ID,bob: address,ctx: &mut TxContext){
        let c2 = object::id(&obj);
        create(obj, ik2, bob,ctx);
    }
    public entry fun stage_three(escrow: Escrow<Coin<TREESIROP_FACET>>,k2:Key,l2: Locked<Coin<TREESIROP>>, ctx: &mut TxContext){
        let mut esc = escrow;
        let c = swap<Coin<TREESIROP_FACET>,Coin<TREESIROP>>(
            &mut esc,
            k2,
            l2,
            ctx,
        );
        transfer::public_share_object(esc);
        transfer::public_transfer(c,tx_context::sender(ctx));
    }

}
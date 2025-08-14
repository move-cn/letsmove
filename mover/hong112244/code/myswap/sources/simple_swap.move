module myswap::escrow_swap {
    use sui::object::{Self, ID, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::event;
    use sui::dynamic_object_field::{Self as dof};

    use myswap::lock::{Self, Locked, Key};

     /// The `name` of the DOF that holds the Escrowed object.
    /// Allows easy discoverability for the escrowed object.
    struct EscrowedObjectKey has copy, store, drop {}

    /// An object held in escrow
    /// 
    /// The escrowed object is added as a Dynamic Object Field so it can still be looked-up.
    struct Escrow<phantom T: key + store> has key, store {
        id: UID,

        /// Owner of `escrowed`
        sender: address,

        /// Intended recipient
        recipient: address,

        /// ID of the key that opens the lock on the object sender wants from
        /// recipient.
        exchange_key: ID,
    }

    // === Error codes ===

    /// The `sender` and `recipient` of the two escrowed objects do not match
    const EMismatchedSenderRecipient: u64 = 0;

    /// The `exchange_for` fields of the two escrowed objects do not match
    const EMismatchedExchangeObject: u64 = 1;

    // === Public Functions ===

    public fun create<T: key + store>(
        escrowed: T,
        exchange_key: ID,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let escrow = Escrow<T> {
            id: object::new(ctx),
            sender: tx_context::sender(ctx),
            recipient,
            exchange_key,
        };

        event::emit(EscrowCreated {
            escrow_id: object::id(&escrow),
            key_id: exchange_key,
            sender: escrow.sender,
            recipient,
            item_id: object::id(&escrowed),
        });

        dof::add(&mut escrow.id, EscrowedObjectKey {}, escrowed);

        transfer::public_share_object(escrow);
    }

    /// The `recipient` of the escrow can exchange `obj` with the escrowed item
    public fun swap<T: key + store, U: key + store>(
        escrow: Escrow<T>,
        key: Key,
        locked: Locked<U>,
        ctx: &TxContext,
    ) {
        let escrowed = dof::remove<EscrowedObjectKey, T>(&mut escrow.id, EscrowedObjectKey {});

        let Escrow {
            id,
            sender,
            recipient,
            exchange_key,
        } = escrow;

        assert!(recipient == tx_context::sender(ctx), EMismatchedSenderRecipient);
        assert!(exchange_key == object::id(&key), EMismatchedExchangeObject);

        // Do the actual swap
        transfer::public_transfer(lock::unlock(locked, key), sender);

        event::emit(EscrowSwapped {
            escrow_id: object::uid_to_inner(&id),
        });

        object::delete(id);

        transfer::public_transfer(escrowed, tx_context::sender(ctx));
    }

    /// The `creator` can cancel the escrow and get back the escrowed item
    public fun return_to_sender<T: key + store>(
        escrow: Escrow<T>,
        ctx: &TxContext
    ) {

        event::emit(EscrowCancelled {
            escrow_id: object::id(&escrow)
        });

        let escrowed = dof::remove<EscrowedObjectKey, T>(&mut escrow.id, EscrowedObjectKey {});

        let Escrow {
            id,
            sender,
            recipient: _,
            exchange_key: _,
        } = escrow;

        assert!(sender == tx_context::sender(ctx), EMismatchedSenderRecipient);
        object::delete(id);
        transfer::public_transfer(escrowed, tx_context::sender(ctx));
    }

    // === Events ===
    struct EscrowCreated has copy, drop {
        /// the ID of the escrow that was created
        escrow_id: ID,
        /// The ID of the `Key` that unlocks the requested object.
        key_id: ID,
        /// The id of the sender who'll receive `T` upon swap
        sender: address,
        /// The (original) recipient of the escrowed object
        recipient: address,
        /// The ID of the escrowed item
        item_id: ID,
    }

    struct EscrowSwapped has copy, drop {
        escrow_id: ID
    }

    struct EscrowCancelled has copy, drop {
        escrow_id: ID
    }
}
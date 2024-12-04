// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

/// An escrow for atomic swap of objects using shared objects without a trusted
/// third party.
///
/// The protocol consists of three phases:
///
/// 1. One party `lock`s their object, getting a `Locked` object and its `Key`.
///    This party can `unlock` their object to preserve livness if the other
///    party stalls before completing the second stage.
///
/// 2. The other party registers a publicly accessible, shared `Escrow` object.
///    This effectively locks their object at a particular version as well,
///    waiting for the first party to complete the swap.  The second party is
///    able to request their object is returned to them, to preserve liveness as
///    well.
///
/// 3. The first party sends their locked object and its key to the shared
///    `Escrow` object.  This completes the swap, as long as all conditions are
///    met:
///
///    - The sender of the swap transaction is the recipient of the `Escrow`.
///
///    - The key of the desired object (`exchange_key`) in the escrow matches
///      the key supplied in the swap.
///
///    - The key supplied in the swap unlocks the `Locked<U>`.
module task5::billa_github2016_shared {

    use sui::event;
    use sui::dynamic_object_field::{Self as dof};

    use task5::billa_github2016_lock::{Locked, Key};

    /// The `name` of the DOF that holds the Escrowed object.
    /// Allows easy discoverability for the escrowed object.
    public struct EscrowedObjectKey has copy, store, drop {}

    /// An object held in escrow
    ///
    /// The escrowed object is added as a Dynamic Object Field so it can still be looked-up.
    public struct Escrow<phantom T: key + store> has key, store {
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

    //docs::#noemit
    public fun create<T: key + store>(
        escrowed: T,
        exchange_key: ID,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let mut escrow = Escrow<T> {
            id: object::new(ctx),
            sender: ctx.sender(),
            recipient,
            exchange_key,
        };

        //docs::#noemit-pause
        event::emit(EscrowCreated {
            escrow_id: object::id(&escrow),
            key_id: exchange_key,
            sender: escrow.sender,
            recipient,
            item_id: object::id(&escrowed),
        });
        //docs::#noemit-resume

        dof::add(&mut escrow.id, EscrowedObjectKey {}, escrowed);

        transfer::public_share_object(escrow);
    }
    //docs::/#noemit

    /// The `recipient` of the escrow can exchange `obj` with the escrowed item
    public fun swap<T: key + store, U: key + store>(
        mut escrow: Escrow<T>,
        key: Key,
        locked: Locked<U>,
        ctx: &TxContext,
    ): T {
        let escrowed = dof::remove<EscrowedObjectKey, T>(&mut escrow.id, EscrowedObjectKey {});

        let Escrow {
            id,
            sender,
            recipient,
            exchange_key,
        } = escrow;

        assert!(recipient == ctx.sender(), EMismatchedSenderRecipient);
        assert!(exchange_key == object::id(&key), EMismatchedExchangeObject);

        // Do the actual swap
        transfer::public_transfer(locked.unlock(key), sender);

        event::emit(EscrowSwapped {
            escrow_id: id.to_inner(),
        });

        id.delete();

        escrowed
    }

    /// The `creator` can cancel the escrow and get back the escrowed item
    public fun return_to_sender<T: key + store>(
        mut escrow: Escrow<T>,
        ctx: &TxContext
    ): T {
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

        assert!(sender == ctx.sender(), EMismatchedSenderRecipient);
        id.delete();
        escrowed
    }

    // === Events ===
    public struct EscrowCreated has copy, drop {
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

    public struct EscrowSwapped has copy, drop {
        escrow_id: ID
    }

    public struct EscrowCancelled has copy, drop {
        escrow_id: ID
    }
}
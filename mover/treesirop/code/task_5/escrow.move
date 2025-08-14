// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

/// The `lock` module offers an API for wrapping any object that has
/// `store` and protecting it with a single-use `Key`.
///
/// This is used to commit to swapping a particular object in a
/// particular, fixed state during escrow.
module escrow::lock {
   

    /// A wrapper that protects access to `obj` by requiring access to a `Key`.
    ///
    /// Used to ensure an object is not modified if it might be involved in a
    /// swap.
    public struct Locked<T> has key, store {
        id: UID,
        key: ID,
        obj: T,
    }

    /// Key to open a locked object (consuming the `Key`)
    public struct Key has key, store { id: UID }

    // === Error codes ===

    /// The key does not match this lock.
    const ELockKeyMismatch: u64 = 0;

    // === Public Functions ===

    /// Lock `obj` and get a key that can be used to unlock it.
    public fun lock<T>(
        obj: T,
        ctx: &mut TxContext,
    ): (Locked<T>, Key) {
        let key = Key { id: object::new(ctx) };
        let lock = Locked {
            id: object::new(ctx),
            key: object::id(&key),
            obj,
        };
        (lock, key)
    }

    /// Unlock the object in `locked`, consuming the `key`.  Fails if the wrong
    /// `key` is passed in for the locked object.
    public fun unlock<T>(locked: Locked<T>, key: Key): T {
        assert!(locked.key == object::id(&key), ELockKeyMismatch);
        let Key { id } = key;
        object::delete(id);

        let Locked { id, key: _, obj } = locked;
        object::delete(id);
        obj
    }

    // === Tests ===
    #[test_only] use sui::coin::{Self, Coin};
    #[test_only] use sui::sui::SUI;
    #[test_only] use sui::test_scenario::{Self as ts, Scenario};

    #[test_only]
    fun test_coin(ts: &mut Scenario): Coin<SUI> {
        coin::mint_for_testing<SUI>(42, ts::ctx(ts))
    }

    #[test]
    fun test_lock_unlock() {
        let mut ts = ts::begin(@0xA);
        let mut_ts = &mut ts;
        let coin = test_coin(mut_ts);

        let (lock, key) = lock(coin, ts::ctx(mut_ts));
        let coin = unlock(lock, key);

        coin::burn_for_testing(coin);
        ts::end(ts);
    }

    #[test]
    #[expected_failure(abort_code = ELockKeyMismatch)]
    fun test_lock_key_mismatch() {
        use std::debug;
        let mut ts = ts::begin(@0xA);
        // debug::print(&ts);
        let (l, _k) = lock(42, ts::ctx(&mut ts));
        
        let (_l, k) = lock(43, ts::ctx(&mut ts));
    
        // unlock(l, k);
        debug::print(&unlock(l, k));
        abort 1337
    }
}

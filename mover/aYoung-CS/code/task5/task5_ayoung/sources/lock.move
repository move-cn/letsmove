/// Module: task5_ayoung
module task5_ayoung::lock {

    public struct Locked<T: store> has key, store {
        id: UID,
        key: ID,
        obj: T,
    }

    public struct Key has key, store {id :UID}

    const ELockKeyMismatch: u64 = 0;

    public fun lock<T: store>(
        obj: T,
        ctx: &mut TxContext,
    ) : (Locked<T>, Key) {
        let key = Key { id: object::new(ctx)};
        let lock = Locked {
            id: object::new(ctx),
            key: object::id(&key),
            obj,
        };
        (lock, key)
    }

    public fun unlock<T: store>(
        locked: Locked<T>,
        key: Key,
    ) : T {
        assert!(locked.key == object::id(&key), ELockKeyMismatch);
        let Key { id } = key;
        object::delete(id);

        let Locked { id, key: _, obj} = locked;
        object::delete(id);
        obj
    }

    // test

    #[test_only] use sui::test_scenario::{Self as ts, Scenario};
    #[test_only] use sui::sui::SUI;
    #[test_only] use sui::coin::{Self, Coin};

    #[test_only]
    fun test_coin(ts: &mut Scenario) : Coin<SUI> {
        coin::mint_for_testing<SUI>(42, ts::ctx(ts))
    }

    #[test]
    fun test_lock_unlock() {
        let mut ts = ts::begin(@0xA);
        let coin = test_coin(&mut ts);

        let (lock, key) = lock(coin, ts::ctx(&mut ts));
        let coin = unlock(lock, key);
        
        coin::burn_for_testing(coin);
        ts::end(ts);

    }

    #[test]
    #[expected_failure(abort_code = ELockKeyMismatch)]
    fun test_lock_key_mismatch() {
        let mut ts = ts::begin(@0xA);
        let (l, _k) = lock(42, ts::ctx(&mut ts));
        let (_l, k) = lock(43, ts::ctx(&mut ts));

        unlock(l, k);
        abort 1337

    }

}

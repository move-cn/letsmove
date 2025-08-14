/// Module: task5_ayoung
module task5_ayoung::swap {

    use task5_ayoung::lock::{Self, Locked, Key};

    public struct Escrow<T: key+store> has key, store {
        id : UID,
        sender: address,
        recipient: address,
        exchange_key: ID,
        escrowed: Option<T>

    }

    const EMismatchedSenderRecipient: u64 = 0;
    const EMismatchedExchangeObject: u64 = 1;
    const EAlreadyExchangedOrReturned: u64 = 2;

    public fun create<T: key+store>(
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

    public fun swap<T: key+store, U: key+store>(
        escrow: &mut Escrow<T>,
        key: Key,
        locked: Locked<U>,
        ctx: &TxContext
    ) : T {
        assert!(option::is_some(&escrow.escrowed), EAlreadyExchangedOrReturned);
        assert!(escrow.recipient == tx_context::sender(ctx), EMismatchedSenderRecipient);
        assert!(escrow.exchange_key == object::id(&key), EMismatchedExchangeObject);

        // swap here
        let escrow1 = option::extract<T>(&mut escrow.escrowed);
        let escrow2 = lock::unlock(locked, key);

        transfer::public_transfer(escrow2, escrow.sender);
        escrow1
        
    }

    public fun return_to_sender<T: key+store>(
        escrow: &mut Escrow<T>,
        ctx: &TxContext
    ) : T {
        assert!(escrow.sender == tx_context::sender(ctx), EMismatchedSenderRecipient);
        assert!(option::is_some(&escrow.escrowed), EAlreadyExchangedOrReturned);
        option::extract(&mut escrow.escrowed)

    }

    #[allow(lint(self_transfer))]
    public fun start_swap<T: key+store>(
        coin: T,
        ctx: &mut TxContext
    ) : (ID, ID)  {
        let cid = object::id(&coin);
        let (l, k) = lock::lock(coin, ctx);
        let kid = object::id(&k);

        transfer::public_transfer(l, tx_context::sender(ctx));
        transfer::public_transfer(k, tx_context::sender(ctx));
        (cid, kid)
    }

    public fun create_escrow<T: key+store>(
        coin: T,
        exchange_key: ID,
        recipient: address,
        ctx: &mut TxContext
        )
    : ID {
        let cid = object::id(&coin);
        create(coin, exchange_key, recipient, ctx);
        cid
    }

    public fun end_swap<T: key+store, U: key+store>(
        escrow: &mut Escrow<T>,
        k2: Key,
        l2: Locked<U>,
        recipient: address,
        ctx: &mut TxContext
    ){
        let coin = escrow.swap(k2, l2, ctx);
        transfer::public_transfer(coin, recipient);
    }

    // === Tests ===
    #[test_only] use sui::sui::SUI;
    #[test_only] use sui::test_scenario::{Self as ts, Scenario};
    #[test_only] use sui::coin::{Self, Coin};

    #[test_only] const ALICE: address = @0xA;
    #[test_only] const BOB: address = @0xB;
    #[test_only] const DIANE: address = @0xD;

    #[test_only]
    fun test_coin(ts: &mut Scenario): Coin<SUI> {
        coin::mint_for_testing<SUI>(42, ts.ctx())
    }

    #[test]
    fun test_successful_swap() {
        let mut ts = ts::begin(@0x0);

        // Bob locks the object they want to trade.
        let (i2, ik2) = {
            ts.next_tx(BOB);
            let c = test_coin(&mut ts);
            let cid = object::id(&c);
            let (l, k) = lock::lock(c, ts.ctx());
            let kid = object::id(&k);
            transfer::public_transfer(l, BOB);
            transfer::public_transfer(k, BOB);
            (cid, kid)
        };

        // Alice creates a public Escrow holding the object they are willing to
        // share, and the object they want from Bob
        let i1 = {
            ts.next_tx(ALICE);
            let c = test_coin(&mut ts);
            let cid = object::id(&c);
            create(c, ik2, BOB, ts.ctx());
            cid
        };

        // Bob responds by offering their object, and gets Alice's object in
        // return.
        {
            ts.next_tx(BOB);
            let mut escrow: Escrow<Coin<SUI>> = ts.take_shared();
            let k2: Key = ts.take_from_sender();
            let l2: Locked<Coin<SUI>> = ts.take_from_sender();
            let c = escrow.swap(k2, l2, ts.ctx());

            transfer::public_transfer(c, BOB);

            ts::return_shared(escrow);
        };

        // Commit effects from the swap
        ts.next_tx(@0x0);

        // Alice gets the object from Bob
        {
            let c: Coin<SUI> = ts.take_from_address_by_id(ALICE, i2);
            ts::return_to_address(ALICE, c);
        };

        // Bob gets the object from Alice
        {
            let c: Coin<SUI> = ts.take_from_address_by_id(BOB, i1);
            ts::return_to_address(BOB, c);
        };

        ts::end(ts);
    }

    #[test]
    #[expected_failure(abort_code = EMismatchedSenderRecipient)]
    fun test_mismatch_sender() {
        let mut ts = ts::begin(@0x0);

        let ik2 = {
            ts.next_tx(DIANE);
            let c = test_coin(&mut ts);
            let (l, k) = lock::lock(c, ts.ctx());
            let kid = object::id(&k);
            transfer::public_transfer(l, DIANE);
            transfer::public_transfer(k, DIANE);
            kid
        };

        // Alice wants to trade with Bob.
        {
            ts.next_tx(ALICE);
            let c = test_coin(&mut ts);
            create(c, ik2, BOB, ts.ctx());
        };

        // But Diane is the one who attempts the swap
        {
            ts.next_tx(DIANE);
            let mut escrow: Escrow<Coin<SUI>> = ts.take_shared();
            let k2: Key = ts.take_from_sender();
            let l2: Locked<Coin<SUI>> = ts.take_from_sender();

            //这里用的escrow里recipient是BOB 和DIANE对不上
            let c = escrow.swap(k2, l2, ts.ctx());

            transfer::public_transfer(c, DIANE);
        };

        abort 1337
    }


    #[test]
    #[expected_failure(abort_code = EMismatchedExchangeObject)]
    fun test_mismatch_object() {
        let mut ts = ts::begin(@0x0);

        {
            ts.next_tx(BOB);
            let c = test_coin(&mut ts);
            let (l, k) = lock::lock(c, ts.ctx());
            transfer::public_transfer(l, BOB);
            transfer::public_transfer(k, BOB);
        };

        // Alice wants to trade with Bob, but Alice has asked for an object (via
        // its `exchange_key`) that Bob has not put up for the swap.
        {
            ts.next_tx(ALICE);
            let c = test_coin(&mut ts);
            let cid = object::id(&c);
            create(c, cid, BOB, ts.ctx());
        };

        // When Bob tries to complete the swap, it will fail, because they
        // cannot meet Alice's requirements.
        {
            ts.next_tx(BOB);
            let mut escrow: Escrow<Coin<SUI>> = ts.take_shared();
            let k2: Key = ts.take_from_sender();
            let l2: Locked<Coin<SUI>> = ts.take_from_sender();
            
            // Alice create的时候没用BOB的exchange_key，造成此处escrow中exchange_key与BOB拿的对不上
            let c = escrow.swap(k2, l2, ts.ctx());

            transfer::public_transfer(c, BOB);
        };

        abort 1337
    }

    #[test]
    #[expected_failure(abort_code = EMismatchedExchangeObject)]
    fun test_object_tamper() {
        let mut ts = ts::begin(@0x0);

        // Bob locks their object.
        let ik2 = {
            ts.next_tx(BOB);
            let c = test_coin(&mut ts);
            let (l, k) = lock::lock(c, ts.ctx());
            let kid = object::id(&k);
            transfer::public_transfer(l, BOB);
            transfer::public_transfer(k, BOB);
            kid
        };

        // Alice sets up the escrow
        {
            ts.next_tx(ALICE);
            let c = test_coin(&mut ts);
            create(c, ik2, BOB, ts.ctx());
        };

        // Bob has a change of heart, so they unlock the object and tamper with
        // it before initiating the swap, but it won't be possible for Bob to
        // hide their tampering.
        {
            ts.next_tx(BOB);
            let k: Key = ts.take_from_sender();
            let l: Locked<Coin<SUI>> = ts.take_from_sender();
            let mut c = lock::unlock(l, k);

            let _dust = c.split(1, ts.ctx());
            let (l, k) = lock::lock(c, ts.ctx());
            let mut escrow: Escrow<Coin<SUI>> = ts.take_shared();

            // 重新lock了，exchange_key对不上
            let c = escrow.swap(k, l, ts.ctx());

            transfer::public_transfer(c, BOB);
        };

        abort 1337
    }

    #[test]
    fun test_return_to_sender() {
        let mut ts = ts::begin(@0x0);

        // Alice puts up the object they want to trade
        let cid = {
            ts.next_tx(ALICE);
            let c = test_coin(&mut ts);
            let cid = object::id(&c);
            let i = object::id_from_address(@0x0);
            create(c, i, BOB, ts.ctx());
            cid
        };

        // ...but has a change of heart and takes it back
        {
            ts.next_tx(ALICE);
            let mut escrow: Escrow<Coin<SUI>> = ts.take_shared();

            // 拿回
            let c = escrow.return_to_sender(ts.ctx());

            transfer::public_transfer(c, ALICE);
            ts::return_shared(escrow);
        };

        ts.next_tx(@0x0);

        // Alice can then access it.
        {
            let c: Coin<SUI> = ts.take_from_address_by_id(ALICE, cid);
            ts::return_to_address(ALICE, c)
        };

        ts::end(ts);
    }

    #[test]
    #[expected_failure]
    fun test_return_to_sender_failed_swap() {
        let mut ts = ts::begin(@0x0);

        // Bob locks their object.
        let ik2 = {
            ts.next_tx(BOB);
            let c = test_coin(&mut ts);
            let (l, k) = lock::lock(c, ts.ctx());
            let kid = object::id(&k);
            transfer::public_transfer(l, BOB);
            transfer::public_transfer(k, BOB);
            kid
        };

        // Alice creates a public Escrow holding the object they are willing to
        // share, and the object they want from Bob
        {
            ts.next_tx(ALICE);
            let c = test_coin(&mut ts);
            create(c, ik2, BOB, ts.ctx());
        };

        // ...but then has a change of heart
        {
            ts.next_tx(ALICE);
            let mut escrow: Escrow<Coin<SUI>> = ts.take_shared();
            let c = escrow.return_to_sender(ts.ctx());
            transfer::public_transfer(c, ALICE);
        };

        // Bob's attempt to complete the swap will now fail.
        {
            ts.next_tx(BOB);

            // 这里出错，前面escrow已经return，不再共享无法再取出
            let mut escrow: Escrow<Coin<SUI>> = ts.take_shared();
            let k2: Key = ts.take_from_sender();
            let l2: Locked<Coin<SUI>> = ts.take_from_sender();
            let c = escrow.swap(k2, l2, ts.ctx());

            transfer::public_transfer(c, BOB);
        };

        abort 1337
    }

}

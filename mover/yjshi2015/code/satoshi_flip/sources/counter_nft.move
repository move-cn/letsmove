module satoshi_flip::counter_nft {
    use sui::bcs::{Self};

    public struct Counter has key {
        id: UID,
        count: u64,
    }

    entry fun burn(self: Counter) {
        let Counter { id, count: _} = self;
        object::delete(id);
    }

    public fun mint(ctx: &mut TxContext): Counter {
        Counter {
            id: object::new(ctx),
            count: 0
        }
    }

    public fun transfer_to_sender(counter: Counter, ctx: &mut TxContext) {
        transfer::transfer(counter, tx_context::sender(ctx));
    }

    public fun get_vrf_input_and_increment(self: &mut Counter): vector<u8> {
        let mut vrf_input = object::id_bytes(self);
        let count_to_bytes = bcs::to_bytes(&count(self));
        vrf_input.append(count_to_bytes);
        self.increment();
        vrf_input
    }

    public fun count(self: &Counter): u64 {
        self.count
    }

    fun increment(self: &mut Counter) {
        self.count = self.count + 1;
    }

    #[test_only]
    public fun burn_for_testing(self: Counter) {
        self.burn();
    }
}
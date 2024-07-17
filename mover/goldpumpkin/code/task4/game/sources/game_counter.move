module game::game_counter {

    public struct GameCounter has key {
        id: UID,
        count: u64,
    }

    public fun init_gc(ctx: &mut TxContext) {
        let game_counter = GameCounter {
            id: object::new(ctx),
            count: 0,
        };
        transfer::share_object(game_counter);
    }

    public fun get_next_id(counter: &mut GameCounter): u64 {
        let current_id = counter.count;
        counter.count = counter.count + 1;
        current_id
    }
}
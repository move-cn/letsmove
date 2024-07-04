module design::guardian_2 {

    public struct Guardian<phantom T: drop> has key, store {
        id: UID
    }

    public fun create_guardian<T: drop>(
        _witness: T, ctx: &mut TxContext
    ): Guardian<T> {
        Guardian { id: object::new(ctx) }
    }
}


module design::guardian_3 {
    use sui::transfer::public_transfer;
    use design::peace_guardian_2::PEACE_HOLD;
    use design::guardian_2::create_guardian;
    use design::peace_guardian_2::get_peace;

    public entry fun create_guardian_use_hold(hold: PEACE_HOLD, ctx: &mut TxContext) {
        let peace = get_peace(hold);

        let house = create_guardian(peace, ctx);
        public_transfer(house, @0x112222)
    }
}


module design::peace_guardian_2 {
    use sui::object;

    public struct PEACE has drop, store {}

    public struct PEACE_HOLD has key {
        id: UID,
        peace: PEACE
    }


    fun init(ctx: &mut TxContext) {
        let peace = PEACE {};

        let peace_hold = PEACE_HOLD {
            id: object::new(ctx),
            peace,
        };

        transfer::public_transfer(
            peace_hold,
            @0x1111
        );
    }

    public fun get_peace(peace_hold: PEACE_HOLD): PEACE {
        let PEACE_HOLD { id, peace } = peace_hold;
        object::delete(id);
        peace
    }
}
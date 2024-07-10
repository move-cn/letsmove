
module design::guardian {

    public struct Guardian<phantom T: drop> has key, store {
        id: UID
    }


    public fun create_guardian<T: drop>(
        _witness: T, ctx: &mut TxContext
    ): Guardian<T> {
        Guardian { id: object::new(ctx) }
    }
}




module design::peace_guardian {
    use design::guardian;

    public struct PEACE has drop {}

    fun init(ctx: &mut TxContext) {

        let peace = PEACE{};

        transfer::public_transfer(
            guardian::create_guardian(peace, ctx),
            ctx.sender()
        )
    }
}
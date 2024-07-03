module ability::event {

    use sui::event::emit;

    public struct Event1 has copy, drop {
        age: u8,
    }

    fun init(ctx: &mut TxContext) {
        let eve = Event1 {
            age: 10,
        };

        emit(eve);
    }
}

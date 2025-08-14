module my_game::guessing{
    use sui::event;

    const MAX_NUMBER: u64 = 0xff;

    public struct GameRecord has drop, copy{
        user_input: u64,
        real_number: u64,
        win: bool,
    }

    public fun play(user_input: u64, ctx: &mut TxContext){
        let time_now = tx_context::epoch_timestamp_ms(ctx);
        let real_number = (time_now % MAX_NUMBER) as u64; 
        let win = real_number == user_input;
        let record = GameRecord {
            user_input,
            real_number,
            win, 
        };
        event::emit(record);
    }
}
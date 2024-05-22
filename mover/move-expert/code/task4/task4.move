// 这个游戏的关键是随机数和延迟函数
// 延迟函数负责在一定时间后，生成结果；随机数负责生成结果，可以为多人单局游戏
module task4::guess_number_game {
    use std::string;
    use sui::event;
    use sui::clock::{Self,Clock};

    const EInvalidValue: u64 = 0;
    const MAXVALUE: u64 = 3;

    // 记录
    public struct RecordModel has drop, copy {
        user_number: u64,
        random_number: u64,
        result: bool,
        action: string::String,
        github: string::String,
    }

    // 随机数
    fun get_random(clock: &Clock): u64{
        let random_number = ((clock::timestamp_ms(clock) % MAXVALUE) as u64);
        random_number
    }

    // 执行
    public entry fun run(guess: u64, clock: &Clock) {
        assert!(guess < MAXVALUE, EInvalidValue);
        let random = get_random(clock);
        let result = (guess == random);
        let message = if (result) {
            string::utf8(b"Right")
        } else {
            string::utf8(b"Wrong")
        };

        event::emit(RecordModel{user_number: guess, random_number: random, result, action: message, github: string::utf8(b"move-expert")});
    }
}



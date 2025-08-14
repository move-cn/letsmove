module task_four::mygame{
    use std::string;
    use sui::event;
    use std::debug;
    use sui::clock::{Self, Clock};

    const EInvalidNumber: u64 = 0;
    struct GameResult has drop,copy{

        your_number: u64,
        computer_number: u64,
        result: string::String
    }

    public fun play(number: u64, clock: &Clock){
        // 玩家不能输入大于9的数字
        assert!(number < 10,EInvalidNumber);
        let computer_number = get_random(9,clock);
        let resultstr = if (number == computer_number) {

            string::utf8(b"ping")
        } else if (number > computer_number) {
            string::utf8(b"you win")
        } else {
            string::utf8(b"you lose")
        };
        let result = GameResult {
            your_number: number,
            computer_number: computer_number,
            result: resultstr
        };
        event::emit(result);
    }

    public fun get_random(max: u64, clock: &Clock):u64{
        let random_value = ((clock::timestamp_ms(clock) % max) as u64);
        debug::print(&random_value);
        random_value
    }
}
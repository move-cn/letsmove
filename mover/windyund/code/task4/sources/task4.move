module task4::guess_number {
    use sui::event;
    use std::debug;
    use std::hash::sha3_256;
    use std::string::{Self};
    use sui::clock::{Self, Clock};
    use sui::transfer;
    use sui::coin::{Self, TreasuryCap};
    use sui::tx_context::{Self, TxContext};


    const EInvaildNumber: u64 = 1;

    const NAME: vector<u8> = b"windyund";

    public struct GuessGameResult has drop, copy {
        you_number: u64,
        game_number: u64,
        output: string::String,
    }
    /**
    *  玩游戏猜数
    *  说出0-9的数字，如果你的数字和系统随机数一样，你就赢了
    *  如果你赢了，你将获得1个MYC 奖励
    */
    public entry fun play<T>( treasuryCap: &mut TreasuryCap<T>, number: u64,clock: &Clock, ctx: &mut TxContext) {

        assert!(number >= 0 && number < 10, EInvaildNumber);

        let game_number = random(clock);

        let out_put = if (game_number == number) {
            let coins = coin::mint(treasuryCap, 1_000_000, ctx);
            //发送奖励
            transfer::public_transfer(coins, tx_context::sender(ctx));
            string::utf8(b"You Win!")
        }else {
            string::utf8(b"You Lose!")
        };
        let result = GuessGameResult {
            you_number: number,
            game_number: game_number,
            output: out_put
        };
        event::emit(result);
    }

    /**
     * 根据时间戳 * 名字hash后的数 取余
     * @brief 生成随机数
     * @param clock 时钟
     * @return u64 随机数
    */
    fun random(clock: &Clock): u64 {
        let val = sha3_256(NAME).pop_back() as u64;
        let random_value = ((clock::timestamp_ms(clock) * val % 10) as u64);
        debug::print(&random_value);
        random_value
    }
}
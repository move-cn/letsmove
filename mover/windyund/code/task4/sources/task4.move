module task4::guess_number {
   use sui::event;
   use std::debug;
    use std::hash::sha3_256;
    use std::string::{Self};
    use sui::clock::{Self, Clock};

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
   */
   public entry fun play(number: u64, clock: &Clock){

        assert!(number >=0 && number <10 ,EInvaildNumber);

        let game_number = random(clock);

        let out_put = if (game_number == number) {
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
    fun random(clock: &Clock):u64{
        let val = sha3_256(NAME).pop_back() as u64;
        let random_value = ((clock::timestamp_ms(clock) * val   % 10) as u64);
        debug::print(&random_value);
        random_value
    }

}
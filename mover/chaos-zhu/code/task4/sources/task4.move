module task4::game{
  use std::string;
  use sui::event;
  use sui::clock::{Self,Clock};

  public struct GameResultEvent has drop, copy {
    user_guess: string::String,
    random_number: u64,
    result: string::String,
  }
  public struct RandomResultEvent has drop, copy {
    random_result: u64,
  }

  // 测试随机数
  public entry fun test_get_random(clock:&Clock) {
    let time = clock::timestamp_ms(clock);
    let random_result = time % 10;

    event::emit(RandomResultEvent{ random_result, });
  }

  // 生成随机数
  fun get_random(clock:&Clock):u64{
    let time = clock::timestamp_ms(clock);
    let random_number = time % 10;
    random_number
  }

  public entry fun play(guess:u64, clock:&Clock){
    // 限制输入0(偶数)或1(奇数)
    assert!(guess < 2, 0);
    // 0 为偶数
    let user_guess = if (guess==0){
        string::utf8(b"你的猜测：偶数")
    } else{
    // 1 为奇数
        string::utf8(b"你的猜测：奇数")
    };

    let random_number = get_random(clock);
    // 是否猜对
    let result = if (random_number % 2 == guess) {
        string::utf8(b"你赢了😁")
    } else {
        string::utf8(b"你输了😭")
    };

    event::emit(GameResultEvent{ user_guess, random_number, result, });
  }
}
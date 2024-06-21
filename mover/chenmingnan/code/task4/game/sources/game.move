module game::game {
  use std::string;
  use sui::event;
  use sui::clock::{Self, Clock};

  // 事件结构体定义
  public struct GameResultEvent has drop, copy {
    user_choice: u64,
    random_choice: u64,
    result: string::String,
  }

  // 生成随机选择
  fun get_random_choice(clock: &Clock): u64 {
    let time = clock::timestamp_ms(clock);
    let random_choice = time % 3;  // 0: 石头, 1: 剪刀, 2: 布
    random_choice
  }

  // 判断游戏结果
  fun determine_result(user_choice: u64, random_choice: u64): string::String {
    if (user_choice == random_choice) {
        string::utf8(b"draw")
    } else if ((user_choice == 0 && random_choice == 1) ||  // 石头赢剪刀
               (user_choice == 1 && random_choice == 2) ||  // 剪刀赢布
               (user_choice == 2 && random_choice == 0)) {  // 布赢石头
        string::utf8(b"you win")
    } else {
        string::utf8(b"you lose")
    }
  }

  // 石头剪刀布游戏逻辑
  public entry fun play(user_choice: u64, clock: &Clock) {
    // 断言输入的选择在合理范围内
    assert!(user_choice < 3, 0);

    // 获取系统的随机选择
    let random_choice = get_random_choice(clock);
    
    // 判断游戏结果
    let result = determine_result(user_choice, random_choice);

    // 触发事件
    event::emit(GameResultEvent { user_choice, random_choice, result });
  }
}

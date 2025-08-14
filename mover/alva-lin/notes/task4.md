> [letsmove](https://github.com/move-cn/letsmove)
>
> Let's Move 一项学Move获得SUI的激励计划，鼓励更多的人学习Move语言
>
> 学习日志 ([alva-lin](https://github.com/alva-lin/letsmove))

# Task 4 - 完成一个游戏的上链部署(mainnet)

> 任务
>
> - 完成 链游相关知识的学习
>
> - 完成 随机数的学习
>
> - 完成 如何存储Coin在合约的学习
>
> - 完成 第一个游戏合约部署主网

本次任务，我选择了简单的游戏：石头剪刀布，由单个玩家进行游玩，与之对抗的电脑，使用随机数来生成操作。随机数的来源，使用全局时钟

## 代码

```move
module new_gaming::rock_paper_scissors {
    use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::event;

    const EInvalidNumber: u64 = 1;

    struct GamingResultEvent has copy, drop {
        is_win: bool,
        your_choice: String,
        computer_choice: String,
        result: String,
    }

    fun get_random_choice(clock: &Clock) : u8 {
        ((clock::timestamp_ms(clock) % 3) as u8)
    }

    fun map_choice_to_string(choice: u8) : String {
        if (choice == 0) {
            string::utf8(b"rock")
        } else if (choice == 1) {
            string::utf8(b"paper")
        } else if (choice == 2) {
            string::utf8(b"scissors")
        } else {
            string::utf8(b"Invalid")
        }
    }

    public fun play(choice: u8, clock: &Clock) {
        assert!(choice < 3, EInvalidNumber);

        let computer_choice = get_random_choice(clock);
        let (result, is_win) = if (
            (choice == 0 && computer_choice == 1)
            || (choice == 1 && computer_choice == 2)
            || (choice == 2 && computer_choice == 0)
        ) {
            (string::utf8(b"Win"), true)
        } else if (choice == computer_choice) {
            (string::utf8(b"Draw"), false)
        } else {
            (string::utf8(b"Lose"), false)
        };

        event::emit(GamingResultEvent {
            result,
            is_win,
            your_choice: map_choice_to_string(choice),
            computer_choice: map_choice_to_string(computer_choice),
        });
    }
}
```

### 随机数

代码中使用了 `sui::clock::Clock` 时钟，来作为随机数。

我们可以找到对应的源码 [`clock.move`](crates/sui-framework/packages/sui-framework/sources/clock.move)，其中关于 Clock 有一段注释。解释了 Clock 是一个单例共享对象，为 Move 的调用提供时间。**该对象的地址为 `0x6`，只能由入口函数独取（通过不可变引用访问）**。

Move 中，对象即地址，也就是说我们在需要传入 Clock 时，直接使用它的地址 `0x6`，就可以传入 Clock 对象。

## 推送和调用

我们跳过包的发布流程，直接调用方法

```bash
# 你可以直接使用我已经发布好的包
# export PACKAGE_ID=0xf968242b22a4f05b62847688c4071aa82c8c97c6a39f08b4b2f12cd7f662cdff
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module rock_paper_scissors --function play --args 0 0x6
```

可以得到输出，因为我直接将游戏结果写到事件中，所以可以清晰看出结果内容，多次调用方法，可以看到 computer_choice 的变化，同时 result 也会正确计算。

> 也可以直接使用 SuiScan 来查看[本次交易](https://suiscan.xyz/mainnet/tx/61QxmsdND2t9yCSGFYXPAGH3LRJH3gYb1TuggBpbuHFX)的信息

```log
# 交易 hash
Transaction Digest: 61QxmsdND2t9yCSGFYXPAGH3LRJH3gYb1TuggBpbuHFX

# 事件内容
╭──────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                         │
├──────────────────────────────────────────────────────────────────┤
│  ┌──                                                             │
│  │ EventID: 61QxmsdND2t9yCSGFYXPAGH3LRJH3gYb1TuggBpbuHFX:0       │
│  │ PackageID: 0xf968242b2XXXXXXXXXXX662cdff                      │
│  │ Transaction Module: rock_paper_scissors                       │
│  │ Sender: 0xb31fcf5cXXXXXXXXa6965c57f48                         │
│  │ EventType: 0xf9682....2cdff::rock_.._ssors::GamingResultEvent │
│  │ ParsedJSON:                                                   │
│  │   ┌─────────────────┬───────┐                                 │
│  │   │ computer_choice │ rock  │                                 │
│  │   ├─────────────────┼───────┤                                 │
│  │   │ is_win          │ false │                                 │
│  │   ├─────────────────┼───────┤                                 │
│  │   │ result          │ Draw  │                                 │
│  │   ├─────────────────┼───────┤                                 │
│  │   │ your_choice     │ rock  │                                 │
│  │   └─────────────────┴───────┘                                 │
│  └──                                                             │
╰──────────────────────────────────────────────────────────────────╯
```

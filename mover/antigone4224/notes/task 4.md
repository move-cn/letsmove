#  完成游戏的上链部署



随机数：

利用sui:clock 的时间戳接口实现

```
    fun get_random_choice(clock: &Clock) : u8 {
        ((clock::timestamp_ms(clock) % 3) as u8)
    }
```



```

module antigone::antigone 
 {
    use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::event;

    const EInvalidNumber: u64 = 1;

   public struct GamingResultEvent has copy, drop {
        is_win: bool,
        your_choice: String,
        antigone_choice: String,
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

        let antigone_choice = get_random_choice(clock);
        let (result, is_win) = if (
            (choice == 0 && antigone_choice == 0)
            || (choice == 1 && antigone_choice == 1)
            || (choice == 2 && antigone_choice == 2)
        ) {
            (string::utf8(b"Congratulations ,we have great rapport!"), true)
        }  else {
            (string::utf8(b"I'm sorry, we still need to work on our rapport."), false)
        };

        event::emit(GamingResultEvent {
            result,
            is_win,
            your_choice: map_choice_to_string(choice),
            antigone_choice: map_choice_to_string(antigone_choice),
        });
    }
}



```



game_package id:0xd7d58dd3824c820f64ec79d4ba3dcac65ac4237f96066eeef4d676ca248e74a8

call game

```
sui client call --function play --module antigone --package 0xd7d58dd3824c820f64ec79d4ba3dcac65ac4237f96066eeef4d676ca248e74a8 --args 1 0x6  -
-gas-budget 800000000
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.22.0
Transaction Digest: 2uyizHVniRtpaJHntwcXL6rPcs61sw587AYnpzC2pUfM
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8                      │
│ Gas Owner: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8                   │
│ Gas Budget: 800000000 MIST                                                                      │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x4892c081ebedfeb087a5d225c85fae1e083f369ec56959ab4153a2e85b0e7c94                       │
│  │ Version: 89704691                                                                            │
│  │ Digest: 874ZrqwAV9jPmJpyK7K9UnJPoEbH4LJVeTYeQKrwTF1Q                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: u8, Value: 1                                                            │ │
│ │ 1   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000006 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  play                                                               │            │
│ │  │ Module:    antigone                                                           │            │
│ │  │ Package:   0xd7d58dd3824c820f64ec79d4ba3dcac65ac4237f96066eeef4d676ca248e74a8 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    SgzA3xHQuPHhXa63KUATmMPZQE+2TCKvZORGdV+i7stvAxPrWe5JmW7uKTGZCLA8717OluBp1Gnc8ce7reQwCA==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects
│
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2uyizHVniRtpaJHntwcXL6rPcs61sw587AYnpzC2pUfM
│
│ Status: Success
│
│ Executed Epoch: 374
│
│ Mutated Objects:
│
│  ┌──
│
│  │ ID: 0x4892c081ebedfeb087a5d225c85fae1e083f369ec56959ab4153a2e85b0e7c94
│
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 89704692
│
│  │ Digest: Fwfnp8VLrAqXAfzLkQrNADgUMC8Jny7L1LPbAw3YL7pM
│
│  └──
│
│ Shared Objects:
│
│  ┌──
│
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006
│
│  │ Version: 32050807
│
│  │ Digest: 2vubFChExotFVPLsZ3AWrfrGwAGaTJpRzwXqd8bJYzPc
│
│  └──
│
│ Gas Object:
│
│  ┌──
│
│  │ ID: 0x4892c081ebedfeb087a5d225c85fae1e083f369ec56959ab4153a2e85b0e7c94
│
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 89704692
│
│  │ Digest: Fwfnp8VLrAqXAfzLkQrNADgUMC8Jny7L1LPbAw3YL7pM
│
│  └──
│
│ Gas Cost Summary:
│
│    Storage Cost: 988000 MIST
│
│    Computation Cost: 750000 MIST
│
│    Storage Rebate: 978120 MIST
│
│    Non-refundable Storage Fee: 9880 MIST
│
│
│
│ Transaction Dependencies:
│
│    2rc4AYe8fvzyon1yxkF3rV6rRNjxw2jJh6bhThC6T1kv
│
│    Dx4bJo3y4xiRh2aPF8UMqSasrEEWqj1G3warXDq7vnjt
│
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events
            │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──
            │
│  │ EventID: 2uyizHVniRtpaJHntwcXL6rPcs61sw587AYnpzC2pUfM:0
            │
│  │ PackageID: 0xd7d58dd3824c820f64ec79d4ba3dcac65ac4237f96066eeef4d676ca248e74a8
            │
│  │ Transaction Module: antigone
            │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
            │
│  │ EventType: 0xd7d58dd3824c820f64ec79d4ba3dcac65ac4237f96066eeef4d676ca248e74a8::antigone::GamingResultEvent │
│  │ ParsedJSON:
            │
│  │   ┌─────────────────┬──────────────────────────────────────────────────┐
            │
│  │   │ antigone_choice │ rock                                             │
            │
│  │   ├─────────────────┼──────────────────────────────────────────────────┤
            │
│  │   │ is_win          │ false                                            │
            │
│  │   ├─────────────────┼──────────────────────────────────────────────────┤
            │
│  │   │ result          │ I'm sorry, we still need to work on our rapport. │
            │
│  │   ├─────────────────┼──────────────────────────────────────────────────┤
            │
│  │   │ your_choice     │ paper                                            │
            │
│  │   └─────────────────┴──────────────────────────────────────────────────┘
            │
│  └──
            │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x4892c081ebedfeb087a5d225c85fae1e083f369ec56959ab4153a2e85b0e7c94                  │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8                    │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 89704692                                                                             │
│  │ Digest: Fwfnp8VLrAqXAfzLkQrNADgUMC8Jny7L1LPbAw3YL7pM                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes
│
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──
│
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ CoinType: 0x2::sui::SUI
│
│  │ Amount: -759880
│
│  └──
│
╰───────────────────────────────────────────────────────────────────────────────────────────────────
```


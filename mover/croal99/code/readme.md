# 0x01 clock的使用

对前述入口函数的调用采用以下形式，将 **0x6** 作为 **Clock** 参数的地址传递：

```move
sui client call --package <EXAMPLE> --module 'clock' --function 'access' --args '0x6' --gas-budget <GAS-AMOUNT>
```

```move
module sui::clock {
    #[test_only]
    public fun create_for_testing(ctx: &mut TxContext);

    #[test_only]
    public fun share_for_testing(clock: Clock);

    #[test_only]
    public fun increment_for_testing(clock: &mut Clock, tick: u64);

    #[test_only]
    public fun set_for_testing(clock: &mut Clock, timestamp_ms: u64);

    #[test_only]
    public fun destroy_for_testing(clock: Clock);
}
```
The next example presents a simple test that creates a Clock, increments it, and then checks its value:

```move
module example::clock_tests {
    use sui::clock::{Self, Clock};
    use sui::tx_context;

    #[test]
    fun creating_a_clock_and_incrementing_it() {
        let ctx = tx_context::dummy();
        let clock = clock::create_for_testing(&mut ctx);

        clock.increment_for_testing(42);
        assert!(clock.timestamp_ms() == 42, 1);

        clock.set_for_testing(50);
        assert!(clock.timestamp_ms() == 50, 1);

        clock.destroy_for_testing();
    }
}
```

# 0x02 调用其它目录下module

faucetcoin模块的Move.toml
```toml
[package]
name = "faucetcoin"
edition = "2024.beta" # edition = "legacy" to use legacy (pre-2024) Move
# license = ""           # e.g., "MIT", "GPL", "Apache 2.0"
# authors = ["..."]      # e.g., ["Joe Smith (joesmith@noemail.com)", "John Snow (johnsnow@noemail.com)"]
published-at = "0x06f08f31cb1e000334e03cd0214380d5ab9df2d1c206de675b392f587ce95069"

[addresses]
faucetcoin = "0x06f08f31cb1e000334e03cd0214380d5ab9df2d1c206de675b392f587ce95069"
```

game模块的Move.toml
```toml
[addresses]
blue_game = "0x0"
faucetcoin = "0x06f08f31cb1e000334e03cd0214380d5ab9df2d1c206de675b392f587ce95069"

```

# ref

* mover/JonathanSimon123/code/task4
* mover/yemachine/code/game
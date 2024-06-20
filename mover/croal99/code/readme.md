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

# swap

```move
module sample::test01 {

    public struct Object has key, store {
        id: UID,
        scarcity: u8,
        style: u8,
    }

    public fun new(scarcity: u8, style: u8, ctx: &mut TxContext): Object {
        Object {
            id: object::new(ctx),
            scarcity,
            style
        }
    }
    
    // === Tests ===
    #[test_only] use sui::test_scenario as ts;

    #[test]
    fun test_new() {
        let mut ts = ts::begin(@0x0);
        let alice = @0xA;
        let bob = @0xB;
        let custodian = @0xC;

        let i1 = {
            ts::next_tx(&mut ts, alice);
            let o1 = new(1, 0, ts::ctx(&mut ts));
        };

        ts::end(ts);
        // pass
    }

}
```


# 范型 （Generics）

## Generic Syntax
To define a generic type or function, a type signature needs to have a list of generic parameters enclosed in angle brackets (< and >). The generic parameters are separated by commas.
```move
/// Container for any type `T`.
public struct Container<T> has drop {
    value: T,
}

/// Function that creates a new `Container` with a generic value `T`.
public fun new<T>(value: T): Container<T> {
    Container { value }
}

/// Function that creates a new `Container` with a generic value `T`.
public fun new2<T>(): Container<T> {
    Container { value: 0 }
}
```

调用方法
```move
#[test]
fun test_container() {
    // these three lines are equivalent
    let container: Container<u8> = new(10); // type inference
    let container = new<u8>(10); // create a new `Container` with a `u8` value
    let container = new2<u8>(); // create a new `Container` with `u8` type and void param!
    let container = new(10u8);

    assert!(container.value == 10, 0x0);

    // Value can be ignored only if it has the `drop` ability.
    let Container { value: _ } = container;

}

```
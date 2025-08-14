```shell
### 创建项目
sui move new hello_world
```

```sui move
module hello_move::task1 {
    use sui::transfer;
    use std::string::{Self, String};
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};

    public struct Hello has key {
        id: UID,
        msg: String,
    }

    public fun hello_world(ctx: &mut TxContext) {
        let world = Hello {
            id: object::new(ctx),
            msg: string::utf8(b"Hello World"),
        };
        transfer::transfer(world, tx_context::sender(ctx));
    }
}
```
```shell
# 测试
sui move test
# 
sui move build
# 发布
sui client publish --gas-budget 10000000
```
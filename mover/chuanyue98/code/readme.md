# task1 hello move
创建第一个sui 项目 HelloMove

```move
sui move new task1
```

创建hello_move.move

```move
module task1::hello_move {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use std::string::{Self, String};
    use sui::transfer;

    struct HelloMove has key ,store{
        id: UID,
        str: String,
    }

    public fun say_hello(ctx: &mut TxContext) {
        let hello = HelloMove {
            id: object::new(ctx),
            str: string::utf8(b"Hello, Move!"),
        };
        transfer::transfer(hello, tx_context::sender(ctx));
    }
}
```

编译,部署合约

```move
sui move build
sui client publish --gas-budget 300000
```

PackageID

```
0xdf4cd7e5b6c800d646e8da1342224b5eabdde2e9d1fe9cacd66fdb7211d1e457
```

# task2 move coin

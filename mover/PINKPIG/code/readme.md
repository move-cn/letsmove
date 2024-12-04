### task1
```move

/// Module: my_first_package
module my_first_package::hello_PINKPIG {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use std::string::{Self, String};
    use sui::transfer;

    public struct Hello has key {
        id: UID,
        str: String,
    }

    public fun say_hello(ctx: &mut TxContext) {
        let word = Hello {
            id: object::new(ctx),
            str: string::utf8(b"Hello PINKPIG"),
        };
        transfer::transfer(word, tx_context::sender(ctx));
    }
}

```
`package_id:` 0x47a03fd4bd836f3aec1472c76bdcbcb833f379b9dafc3ffddf1fff233efd0736

`sui version:`sui 1.27.0-e5f080922d56-dirty

`sui address:`0xc9984d356bcf6455491993ebf6b875ed76d527acf44c4e413b1e7cef37dfafc0


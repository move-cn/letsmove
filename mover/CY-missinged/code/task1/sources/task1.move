module task1::HelloWorld {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct HelloWorld has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let task1 = HelloWorld {
            id:object::new(ctx),
            say: string(b"move"),
        };
        transfer(task1, sender(ctx));
    }
}
/*
curl --location --request POST 'https://faucet.devnet.sui.io/gas' --header 'Content-Type: application/json' --data-raw '{"FixedAmountRequest": {"recipient": "0xb9e508ed3b97a38d834a591abb9399d931559b1743fb072b24b293aa3a99ff95"}}'
*/ 

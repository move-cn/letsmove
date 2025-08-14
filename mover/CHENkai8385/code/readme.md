# 任务笔记
## task1
### 创建项目
```sui move new hello_world```

### 代码
```
module hello_world::task1 {
    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct HelloWorldObject has key,store {
        id: UID,
        text: string::String
    }

    public fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }
}
```

### 发布
```
sui client publish --gas-budget 10000000
```

## task2

### mycoin
> 所有权属于代币发布者，仅他可以mint
```
module coin_demo::mycoin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct MYCOIN has drop {}

    fun init(witness: MYCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness,6,b"MYCOIN",b"",b"",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury,tx_context::sender(ctx));
    }

    public entry fun mint(treasury_cap:&mut TreasuryCap<MYCOIN>,amount: u64,recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap,amount,ctx);
        transfer::public_transfer(coin,recipient);
    }
}
```

### faucetcoin
> public_share后，对象所有权共享，任何人可以自由mint

```
module coin_demo::faucetcoin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct FAUCETCOIN has drop {}

    fun init(witness: FAUCETCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness,6,b"FAUCETCOIN",b"",b"",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint(treasury_cap:&mut TreasuryCap<FAUCETCOIN>,amount: u64,recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap,amount,ctx);
        transfer::public_transfer(coin,recipient);
    }
}
```

## task3

### mynft
```
module nft_demo::mynft {
    use std::string::{Self,String,utf8};
    use sui::object::{UID, ID};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Self,Url};
    use sui::object;
    use sui::event;

    //nft
    struct MYNFT has key, store {
        id: UID,
        name: String,
        description: String,
        url: Url,
    }

    //event
    struct MYNFTMintedEvent has copy,drop {
        object_id: ID,
        creator: address,
        name: String
    }

    // name
    public fun name(nft: &MYNFT): &String {
        &nft.name
    }

    // description
    public fun description(nft: &MYNFT): &String {
        &nft.description
    }

    // url
    public fun url(nft: &MYNFT): &Url {
        &nft.url
    }

    //mint
    public entry fun mint(name: vector<u8>, description: vector<u8>, url: vector<u8>, ctx: &mut TxContext) {
        let sender = tx_context::sender(ctx);
        let nft = MYNFT {
            id: object::new(ctx),
            name: utf8(name),
            description :utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };
        // emit event
        event::emit(MYNFTMintedEvent {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });
        // transfer
        transfer::public_transfer(nft, sender);

    }

    public entry fun transfer(nft: MYNFT, recipient: address, _: &mut TxContext) {
        transfer::public_transfer(nft, recipient);
    }

    public entry fun update_description(nft: &mut MYNFT,  new_description: vector<u8>,_: &mut TxContext) {
        nft.description = utf8(new_description);
    }

    public entry fun burn(nft: MYNFT, _: &mut TxContext) {
        let MYNFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id);
    }
}
```
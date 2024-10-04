> [letsmove](https://github.com/move-cn/letsmove)
>
> Let's Move 一项学Move获得SUI的激励计划，鼓励更多的人学习Move语言
>
> 学习日志 ([alva-lin](https://github.com/alva-lin/letsmove))

# Task 3 - 完成 NFT 的上链部署(mainnet)

> 任务
>
> - 完成 NFT相关知识的学习
>
> - 完成可以mint NFT的合约上链
>
> - 给自己地址mint一个NFT
>
> - mint 一个 nft 发送到地址: `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`

主要参照 [创建 NFT - Sui Move by Example (中文版)](https://examples.sui-book.com/samples/nft.html)

## NFT 合约代码

NFT 合约代码如下，包含了 NFT 的定义，各类事件以及 entry function。

```move
module new_nft::simple_nft {
    use sui::url::{Url, Self};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{TxContext, Self};

    struct SimpleNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    struct SimpleNftMintEvent has copy, drop  {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    struct SimpleNftTransferEvent has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    struct SimpleNftBurnEvent has copy, drop {
        object_id: ID,
    }

    // Public view function
    public fun name(nft: &SimpleNFT): string::String {
        nft.name
    }

    public fun description(nft: &SimpleNFT): string::String {
        nft.description
    }

    public fun url(nft: &SimpleNFT): Url {
        nft.url
    }

    // Entrypoints
    public entry fun mint_nft(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = SimpleNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };

        event::emit(SimpleNftMintEvent {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer_nft(
        nft: SimpleNFT,
        recipient: address,
        _: &mut TxContext
    ) {
        event::emit(SimpleNftTransferEvent {
            object_id: object::id(&nft),
            from: tx_context::sender(_),
            to: recipient,
        });

        transfer::public_transfer(nft, recipient);
    }

    public entry fun update_description(
        nft: &mut SimpleNFT,
        description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(description);
    }

    public entry fun burn(
        nft: SimpleNFT,
        _: &mut TxContext
    ) {
        let SimpleNFT { id, name: _, description: _, url: _} = nft;

        event::emit(SimpleNftBurnEvent {
            object_id: object::uid_to_inner(&id),
        });

        object::delete(id);
    }
}
```

## mint NFT

首先切换到主链，并发布

```bash
❯ sui client switch --env mainnet
Active environment switched to [mainnet]

❯ sui client publish --gas-budget 200000000 --skip-dependency-verification
# ....
```

拿到发布的 package ID，然后调用公共方法

```bash
# 声明变量
export PACKAGE_ID=0xf78fb118efd9a86d8e2c54ac18766a1313bd8b0df80c85f859f83d01a5f78981
export NFT_NAME="\"joker\""
export DESCRIPTION="\"simple nft, power by alva-lin\""
export URL=<YOUR_NFT_IMAGE_URL>
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module simple_nft --function mint_nft --args $NFT_NAME $DESCRIPTION $URL
```

再将 mint 的 NFT，转移给指定地址

```bash
# 刚才铸造的 NFT Object ID
export NFT_ID=0xc1d108cdeef7666aa3f414bb3ead5faa7cd351e4dc75d0307e2888b640232787
export ADDRESS=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

# 调用方法
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module simple_nft --function transfer_nft --args $NFT_ID $ADDRESS
```

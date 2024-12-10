---
title: sui-move基础（四）：letsmove-task3
date: 2024-11-16 22:53:05
tags:
---

# sui-move基础（四）：letsmove-task3

### 需求

- 完成 NFT相关知识的学习
- 完成可以mint NFT的合约上链
- 给自己地址mint一个NFT
- NFT必须是自己 github 的头像作为图片
- mint 一个 nft 发送到地址: `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`
- 提交mint到自己地址的浏览器查看(Scan)截图

---

### sui 上的 nft

在编写move_nft之前。我们首先需要了解：什么是nft？

以太坊官方将 NFT 描述为：

- 唯一的数字资产

    NFT 是一类 独一无二的数字资产，每个 NFT 都有独特的元数据，能够标识其所有权和具体特性。例如，艺术品、收藏品、游戏内物品等都可以被表示为 NFT。

- 基于区块链的所有权证明

    通过以太坊区块链上的智能合约，NFT 的所有权是 透明且安全的，每笔转移记录都可以追溯，且不可篡改。

- 不可分割
    
    大多数 NFT 是不可分割的（例如，不像比特币可以分割为更小的单位），它们通常只能作为一个完整的实体进行买卖。

- 遵循标准协议

    NFT 的功能和特性是基于以太坊上的标准协议实现的，其中最常见的是：

    ERC-721: NFT 标准，定义了 NFT 的基础功能。

    ERC-1155: 提供更灵活的功能，可支持同质化代币和非同质化代币的组合。

- 具有可编程性

    NFT 是基于智能合约的，这意味着它们可以支持复杂的交互，例如设置版税（royalties），确保每次转售时，创作者可以获得一定比例的收入。

而sui上的NFT除了具有以上特点以外，还因为sui链的特性拥有了一些额外的特点。

首先，我们引用一下官方文档：


>On Sui, everything is an object. Moreover, everything is a non-fungible token (NFT) as its objects are unique, non-fungible, and owned.
>
>Creating NFTs on Sui differs from other blockchains that are not object based. Those blockchains require a dedicated standard to handle the properties that define NFTs because they are based on a mapping between smart contracts and the token's ID. For instance, the ERC-721 standard on Ethereum was necessary to pair a globally unique ID with the relevant smart contract address to create a unique token instance on the network.
>
>On Sui, every object already has a unique ID, so whether you're dealing with a million fungible tokens, like coins, or thousands of NFTs with individual characteristics, like SuiFrens, your smart contracts on Sui always interact with individual objects.
>
>Imagine you create an Excitable Chimp NFT collection on Sui and another blockchain that isn't object based. To get an attribute like the Chimp's name on the other blockchain, you would need to interact with the smart contract that created the NFT to get that information (typically from off-chain storage) using the NFT ID. On Sui, the name attribute can be a field on the object that defines the NFT itself. This construct provides a much more straightforward process for accessing metadata for the NFT as the smart contract that wants the information can just return the name from the object itself.

翻译一下（来自gpt）：

>在 Sui 中，一切皆为对象。而且，这些对象是独一无二的、不可替代的，并且有所有权，因此可以将其视为不可替代代币（NFT）。
>
>在 Sui 上创建 NFT 的方式与其他非对象为基础的区块链不同。那些区块链需要专门的标准来处理定义 NFT 属性的逻辑，因为它们是基于智能合约和代币 ID 的映射。例如，以太坊上的 ERC-721 标准就是为了将全局唯一的 ID 与相关智能合约地址配对，以在网络上创建一个独特的代币实例。
>
>而在 Sui 上，每个对象已经有了唯一的 ID，因此，无论你处理的是像硬币这样的数百万可替代代币，还是像 SuiFrens 这样的具有个体特性的数千个 NFT，你在 Sui 上的智能合约始终是与单独的对象交互。
>
>假设你在 Sui 上创建了一个名为“Excitable Chimp”（激动的黑猩猩）的 NFT 收藏品，同时也在其他非对象为基础的区块链上创建了同样的收藏品。在其他区块链上，如果你想获取黑猩猩的名字等属性，你需要通过创建 NFT 的智能合约，利用 NFT 的 ID 来获取这些信息（通常存储在链下）。而在 Sui 上，名称属性可以直接作为定义 NFT 的对象的一个字段。这种设计使得访问 NFT 元数据的过程更加简便，因为想要这些信息的智能合约可以直接从对象本身返回名称，而无需复杂的额外操作。

总结一下，就是：

1. 一切皆对象，且皆为 NFT

2. 无需专门的 NFT 标准

3. 智能合约直接与对象交互

了解了以上信息以后，我们很清楚NFT在sui上自然也有其独特的实现。

### 代码讲解

我们来看一下代码：

```rust
module move_nft::move_nft {
    use std::string;
    use sui::url::{Self, Url};
    use sui::event;

    public struct MOVENFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    public struct NFTMinted has copy, drop {
        // The Object ID of the NFT
        object_id: ID,
        // The creator of the NFT
        creator: address,
        // The name of the NFT
        name: string::String,
    }


    /// Get the NFT's `name`
    public fun name(nft: &MOVENFT): &string::String {
        &nft.name
    }

    /// Get the NFT's `description`
    public fun description(nft: &MOVENFT): &string::String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun url(nft: &MOVENFT): &Url {
        &nft.url
    }

    // ===== Entrypoints =====

    #[allow(lint(self_transfer))]
    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = ctx.sender();
        let nft = MOVENFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    #[allow(lint(self_transfer))]
    public entry fun mint(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let sender = ctx.sender();
        let nft = MOVENFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, recipient);
    }

    /// Transfer `nft` to `recipient`
    public entry fun transfer(
        nft: MOVENFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// Update the `description` of `nft` to `new_description`
    public entry fun update_description(
        nft: &mut MOVENFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    /// Permanently delete `nft`
    public entry fun burn(nft: MOVENFT, _: &mut TxContext) {
        let MOVENFT { id, name: _, description: _, url: _ } = nft;
        id.delete()
    }
}
```

首先我们需要注意两个结构体：

```rust
public struct MOVENFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

public struct NFTMinted has copy, drop {
        // The Object ID of the NFT
        object_id: ID,
        // The creator of the NFT
        creator: address,
        // The name of the NFT
        name: string::String,
    }
```

首先，每一个结构体拥有什么、哪些能力(trait)，这都是不可忽视的，在官方文档中，我们可以看到：

- 具有 key 能力的结构体被认为是一个对象，并且可以在存储函数中使用。Sui 验证器要求结构体的第一个字段必须命名为 id，并且类型为 UID。

- >store是一种特殊的能力，允许将类型存储在对象中。该能力是字段可以在具有key能力的结构体中使用的必需条件。换句话说，store能力允许值被包装在对象中。

- 在 Move 中，类型上的 copy 能力表示该类型的实例或值可以被复制。

- drop 能力是最简单的能力，允许对结构体的实例进行“忽略”或“丢弃”。在Move中，不允许忽略没有drop能力的结构体。

另外，注意：

具有 key 能力的结构体仍然是一个结构体，可以拥有任意数量的字段和关联函数。对于打包、访问或解包结构体，并没有特殊的处理或语法要求。

然而，由于对象结构体的第一个字段必须是类型为 UID 的字段 - 一个不可复制也不可丢弃的类型，因此结构体本身在设计上是不可丢弃的。

那么现在来看一下`MOVENFT`结构体：

> 我们定义了这样一个结构体，它有id、name、description、url这四个子项，其中url这个子项我们需要赋值一个外部链接，使得我们的NFT与该链接包含的内容联系起来——反过来说，我们给那个内容添加了一个唯一的token，也就是我们的NFT。

而`NFTMinted`结构体，主要用于：

> 保存NFT的object id、创建者地址、NFT的名字

在其余的函数里，逻辑都比较简单，我们主要只看`mint`，以`mint_to_sender`为例：
```rust
#[allow(lint(self_transfer))]
    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = ctx.sender();
        let nft = MOVENFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }
```

这个函数的主要功能便是使用传入的参数为NFT赋值（也就是相当于锻造了一个新的NFT），当然其中具有唯一性的只有id（这在sui中的实现实在过于简单，使得我们可能容易忽略它）。

若对id的产生感兴趣，我们溯源到如下代码：

```rust
/// Native function for deriving an ID via hash(tx_hash || ids_created)
native fun derive_id(tx_hash: vector<u8>, ids_created: u64): address;
```

它通过tx_hash和ids_created来产生一个address。

在那之后，我们触发一个event，告知我们铸造了一个NFT，另一个结构体`NFTMinted`在这里派上了用场。

最后，我们将NFT发送给我们预先通过`let sender = ctx.sender();`获取的sender。

在这之后的部署上链和调用，我们在上一节已讲过，大同小异，不再赘述。
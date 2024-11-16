# （四）使用Move在Sui上发行第一个NFT
## 0. 在开始之前
本系列文章将深入浅出的全面讲解Move语言。 
   
> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH.png)
## 1. 概述

根据HOH社区教学材料，实现了一个简单的 NFT 发行功能。包含以下主要功能：
- 初始化 NFT 系统
- 发行 NFT
- 销毁 NFT

## 2. 主要结构

模块主要包括以下四个结构体：
- `LIZHECOMENFT`: 用于初始化模块，没有存储具体数据。
- `GithubNFT`: NFT 实体结构，包含 NFT 的基本信息。
- `NFTMinted`: 事件结构，用于在 NFT 发行时触发事件。
- `MintRecord`: 记录 NFT 发行情况，防止重复发行。

以下是详细的结构体定义：

```move
// 用于初始化模块
public struct LIZHECOMENFT has drop {}

// NFT 实体结构，包含 NFT 的相关信息
public struct GithubNFT has key, store {
    id: UID,               // 唯一标识符
    nft_id: u64,           // NFT 编号
    name: String,          // NFT 名称
    image_url: String,     // 图片链接
    creator: address,      // 创作者地址
    recipient: address,    // 接收者地址
}

// 发行事件结构，用于记录 NFT 发行时的事件
public struct NFTMinted has copy, drop {
    object_id: ID,         // NFT 对象 ID
    creator: address,      // 创作者地址
    name: String,          // NFT 名称
}

// 记录 NFT 发行情况，防止重复发行
public struct MintRecord has key {
    id: UID,               // 唯一标识符
    record: Table<address, u64>, // 发行记录
}
```

## 3. 常量定义

```move
const MAX_SUPPLY: u64 = 10;       // 最大发行量为 10
const ENotEnoughSupply: u64 = 0;  // 错误码：供应不足
const EDontMintAgain: u64 = 1;    // 错误码：不能重复发行
```

## 4. 初始化函数

`init` 函数用于初始化 NFT 发行模块。主要步骤如下：
1. 创建元数据键值对列表。
2. 创建 `MintRecord` 对象用于记录 NFT 发行信息。
3. 初始化并发布模块，更新 `display` 显示字段。
4. 将 `MintRecord` 和 `display` 转移给调用者（`ctx.sender()`）。

```move
fun init(otw: LIZHECOMENFT, ctx: &mut TxContext) {
    let keys = vector[
        utf8(b"name"),
        utf8(b"description"),
        utf8(b"image_url"),
        utf8(b"creator"),
    ];
    let values = vector[
        utf8(b"{name} #{nft_id}"),
        utf8(b"A NFT for your Github avatar"),
        utf8(b"{image_url}"),
        utf8(b"{creator}"),
    ];

    let mint_record = MintRecord {
        id: object::new(ctx),
        record: table::new<address, u64>(ctx),
    };

    let publisher = package::claim(otw, ctx);
    let mut display = display::new_with_fields<GithubNFT>(&publisher, keys, values, ctx);

    transfer::share_object(mint_record);
    display::update_version(&mut display);
    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());
}
```

## 5. 发行 NFT 函数

`mint` 函数用于发行新的 NFT，并将其转移给接收者。主要逻辑包括：
1. 检查接收者是否已经拥有 NFT，避免重复发行。
2. 获取当前发行数量并分配 `nft_id`。
3. 检查 `nft_id` 是否超出最大供应量 `MAX_SUPPLY`。
4. 创建 `GithubNFT` 实例并触发 `NFTMinted` 事件。
5. 将新创建的 NFT 转移给指定的接收者。

```move
public entry fun mint(
    mint_record: &mut MintRecord, 
    name: String, 
    image_url: String, 
    recipient: address, 
    ctx: &mut TxContext
) {
    assert!(!table::contains(&mint_record.record, recipient), EDontMintAgain);
  
    let nft_id: u64 = table::length(&mint_record.record) + 1;
    table::add(&mut mint_record.record, recipient, nft_id);
    assert!(nft_id <= MAX_SUPPLY, ENotEnoughSupply);

    let nft = GithubNFT {
        id: object::new(ctx),
        nft_id,
        name,
        image_url,
        creator: ctx.sender(),
        recipient,
    };

    event::emit(NFTMinted {
        object_id: object::id(&nft),
        creator: ctx.sender(),
        name: nft.name,
    });

    transfer::public_transfer(nft, recipient);
}
```

## 6. 销毁 NFT 函数

`burn` 函数用于销毁已发行的 NFT，并从 `MintRecord` 中移除相应记录。步骤如下：
1. 从 `MintRecord` 的 `record` 表中移除接收者的记录。
2. 删除 `GithubNFT` 对象。

```move
public entry fun burn(mint_record: &mut MintRecord, nft: GithubNFT) {
    table::remove(&mut mint_record.record, nft.recipient);
    let GithubNFT { id, nft_id: _, name: _, image_url: _, creator: _, recipient: _, } = nft;
    object::delete(id);
}
```

## 7. 合约交互

以下是与该合约交互的命令示例，展示了如何在 Sui 区块链上进行初始化、铸造 NFT 和销毁 NFT。

7.1 合约部署

首先，需要在sui上部署合约

```sh
sui client publish
```


7.2 发行 NFT

调用 `mint` 方法来铸造 NFT，传入 `mint_record` 对象、NFT 名称、图片 URL、接收者地址。

```sh
sui client call \
  --function mint \
  --module lizhecomenft \
  --package <PACKAGE_ID> \
  --args <MINT_RECORD_OBJECT_ID> "My First NFT" "https://example.com/nft.png" <RECIPIENT_ADDRESS> \
  --gas-budget 1000
```
- `<MINT_RECORD_OBJECT_ID>`: `MintRecord` 对象的 ID。
- `"My First NFT"`: NFT 名称。
- `"https://example.com/nft.png"`: NFT 的图片 URL。
- `<RECIPIENT_ADDRESS>`: 接收者的钱包地址。

7.3 销毁 NFT

使用 `burn` 方法销毁 NFT，移除记录并删除 NFT 对象。

```sh
sui client call \
  --function burn \
  --module lizhecomenft \
  --package <PACKAGE_ID> \
  --args <MINT_RECORD_OBJECT_ID> <NFT_OBJECT_ID> \
  --gas-budget 1000
```
- `<NFT_OBJECT_ID>`: 要销毁的 NFT 的对象 ID。

## 8. 完成撒花～～～

通过这段代码，我们就可以在 Sui 区块链上用 Move 语言发行第一个简单的 NFT。整体流程其实很清晰，分为三个主要步骤：
- 初始化：首先我们用 init 函数来设置系统，创建一个记录表，用来跟踪哪些地址已经领取了 NFT。这一步相当于为项目打好基础，准备好后续的发行工作。
- 铸造 NFT：然后就是 mint 方法，这部分是核心功能。我们给每个用户生成一个带有编号的 NFT，同时限制最大供应量为 10 个，避免超发。这里还用表来检查用户是否已经领取过 NFT，确保每个人只能获得一次，不会重复领取。
- 销毁 NFT：最后一个功能是 burn 方法，方便用户或者系统在需要时销毁 NFT，并移除记录。这样可以释放掉链上的存储空间，也让整个系统更加灵活。

整个合约的设计思路比较简单明了，非常适合入门学习。我们通过几个基础的操作，就实现了 NFT 的发行、管理和销毁。从实际使用来看，交互命令也是很直观的，只需要按步骤执行，就可以完成从初始化到铸造再到销毁的全流程。

对于刚接触 Move 和 Sui 的开发者来说，这个例子是一个很好的入门项目，能帮助大家快速理解链上资产的管理和智能合约的基本结构。随着熟练度的提升，我们可以在这个基础上，进一步扩展更多功能，比如添加更多的元数据、增加 NFT 的转售功能等等。
# MOVE共学营TASK3教程
💧  [HOH水分子公众号](https://mp.weixin.qq.com/s/d0brr-ao6cZ5t8Z5OO1Mog)

🌊  [HOH水分子X账号](https://x.com/0xHOH)

📹  [课程B站账号](https://space.bilibili.com/3493269495352098)

💻  Github仓库 https://github.com/move-cn/letsmove

🧑‍💻作者：gracecampo

## MOVE共学营中的TASK3教程
### 1. 代码部分
> 定义NFT结构体
```sui move
    public struct GRACECAMPO_NFT has store, key {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }
```
>定义监听事件
```sui move
    public struct GRACECAMPO_NFT_Minted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }
```
>定义铸造函数
```sui move
public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = GRACECAMPO_NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };

        event::emit(GRACECAMPO_NFT_Minted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }
```
>定义转移函数,
```sui move
    public entry fun transfer(
        nft: GRACECAMPO_NFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }
    public entry fun update_description(
        nft: &mut GRACECAMPO_NFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }
```
### 2. 铸造NFT
>调用铸造函数
```shell
sui client call --package PACKAGEID --module GRACECAMPO_NFT --function mint_to_sender args NFT名称 NFT描述 NFT图片地址
```
调用成功后，需要记录NFT的OBJECTID,方便区块浏览器查看
### 3. 转移NFT
>转移NFT
```shell
sui client call --package PACKAGEID --module GRACECAMPO_NFT --function transfer args NFT-OBJECTID recipient-address
```
调用成功后，需要记录交易hash,方便区块浏览器查看

合约中的铸造和转移函数声明为entry,如果不熟悉命令行调用也可支持在区块浏览器调用

### 4. 查看交易信息
查看NFT信息：(注意合约发布环境)
>测试网
>> https://suiscan.xyz/testnet/object/NFT-OBJECTID
> 
>> https://suiscan.xyz/testnet/tx/transfer-hash
> 
>主网
>> https://suiscan.xyz/mainnet/object/NFT-OBJECTID
> 
>> https://suiscan.xyz/mainnet/tx/transfer-hash


module xushizhao_nft::xushizhao_nft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct XUSHiZHAO_NFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    // ===== Events ===== 事件
    public struct NFTMinted has copy, drop {
        // 新铸造的NFT的ID
        object_id: ID,
        // 新铸造的NFT的创造者
        creator: address,
        // 新铸造的NFT的名
        name: string::String,
    }
 

    // ===== Entrypoints ===== 入口函数
    /// 创建新的NFT
    /// Create a new devnet_nft
    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = XUSHiZHAO_NFT {
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

    /// 转移NFT    
    public entry fun transfer(
        nft: XUSHiZHAO_NFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }
  


    #[test]
    public fun test_mint_to_sender() {
        //创建一个虚拟用户
        let mut ctx = tx_context::dummy();

        let name:vector<u8> = b"xutestnft";
        let description :vector<u8> = b"xddescription";
        let url :vector<u8> = b"https://avatars.githubusercontent.com/u/12756826?v=4";

        mint_to_sender(name,description,url,&mut ctx);


    }

}


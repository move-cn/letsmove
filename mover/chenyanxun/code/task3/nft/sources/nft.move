module nft::nft {
    use std::string::{String, utf8};
    use sui::package;
    use sui::display;
    use sui::table::{Self, Table};
    use sui::event;

    // 最大供应量
    const MAX_SUPPLY: u64 = 10;
    // 超过供应量
    const ENotEnoughSupply: u64 = 0;
    // 重复铸造
    const EDontMintAgain: u64 = 1;

    public struct NFT has drop {}

    public struct GithubNFT has key, store {
        id: UID,
        nft_id: u64,
        name: String,
        image_url: String,
        creator: address,
        recipient: address,
    }

    public struct MintRecord has key {
        id: UID,
        record: Table<address, u64>,
    }

    public struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: String,
    }


    fun init(otw: NFT, ctx: &mut TxContext) {
        let publisher = package::claim(otw, ctx);

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

        let mut display = display::new_with_fields<GithubNFT>(&publisher, keys, values, ctx);

        display::update_version(&mut display);

        transfer::public_transfer(publisher, ctx.sender());
        transfer::public_transfer(display, ctx.sender());

        transfer::share_object(mint_record);
    }

    public entry fun mint(mint_record: &mut MintRecord, name: String, image_url: String, recipient: address, ctx: &mut TxContext) {
        assert!(!table::contains(&mint_record.record, recipient), EDontMintAgain);

        let nft_id: u64 = table::length(&mint_record.record) + 1;

        assert!(nft_id <= MAX_SUPPLY, ENotEnoughSupply);

        table::add(&mut mint_record.record, recipient, nft_id);
        let nft = GithubNFT {
            id: object::new(ctx),
            nft_id,
            name,
            image_url,
            creator: ctx.sender(),
            recipient,
        };

        let nft_minted = NFTMinted {
            object_id: object::id(&nft),
            creator: ctx.sender(),
            name,
        };

        transfer::public_transfer(nft, recipient);
        event::emit(nft_minted);
    }

    public entry fun burn(mint_record: &mut MintRecord, nft: GithubNFT) {
        table::remove(&mut mint_record.record, nft.recipient);
        let GithubNFT { id, nft_id: _, name: _, image_url: _, creator: _, recipient: _, } = nft;
        object::delete(id);
    }
}


//本地调用合约函数 记得将以下参数地址修改为自己的地址
// export PACKAGE="0xd9c563831cfd7bbd58336da6aba73359b37fedbd24f32ebc5ecc619331f15512"
// export MODULE="github_nft"
// export MINTRECORD="0xca28c8d82f4e401aa47de7ea57ccea32d82287248658024b5f565f66ec018f8b"
// export RECIPIENT="0xaf0e50c4619f5bdbcda69b33807b32088d53c8bcc928e5ee3fb343bb3f37492e"
// sui client call --package 0x9a9b278b08a15d9c7892d91e7625018c1f68ababf3517523c2bd224657d714b0 --module nft --function mint --args 0xd9df44fb63528908b2b29c5943005cb6e5d6548106d72d5140a0789429e1f6d4 "chenyanxun NFT" "https://avatars.githubusercontent.com/u/19866732?v=4" 0x3433e27dbe077c5679e941c8099fadceabf2b05e5e0ee03d573014ecb987b7e1
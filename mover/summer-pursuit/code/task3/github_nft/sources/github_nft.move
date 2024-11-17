module github_nft::github_nft {
    use std::string::{String, utf8};
    use sui::package;
    use sui::display;
    use sui::table::{Self, Table};
    use sui::event;

    public struct GITHUB_NFT has drop {}

    public struct GithubNFT has key, store {
        id: UID,
        nft_id: u64,
        name: String,
        image_url: String,
        creator: address,
        recipient: address,
    }

    public struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: String,
    }

    public struct MintRecord has key {
        id: UID,
        record: Table<address, u64>,
    }

    const MAX_SUPPLY: u64 = 10;

    const ENotEnoughSupply: u64 = 0;

    const EDontMintAgain: u64 = 1;

    fun init(otw: GITHUB_NFT, ctx: &mut TxContext) {
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

    public entry fun mint(mint_record: &mut MintRecord, name: String, image_url: String, recipient: address, ctx: &mut TxContext) {
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

    public entry fun burn(mint_record: &mut MintRecord, nft: GithubNFT) {
        table::remove(&mut mint_record.record, nft.recipient);
        let GithubNFT { id, nft_id: _, name: _, image_url: _, creator: _, recipient: _, } = nft;
        object::delete(id);
    }
}
//sui client call --package 0x1feebc0d200e7bc3572d9d12f4342c94605d4b30d821004cec350da5b681fab8 --module github_nft --function mint --args 0x99c14b9e05281482207502488676b247e88f4a2a157ba2285547868045dc0e09 "Github NFT" "https://avatars.githubusercontent.com/u/125129746" 0xe9e6c638b23ecb4f74eac4cd48531ee31cce065f5ee3bd78a3406d72c6d80358

//sui client call --package 0x442b4800ca683e9908de8aed52ce4dca0737556fb75254a7819a55a37315767e --module github_nft --function burn --args 0x926ae4f58f39f31038c399e66754e2e7bd16c17fd798a7ffed9a749335e11d61 0xd718e4503388283bbcd7efc1ce9e32e06790d95fc3d71c1338480ee593d77844 --gas-budget 100000000
/// Module: github_nft
module github_nft::tianhun_github_nft {
    use std::string::{ String, utf8 };
    use sui::display;
    use sui::event;
    use sui::package;
    use sui::table::{ Self, Table};

    const MAX_SUPPLY: u64 = 100;
    const ENotEnoughSupply: u64 = 0;
    const EDontMintAgain: u64 = 1;

    public struct TIANHUN_GITHUB_NFT has drop {}

    public struct TianHunGithubNFT has key, store {
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
        id: ID,
        creator: address,
        name: String,
    }

    fun init(otw: TIANHUN_GITHUB_NFT, ctx: &mut TxContext) {
        let publisher = package::claim(otw, ctx);

        let displayKeys = vector[
            utf8(b"name"),
            utf8(b"description"),
            utf8(b"image_url"),
            utf8(b"creator"),
        ];

        let displayValues = vector[
            utf8(b"{name} #{nft_id}"),
            utf8(b"A NFT for your Github avatar"),
            utf8(b"{image_url}"),
            utf8(b"{creator}"),
        ];

        let mint_record = MintRecord {
            id: object::new(ctx),
            record: table::new<address, u64>(ctx),
        };

        let mut display = display::new_with_fields<TianHunGithubNFT>(
            &publisher,
            displayKeys,
            displayValues,
            ctx,
        );

        display::update_version(&mut display);

        transfer::public_transfer(publisher, ctx.sender());
        transfer::public_transfer(display, ctx.sender());

        transfer::share_object(mint_record);
    }

    public entry fun mint(
        mint_record: &mut MintRecord,
        name: String,
        image_url: String,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        // Check if the recipient has already received a NFT
        assert!(!table::contains(&mint_record.record, recipient), EDontMintAgain);

        let nft_id = table::length(&mint_record.record) + 1;
        assert!(nft_id <= MAX_SUPPLY, ENotEnoughSupply);

        table::add(&mut mint_record.record, recipient, nft_id);

        let nft = TianHunGithubNFT {
            id: object::new(ctx),
            nft_id,
            name,
            image_url,
            creator: ctx.sender(),
            recipient,
        };

        let nft_minted = NFTMinted {
            id: object::id(&nft),
            creator: ctx.sender(),
            name,
        };

        transfer::public_transfer(nft, recipient);

        event::emit(nft_minted);
    }

    public entry fun burn(
        mint_record: &mut MintRecord,
        nft: TianHunGithubNFT,
    ) {
        table::remove(&mut mint_record.record, nft.recipient);
        let TianHunGithubNFT { id, nft_id: _, name: _, image_url: _, creator: _, recipient: _ } = nft;

        object::delete(id);
    }
}

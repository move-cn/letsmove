/// Module: my_nft
module my_nft::my_nft {
    use std::string::{String,utf8};
    use sui::table::{Self,Table};
    use sui::package;
    use sui::display;
    use sui::event;


    const MAX_SUPPLY:u64 = 10;
    const ENotEnoughSupply:u64= 0;
    const EDontMintAgain:u64 = 1;

    public struct MY_NFT has drop{}

    public struct Github_Nft has key,store{
        id:UID,
        nft_id:u64,
        name:String,
        image_url:String,
        creator:address,
        recipient:address,
    }

    public struct MintRecord has key {
        id: UID,
        record:Table<address,u64>,
    }

    public struct NFTMinted has copy,drop{
        object_id:ID,
        creator:address,
        name:String,
    }

    fun init(otw:MY_NFT,ctx:&mut TxContext){
        let publisher = package::claim(otw,ctx);

        let keys = vector[
            utf8(b"name"),
            utf8(b"description"),
            utf8(b"image_url"),
            utf8(b"creator"),
        ];

        let values = vector[
            utf8(b"{name} ${nft_id}"),
            utf8(b"A NFT for your Github avata"),
            utf8(b"https://avatars.githubusercontent.com/u/12596742?v=4"),
            utf8(b"This is June5753 MyNFT"),
        ];

        let mint_record = MintRecord{
            id:object::new(ctx),
            record:table::new<address,u64>(ctx),
        };

        let mut _display = display::new_with_fields<Github_Nft>(&publisher,keys,values,ctx);
        display::update_version(&mut _display);
        transfer::public_transfer(publisher,ctx.sender());
        transfer::public_transfer(_display,ctx.sender());
        transfer::share_object(mint_record);
    }

    // sui call 中对应 4个参数
    public entry fun mint(mint_record:&mut MintRecord,name:String,image_url:String,recipient: address,ctx:&mut TxContext){
        assert!(!table::contains(&mint_record.record,recipient),EDontMintAgain);
        let nft_id = table::length(&mint_record.record)+1;
        assert!(nft_id <= MAX_SUPPLY,ENotEnoughSupply);
        table::add(&mut mint_record.record,recipient,nft_id);
        let nft:Github_Nft = Github_Nft{
            id:object::new(ctx),
            name,
            image_url,
            nft_id,
            recipient,
            creator:ctx.sender(),
        };
        event::emit(NFTMinted{
            object_id:object::id(&nft),
            name,
            creator:ctx.sender(),
        });
        transfer::public_transfer(nft,recipient);
    }

    public entry fun burn(mint_record:&mut MintRecord,nft:Github_Nft){
        table::remove(&mut mint_record.record,nft.recipient);
        let Github_Nft{id,recipient:_,name:_,nft_id:_,creator:_,image_url:_}=nft;
        object::delete(id);
    }

    // mint中注意 mint_record中的id
    // https://suiscan.xyz/mainnet/object/0x519749e34e829531fa9f68405d416e3b4bc20bf36c36d4b39ee16f0da45cd6c6
   // sui client call --package 0x70bee25061b84faf1d03692ef5c678fc40ab99207f85255798632d9a5f7d6ead --module my_nft
    // --function mint --args 0x519749e34e829531fa9f68405d416e3b4bc20bf36c36d4b39ee16f0da45cd6c6 "JUNE5753 NFT" "https://avatars.githubusercontent.com/u/12596742?v=4" 0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3
}

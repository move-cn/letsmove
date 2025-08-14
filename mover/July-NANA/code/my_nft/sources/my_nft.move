module my_nft::my_nft {
    use std::address;
    use std::string::{String, utf8};
    use sui::display;
    use sui::event;
    use sui::object;
    use sui::package;
    use sui::table;
    use sui::table::Table;

    public struct JOJONFT has key, store{
        id: UID,
        nft_id: u64,
        name: String,
        image_url: String,
        creator: address,
        recipient: address
    }

    public struct MY_NFT has drop {}

    public struct MintRecord has key{
        id:UID,
        record:Table<address,u64>
    }

    public struct NFTMinted has copy,drop{
        object_id: ID,
        creator: address,
        name: String,
    }

    const EDontMintAgain:u64=0;
    const ENotEnoughSupply:u64=1;
    const MAX_SUPPLY:u64=46;

    fun init(otw: MY_NFT,ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
            utf8(b"description"),
            utf8(b"creator")];
        let values = vector[
            utf8(b"{name} #{nft_id}"),
            utf8(b"{image_url}"),
            utf8(b"A NFT for your Github avatar"),
            utf8(b"{creator}"),
        ];
        let mint_record=MintRecord{
            id:object::new(ctx),
            record:table::new<address,u64>(ctx)
        };
        let publisher=package::claim(otw,ctx);
        let mut display=display::new_with_fields<JOJONFT>(&publisher,keys,values,ctx);
        display::update_version(&mut display);
        transfer::public_transfer(publisher,ctx.sender());
        transfer::public_transfer(display, ctx.sender());
        transfer::share_object(mint_record);

    }

    public entry fun mint(mint_record:&mut MintRecord,name:String,image_url:String,recipient: address,ctx:&mut TxContext){
        assert!(!table::contains(&mint_record.record, recipient), EDontMintAgain);

        let nft_id:u64=table::length(&mint_record.record)+1;
        table::add(&mut mint_record.record,recipient,nft_id);
        assert!(nft_id <= MAX_SUPPLY, ENotEnoughSupply);

        let nft=JOJONFT{
            id:object::new(ctx),
            nft_id:nft_id,
            name,
            image_url,
            creator:ctx.sender(),
            recipient:recipient
        };

        event::emit(NFTMinted{
            object_id:object::id(&nft),
            name:name,
            creator:ctx.sender(),
        });

        transfer::public_transfer(nft,recipient);
    }

    public entry fun burn(mint_record:&mut MintRecord,nft:JOJONFT){
        table::remove(&mut mint_record.record,nft.recipient);
        let JOJONFT{id,nft_id,name,image_url,recipient,creator}=nft;
        object::delete(id);
    }
}
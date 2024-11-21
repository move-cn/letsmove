module mynft::dao{
    use nft_protocol::attributes::Attributes;
    use nft_protocol::collection;
    use sui::url::Url;

    public struct DAO has drop{}

    public struct DaoNFT has key,store{
        id:UID,
        name:String,
        description:String,
        url:Url,
        attributes:Attributes,
    }

    fun init(otw:DAO,ctx:&mut TxContext){
        let (collection,mint_cap) = collection::create_with_mint_cap<DAO,DaoNFT>(
            &otw,option::none(),ctx
        );
        transfer::public_share_object(collection);
        transfer::public_share_object(mint_cap);
    }
}
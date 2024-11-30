module coin_own::yuan_da_tou{
    use sui::coin;
    use sui::url;
    const YdtUrl:vector<u8>  = b"https://images.ebaiyin.com/fileImgs/Ebaiyin.Ebaiyin/KingEditor/20171103/26db18bb30ac48a094f4d00481e7b66d.jpg";

    public struct YUAN_DA_TOU has drop{ }

    fun init( otw :YUAN_DA_TOU , ctx : &mut TxContext)
    {
        let (cap,meta) = coin::create_currency(
                otw, 
                3, 
                b"YDT",
                b"yuan da tou", 
                b"silver coin,minted by the president of yuan shih-k'ai",
                option::some(url::new_unsafe_from_bytes(YdtUrl)),
                ctx);

        transfer::public_transfer(cap,ctx.sender());
        transfer::public_freeze_object(meta);
    }

}


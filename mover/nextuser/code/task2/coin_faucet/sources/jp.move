//use as faucet
module coin_faucet::jp{
    use sui::coin;
    use sui::url;
    const JyqUrl:vector<u8> = b"https://tse4-mm.cn.bing.net/th/id/OIP-C.XVkbV--98d7_YfeLR2a_fAHaHa?rs=1&pid=ImgDetMain";

    public struct JP has drop{ }
    
    fun init( otw :JP , ctx : &mut TxContext)
    {
        let (cap,meta) = coin::create_currency(
                otw, 
                0, 
                b"YEN",
                b"YEN of Japan", 
                b"Japanese money",
                option::some(url::new_unsafe_from_bytes(JyqUrl)),
                ctx);

        transfer::public_share_object(cap);
        transfer::public_freeze_object(meta);
    }
}